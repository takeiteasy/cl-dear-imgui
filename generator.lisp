;;;; generator.lisp
;;;; Standalone generator for cl-dear-imgui CFFI bindings from dcimgui.json

(defpackage #:cl-dear-imgui/generator
  (:use #:cl)
  (:export #:generate-bindings))

(in-package #:cl-dear-imgui/generator)

(defvar *current-metadata* nil
  "Current metadata being processed (for type lookups during generation).")

(defvar *struct-names* nil
  "Hash-table of struct names (for detecting by-value struct arguments).")

(defun generate-bindings (json-file package-file bindings-file &key shim-file)
  "Read JSON-FILE and generate PACKAGE-FILE and BINDINGS-FILE.
   SHIM-FILE is the path to abi_shim.cpp; if not provided, looks for abi_shim.cpp
   next to JSON-FILE.  Functions that pass structs by value are omitted from the
   generated bindings and checked against the shim for coverage."
  (handler-case
      (let* ((json-data (parse-json-file json-file))
             (metadata (extract-metadata json-data))
             (effective-shim (or shim-file
                                 (make-pathname :name "abi_shim" :type "cpp"
                                                :defaults json-file))))

        ;; Set global metadata / struct-name set for type lookups
        (setf *current-metadata* metadata)
        (setf *struct-names* (build-struct-names-set (getf metadata :structs)))

        ;; Collect by-value functions and compute shim names FIRST so they
        ;; can be included in the package exports.
        (let* ((by-value      (collect-by-value-struct-functions (getf metadata :functions)))
               (manual-cov   (parse-shim-covered-names effective-shim))
               (need-shim    (remove-if
                              (lambda (fn)
                                (let ((orig (gethash "original_fully_qualified_name" fn)))
                                  (and orig (gethash orig manual-cov))))
                              by-value))
               (gen-cpp      (make-pathname :name "abi_shim_generated" :type "cpp"
                                            :defaults effective-shim))
               (gen-lisp     (make-pathname :name "shim_generated" :type "lisp"
                                            :defaults effective-shim))
               ;; Pre-compute shim lisp names for export (exclude varargs functions).
               ;; Use the original function name as the Lisp symbol (matching generate-lisp-shim).
               (shim-exports (loop for fn in need-shim
                                   unless (func-has-real-varargs-p fn)
                                   collect (format-symbol-name (gethash "name" fn)))))

          (format t "Generating package file: ~A~%" package-file)
          (generate-package-file package-file metadata :extra-exports shim-exports)

          (format t "Generating bindings file: ~A~%" bindings-file)
          (generate-bindings-file bindings-file metadata)

          (when by-value
            (format t "~%~D function(s) pass structs by value (~D already manually shimmed).~%"
                    (length by-value) (- (length by-value) (length need-shim)))
            (format t "Generating shims for ~D remaining function(s)...~%"
                    (length need-shim))
            (multiple-value-bind (n-gen n-skip covered-orig)
                (write-generated-shims need-shim gen-cpp gen-lisp)
              (format t "  Generated: ~D  Skipped (varargs): ~D~%" n-gen n-skip)
              (format t "  - ~A~%" gen-cpp)
              (format t "  - ~A~%" gen-lisp)
              (format t "~%Checking shim coverage...~%")
              (check-shim-coverage by-value effective-shim covered-orig))))

        (format t "~%Successfully generated bindings!~%")
        (format t "  - ~A~%" package-file)
        (format t "  - ~A~%" bindings-file)
        t)
    (error (e)
      (format t "~%Error generating bindings: ~A~%" e)
      nil)))

(defun parse-json-file (filepath)
  "Parse JSON file and return parsed data structure."
  (handler-case
      (with-open-file (stream filepath :direction :input)
        (com.inuoe.jzon:parse stream))
    (file-error (e)
      (error "Failed to open JSON file ~A: ~A" filepath e))
    (error (e)
      (error "Failed to parse JSON file ~A: ~A" filepath e))))

(defun extract-metadata (json-data)
  "Extract and organize metadata from parsed JSON."
  (list :defines (gethash "defines" json-data)
        :enums (gethash "enums" json-data)
        :typedefs (gethash "typedefs" json-data)
        :structs (gethash "structs" json-data)
        :functions (gethash "functions" json-data)))

(defun is-enum-type-p (type-name all-enums)
  "Check if a type name refers to an enum."
  (when all-enums
    (loop for enum across all-enums
          thereis (string= (gethash "name" enum) type-name))))

(defun map-type-description (desc &optional metadata)
  "Map a type description from JSON to CFFI type specifier.
   METADATA is optional and used to check if a User type is an enum.
   If not provided, uses *current-metadata*."
  (when (null desc)
    (return-from map-type-description :void))

  (let ((kind (gethash "kind" desc))
        (meta (or metadata *current-metadata*)))
    (handler-case
        (cond
          ((string= kind "Builtin")
           (map-builtin-type (gethash "builtin_type" desc)))

          ((string= kind "Pointer")
           (map-pointer-type desc meta))

          ((string= kind "Array")
           (map-array-type desc meta))

          ((string= kind "Function")
           :pointer) ; Function types become :pointer

          ((string= kind "User")
           (let* ((type-name (gethash "name" desc)))
             (cond
               ;; Anonymous or internal types (starting with __) -> use :pointer
               ((and (>= (length type-name) 2)
                     (string= (subseq type-name 0 2) "__"))
                :pointer)
               ;; Variadic argument types -> use :pointer
               ((or (search "va_list" type-name)
                    (search "Va_List" type-name))
                :pointer)
               ;; Standard C library types -> map to CFFI primitives
               ((string= type-name "size_t") :size)
               ((string= type-name "ssize_t") :ssize)
               ((string= type-name "ptrdiff_t") :ptrdiff)
               ((string= type-name "intptr_t") :intptr)
               ((string= type-name "uintptr_t") :uintptr)
               ;; C++ string types -> use :pointer (opaque)
               ((or (string= type-name "ImStr")
                    (string= type-name "std::string"))
                :pointer)
               ;; Enum types use im- prefixed lowercase kebab-case symbol names
               ((and meta (is-enum-type-p type-name (getf meta :enums)))
                (intern (string-upcase (format-enum-name type-name))))
               ;; Structs and typedefs use uppercase type names
               (t
                (intern (string-upcase (format-type-name type-name)))))))

          ((string= kind "Type")
           (map-type-description (gethash "inner_type" desc) meta))

          (t
           (warn "Unknown type kind: ~A, using :pointer as fallback" kind)
           :pointer))
      (error (e)
        (warn "Error mapping type ~A: ~A, using :pointer" desc e)
        :pointer))))

(defun map-builtin-type (builtin-name)
  "Map C builtin types to CFFI primitive types."
  (cond
    ((string= builtin-name "void") :void)
    ((string= builtin-name "char") :char)
    ((string= builtin-name "unsigned_char") :unsigned-char)
    ((string= builtin-name "short") :short)
    ((string= builtin-name "unsigned_short") :unsigned-short)
    ((string= builtin-name "int") :int)
    ((string= builtin-name "unsigned_int") :unsigned-int)
    ((string= builtin-name "long") :long)
    ((string= builtin-name "unsigned_long") :unsigned-long)
    ((string= builtin-name "long_long") :long-long)
    ((string= builtin-name "unsigned_long_long") :unsigned-long-long)
    ((string= builtin-name "float") :float)
    ((string= builtin-name "double") :double)
    ((string= builtin-name "long_double") :long-double)
    ((string= builtin-name "bool") :bool)
    (t
     (warn "Unknown builtin type: ~A, using :int as fallback" builtin-name)
     :int)))

(defun map-pointer-type (desc &optional metadata)
  "Map pointer types. Returns :pointer or :string for char*."
  (let ((inner-type (gethash "inner_type" desc)))
    ;; Special case: char* -> :string
    (if (and inner-type
             (string= (gethash "kind" inner-type) "Builtin")
             (string= (gethash "builtin_type" inner-type) "char"))
        :string
        :pointer)))

(defun map-array-type (desc &optional metadata)
  "Map array types. Returns (:array type size) or :pointer."
  (let* ((inner-type (map-type-description (gethash "inner_type" desc) metadata))
         (bounds (gethash "bounds" desc)))
    (if bounds
        ;; Fixed-size array
        (let ((size (or (parse-integer bounds :junk-allowed t)
                       (intern (string-upcase bounds) :keyword))))
          `(:array ,inner-type ,size))
        ;; Unknown size array: use :pointer
        :pointer)))

(defun strip-imgui-prefix (name)
  "Remove common ImGui prefixes from names."
  (cond
    ;; ImGui_ prefix (functions)
    ((and (>= (length name) 6)
          (string= (subseq name 0 6) "ImGui_"))
     (subseq name 6))

    ;; ImGui prefix (types, no underscore)
    ((and (>= (length name) 5)
          (string= (subseq name 0 5) "ImGui"))
     (subseq name 5))

    ;; Im prefix (for types like ImVec2, ImColor)
    ((and (>= (length name) 2)
          (string= (subseq name 0 2) "Im")
          (upper-case-p (char name 2)))
     (subseq name 2))

    ;; IMGUI_ prefix (constants)
    ((and (>= (length name) 6)
          (string= (subseq name 0 6) "IMGUI_"))
     (subseq name 6))

    ;; No prefix to strip
    (t name)))

(defun camel-case-to-kebab (name)
  "Convert CamelCase to kebab-case.
   WindowFlags -> window-flags
   GetIO -> get-io"
  (let ((result '())
        (prev-lower nil))
    (loop for char across name
          for i from 0
          do (cond
               ;; Uppercase letter
               ((upper-case-p char)
                (when (and prev-lower (> i 0))
                  (push #\- result))
                (push (char-downcase char) result)
                (setf prev-lower nil))

               ;; Lowercase letter
               ((lower-case-p char)
                (push char result)
                (setf prev-lower t))

               ;; Underscore becomes dash
               ((char= char #\_)
                (push #\- result)
                (setf prev-lower nil))

               ;; Other characters (numbers, etc.)
               (t
                (push char result)
                (setf prev-lower nil))))
    (coerce (nreverse result) 'string)))

(defun format-symbol-name (c-name)
  "Convert C identifier to Lisp symbol name.
   ImGui_Begin -> begin
   ImGuiWindowFlags -> window-flags
   ImGuiTableFlags_ -> window-flags (trailing underscore stripped)"
  (string-right-trim "-" (camel-case-to-kebab (strip-imgui-prefix c-name))))

(defun format-enum-name (c-name)
  "Convert C enum type name to Lisp symbol name, prefixed with im-.
   ImGuiCol_         -> im-col
   ImGuiWindowFlags_ -> im-window-flags"
  (concatenate 'string "im-" (format-symbol-name c-name)))

(defun format-enum-element-name (enum-name element-name)
  "Convert enum element name, stripping enum prefix.
   ImGuiWindowFlags_None -> none
   ImGuiCol_Text -> text"
  (let* ((stripped-enum (strip-imgui-prefix enum-name))
         (stripped-element (strip-imgui-prefix element-name))
         ;; Try to strip the enum name prefix from element
         (enum-prefix (concatenate 'string stripped-enum "_"))
         (without-enum-prefix
          (if (and (>= (length element-name) (length enum-prefix))
                   (string= (subseq element-name 0 (length enum-prefix))
                           enum-prefix))
              (subseq element-name (length enum-prefix))
              stripped-element)))
    (camel-case-to-kebab without-enum-prefix)))

(defun format-type-name (c-name)
  "Convert C type name to Lisp type name.
   ImGuiTableSortSpecs -> table-sort-specs"
  (string-right-trim "-" (camel-case-to-kebab (strip-imgui-prefix c-name))))

(defun parse-constant-value (content)
  "Parse constant value from string to appropriate Lisp representation."
  (cond
    ;; String literal (has quotes)
    ((and (> (length content) 1)
          (char= (char content 0) #\")
          (char= (char content (1- (length content))) #\"))
     content)

    ;; Try parsing as integer
    ((ignore-errors (parse-integer content))
     (parse-integer content))

    ;; Try parsing as float
    ((and (find #\. content)
          (ignore-errors (read-from-string content)))
     (read-from-string content))

    ;; Hex number
    ((and (> (length content) 2)
          (string= (subseq content 0 2) "0x"))
     (format nil "#x~A" (subseq content 2)))

    ;; Default: keep as expression string
    (t content)))

(defun get-comment (obj)
  "Extract comment from object if present."
  (gethash "comment" obj))

(defun get-attached-comment (comment-obj)
  "Get attached comment from comment object."
  (when comment-obj
    (gethash "attached" comment-obj)))

(defun get-preceding-comments (comment-obj)
  "Get preceding comments from comment object."
  (when comment-obj
    (gethash "preceding" comment-obj)))

(defun looks-like-macro-identifier-p (content)
  "Check if content looks like a macro identifier rather than a value."
  (and (> (length content) 0)
       ;; Starts with a letter
       (alpha-char-p (char content 0))
       ;; Contains underscores (typical macro pattern)
       (find #\_ content)
       ;; No operators or spaces
       (not (find-if (lambda (c) (member c '(#\+ #\- #\* #\/ #\< #\> #\= #\Space))) content))
       ;; Not a string literal
       (not (find #\" content))
       ;; Is all uppercase or has uppercase with underscores (macro naming convention)
       (every (lambda (c) (or (upper-case-p c) (digit-char-p c) (char= c #\_))) content)))

(defun should-skip-define-p (name content)
  "Check if a define should be skipped (preprocessor macros, not constants)."
  (or
   ;; Skip empty or nil content
   (null content)
   (string= content "")

   ;; Skip API export macros
   (search "API" name)
   (search "EXTERN" name)

   ;; Skip preprocessor directives and macros with parens (function-like macros)
   (find #\( content)

   ;; Skip self-referential defines (macros that refer to themselves)
   (search name content)

   ;; Skip defines whose content looks like another macro identifier
   (looks-like-macro-identifier-p content)

   ;; Skip common non-value macros
   (member name '("IMGUI_DISABLE" "IMGUI_IMPL_API" "IMGUI_CHECKVERSION")
           :test #'string=)))

;;; ============================================================================
;;; By-value struct detection and shim coverage checking
;;; ============================================================================

(defun build-struct-names-set (structs)
  "Return a hash-table whose keys are struct names, for fast membership tests."
  (let ((ht (make-hash-table :test 'equal)))
    (when structs
      (loop for s across structs
            do (setf (gethash (gethash "name" s) ht) t)))
    ht))

(defun arg-is-by-value-struct-p (arg)
  "Return T if ARG is a struct passed by value (kind=User, name is a known struct)."
  (let* ((type-obj (gethash "type" arg))
         (desc (when type-obj (gethash "description" type-obj)))
         (kind (when desc (gethash "kind" desc))))
    (and (string= kind "User")
         *struct-names*
         (gethash (gethash "name" desc) *struct-names*))))

(defun func-has-by-value-struct-arg-p (func)
  "Return T if any argument of FUNC is a struct passed by value."
  (let ((args (gethash "arguments" func)))
    (and args
         (loop for arg across args
               thereis (arg-is-by-value-struct-p arg)))))

(defun collect-by-value-struct-functions (functions)
  "Return a list of function objects that pass at least one struct by value.
   Includes default-argument helpers, since they also need shims."
  (let ((result '()))
    (when functions
      (loop for func across functions
            when (func-has-by-value-struct-arg-p func)
            do (push func result)))
    (nreverse result)))

(defun parse-shim-covered-names (shim-file)
  "Parse SHIM-FILE and return a hash-set of fully-qualified C++ names called in it.
   Looks for patterns like ::ImGui::SetNextWindowPos and records 'ImGui::SetNextWindowPos'."
  (let ((covered (make-hash-table :test 'equal)))
    (handler-case
        (with-open-file (stream shim-file :direction :input)
          (loop for line = (read-line stream nil nil)
                while line
                do (let ((start 0))
                     (loop
                       (let ((pos (search "::" line :start2 start)))
                         (unless pos (return))
                         ;; Extract the identifier after the leading ::
                         (let* ((name-start (+ pos 2))
                                (name-end (or (position-if
                                               (lambda (c)
                                                 (not (or (alphanumericp c)
                                                          (char= c #\_)
                                                          (char= c #\:))))
                                               line :start name-start)
                                              (length line)))
                                (name (subseq line name-start name-end)))
                           ;; Only keep names that contain :: (i.e. qualified)
                           (when (find #\: name)
                             (setf (gethash name covered) t))
                           (setf start (1+ pos))))))))
      (file-error ()
        (format t "~%;; WARNING: Could not open shim file: ~A~%" shim-file)))
    covered))

(defun check-shim-coverage (by-value-funcs manual-shim-file &optional generated-orig-names)
  "For each function in BY-VALUE-FUNCS, warn if its original C++ name is not
   covered either in MANUAL-SHIM-FILE (by ::Ns::Fn pattern) or in
   GENERATED-ORIG-NAMES (a hash-set returned by write-generated-shims)."
  (let ((manual-covered (parse-shim-covered-names manual-shim-file))
        (missing '()))
    (loop for func in by-value-funcs
          do (let* ((orig   (gethash "original_fully_qualified_name" func))
                    (c-name (gethash "name" func)))
               (unless (or (and orig (gethash orig manual-covered))
                           (and orig generated-orig-names
                                (gethash orig generated-orig-names)))
                 (push c-name missing))))
    (if missing
        (progn
          (format t "~%;; WARNING: The following functions pass structs by value~%")
          (format t ";;          but have no shim (manual or generated):~%")
          (loop for name in (sort missing #'string<)
                do (format t ";;   shim implementation needed for: ~A~%" name)))
        (format t "All by-value-struct functions are covered by shims.~%"))))

;;; ============================================================================
;;; Shim generation (C++ and Lisp defcfun)
;;; ============================================================================

(defparameter *shim-expansions*
  '(;; Float-expanded: replace struct with individual float components
    ("ImVec2"       :float-expand ("x" :float) ("y" :float))
    ("ImVec4"       :float-expand ("x" :float) ("y" :float) ("z" :float) ("w" :float))
    ;; Pointer-wrapped: replace by-value with pointer-to-struct (caller allocates)
    ("ImTextureRef" :pointer-wrap "::ImTextureRef"))
  "Expansion rules for by-value struct arguments in generated shims.")

(defun shim-expansion-for (struct-name)
  "Return the expansion entry for STRUCT-NAME from *shim-expansions*, or NIL."
  (assoc struct-name *shim-expansions* :test #'string=))

(defun shim-suffix-code (struct-name)
  "Return the suffix code appended to a shim function name for STRUCT-NAME."
  (cond ((string= struct-name "ImVec2")       "XY")
        ((string= struct-name "ImVec4")       "XYZW")
        ((string= struct-name "ImTextureRef") "TR")
        (t (string-upcase (strip-imgui-prefix struct-name)))))

(defun compute-shim-function-name (func)
  "Compute the generated C shim name for FUNC.
   Appends suffix codes for each unique by-value struct type, in first-appearance order."
  (let ((base (gethash "name" func))
        (args (gethash "arguments" func))
        (seen-codes '())
        (suffix ""))
    (when args
      (loop for arg across args
            do (let* ((type-obj (gethash "type" arg))
                      (desc     (when type-obj (gethash "description" type-obj)))
                      (kind     (when desc (gethash "kind" desc)))
                      (name     (when desc (gethash "name" desc))))
                 (when (and kind (string= kind "User") *struct-names* (gethash name *struct-names*))
                   (let ((code (shim-suffix-code name)))
                     (unless (member code seen-codes :test #'string=)
                       (push code seen-codes)
                       (setf suffix (concatenate 'string suffix code))))))))
    (concatenate 'string base suffix)))

(defun builtin-to-cpp (builtin-name)
  "Map a JSON builtin_type string to a C++ type string."
  (cond
    ((string= builtin-name "void")               "void")
    ((string= builtin-name "bool")               "bool")
    ((string= builtin-name "char")               "char")
    ((string= builtin-name "unsigned_char")      "unsigned char")
    ((string= builtin-name "short")              "short")
    ((string= builtin-name "unsigned_short")     "unsigned short")
    ((string= builtin-name "int")                "int")
    ((string= builtin-name "unsigned_int")       "unsigned int")
    ((string= builtin-name "long")               "long")
    ((string= builtin-name "unsigned_long")      "unsigned long")
    ((string= builtin-name "long_long")          "long long")
    ((string= builtin-name "unsigned_long_long") "unsigned long long")
    ((string= builtin-name "float")              "float")
    ((string= builtin-name "double")             "double")
    ((string= builtin-name "long_double")        "long double")
    (t "int")))

(defun desc-to-cpp-funcptr (fn-desc)
  "Generate a C++ function pointer type string from a Function kind description.
   Returns a string like 'float(*)(void*, int)'."
  (let* ((ret-desc   (gethash "return_type" fn-desc))
         (ret-cpp    (desc-to-cpp ret-desc))
         (params     (gethash "parameters" fn-desc))
         (param-cpps (if (and params (> (length params) 0))
                         (loop for p across params
                               collect (desc-to-cpp (gethash "inner_type" p)))
                         nil)))
    (format nil "~A(*)(~{~A~^, ~})" ret-cpp (or param-cpps (list "void")))))

(defun desc-to-cpp (desc)
  "Map a JSON type description to a C++ type string."
  (when (null desc) (return-from desc-to-cpp "void"))
  (let ((kind (gethash "kind" desc)))
    (cond
      ((string= kind "Builtin")
       (builtin-to-cpp (gethash "builtin_type" desc)))
      ((string= kind "Pointer")
       (let ((inner (gethash "inner_type" desc)))
         (if (null inner)
             "void*"
             (let ((ik (gethash "kind" inner)))
               (cond
                 ;; Pointer to builtin: emit T* / const T* based on storage_classes
                 ((string= ik "Builtin")
                  (let* ((bt      (gethash "builtin_type" inner))
                         (scs     (gethash "storage_classes" inner))
                         (constp  (and scs (find "const" scs :test #'string=))))
                    (cond
                      ((string= bt "void") "void*")
                      ((string= bt "char") (if constp "const char*" "char*"))
                      (t (if constp
                             (format nil "const ~A*" (builtin-to-cpp bt))
                             (format nil "~A*" (builtin-to-cpp bt)))))))
                 ;; Named pointer → ::Type*
                 ((string= ik "User")
                  (format nil "::~A*" (gethash "name" inner)))
                 ;; Function pointer → keep as void* (cast happens at call site)
                 ((string= ik "Function") "void*")
                 ;; const-qualified inner
                 ((string= ik "Type")
                  (concatenate 'string (desc-to-cpp (gethash "inner_type" inner)) "*"))
                 (t "void*"))))))
      ((string= kind "User")
       (let ((name (gethash "name" desc)))
         (cond
           ((string= name "size_t")  "size_t")
           ((string= name "va_list") "va_list")
           ((string= name "ImU32")   "unsigned int")
           ((string= name "ImU64")   "uint64_t")
           ((string= name "ImTextureID") "uint64_t")
           ((string= name "ImWchar")   "unsigned short")
           ((string= name "ImWchar16") "unsigned short")
           ((string= name "ImWchar32") "unsigned int")
           ((string= name "ImDrawIdx") "unsigned short")
           ;; Enum types → int (cast in call site)
           ((and *current-metadata*
                 (is-enum-type-p name (getf *current-metadata* :enums)))
            "int")
           ;; Everything else → ::TypeName
           (t (format nil "::~A" name)))))
      ((string= kind "Function") "void*")
      ((string= kind "Array")    "void*")
      ((string= kind "Type")
       (desc-to-cpp (gethash "inner_type" desc)))
      (t "void*"))))

(defun arg-cpp-params (arg)
  "Return a list of (cpp-type cpp-name) pairs for ARG's position in a shim param list.
   By-value structs are expanded; varargs become ('...' '')."
  (let* ((is-varargs (gethash "is_varargs" arg))
         (is-array   (gethash "is_array" arg))
         (name       (gethash "name" arg))
         (type-obj   (gethash "type" arg))
         (desc       (when type-obj (gethash "description" type-obj)))
         (kind       (when desc (gethash "kind" desc)))
         (type-name  (when (and kind (string= kind "User")) (gethash "name" desc)))
         (expansion  (when type-name (shim-expansion-for type-name))))
    (cond
      (is-varargs  '(("..." "")))
      (expansion
       (destructuring-bind (sname ekind &rest edata) expansion
         (declare (ignore sname))
         (ecase ekind
           (:float-expand
            (loop for (fsuffix _) in edata
                  collect (list "float" (format nil "~A_~A" name fsuffix))))
           (:pointer-wrap
            (list (list (concatenate 'string (first edata) "*") name))))))
      (is-array   (list (list "void*" name)))
      (t          (list (list (desc-to-cpp desc) name))))))

(defun arg-cpp-call-expr (arg)
  "Return the C++ expression to pass for ARG when calling the original function.
   Returns NIL for 'self' (method receiver), empty string for varargs."
  (let* ((is-varargs (gethash "is_varargs" arg))
         (name       (gethash "name" arg))
         (type-obj   (gethash "type" arg))
         (desc       (when type-obj (gethash "description" type-obj)))
         (kind       (when desc (gethash "kind" desc)))
         (type-name  (when (and kind (string= kind "User")) (gethash "name" desc)))
         (expansion  (when type-name (shim-expansion-for type-name))))
    (cond
      ;; Self is the method receiver — not passed as an argument
      ((string= name "self") nil)
      (is-varargs "")
      (expansion
       (destructuring-bind (sname ekind &rest edata) expansion
         (declare (ignore sname))
         (ecase ekind
           (:float-expand
            (let* ((prefix (format nil "::~A" type-name))
                   (fields (mapcar (lambda (fs)
                                     (format nil "~A_~A" name (first fs)))
                                   edata)))
              (format nil "~A(~{~A~^, ~})" prefix fields)))
           (:pointer-wrap
            (format nil "*~A" name)))))
      ;; Enum type: cast to the concrete C++ enum type
      ((and kind (string= kind "User")
            type-name
            *current-metadata*
            (is-enum-type-p type-name (getf *current-metadata* :enums)))
       (format nil "(::~A)~A" type-name name))
      ;; Function pointer via Type → Pointer → Function: cast void* to proper funcptr type
      ((and kind (string= kind "Type"))
       (let* ((inner1 (gethash "inner_type" desc))
              (ik1    (when inner1 (gethash "kind" inner1)))
              (inner2 (when inner1 (gethash "inner_type" inner1)))
              (ik2    (when inner2 (gethash "kind" inner2))))
         (if (and (string= ik1 "Pointer") (string= ik2 "Function"))
             (format nil "(~A)~A" (desc-to-cpp-funcptr inner2) name)
             name)))
      (t name))))

(defun func-has-real-varargs-p (func)
  "Return T if FUNC has a real ... varargs argument."
  (let ((args (gethash "arguments" func)))
    (and args
         (loop for arg across args
               thereis (gethash "is_varargs" arg)))))

(defun generate-cpp-shim (func)
  "Generate a C++ shim function string for FUNC.
   Returns NIL if the function cannot be auto-generated (e.g. real varargs)."
  (when (func-has-real-varargs-p func)
    (return-from generate-cpp-shim nil))
  (let* ((shim-name    (compute-shim-function-name func))
         (ret-obj      (gethash "return_type" func))
         (ret-cpp      (desc-to-cpp (when ret-obj (gethash "description" ret-obj))))
         (void-ret-p   (string= ret-cpp "void"))
         (args         (gethash "arguments" func))
         (orig-name    (gethash "original_fully_qualified_name" func))
         ;; Method call when orig-name has no :: (it's just the method name)
         (is-method    (and orig-name (not (find #\: orig-name)))))
    (let (params call-args)
      (when args
        (loop for arg across args
              do (let ((cpp-ps   (arg-cpp-params arg))
                       (call-ex  (arg-cpp-call-expr arg)))
                   ;; Collect C++ parameter declarations
                   (loop for (ctype cname) in cpp-ps
                         do (if (string= ctype "...")
                                (push "..." params)
                                (push (format nil "~A ~A" ctype cname) params)))
                   ;; Collect call expressions (nil = skip, "" = skip)
                   (when (and call-ex (> (length call-ex) 0))
                     (push call-ex call-args)))))
      (setf params    (nreverse params))
      (setf call-args (nreverse call-args))
      (let* ((params-str    (format nil "~{~A~^, ~}" params))
             (call-args-str (format nil "~{~A~^, ~}" call-args))
             (call-str      (if is-method
                                (format nil "self->~A(~A)" orig-name call-args-str)
                                (format nil "::~A(~A)" orig-name call-args-str))))
        (format nil "~A ~A(~A)~%{~%    ~A~A;~%}~%"
                ret-cpp shim-name params-str
                (if void-ret-p "" "return ")
                call-str)))))

(defun arg-lisp-params (arg)
  "Return a list of (lisp-name cffi-type) pairs for ARG in a Lisp defcfun.
   By-value structs are expanded; varargs → nil (handled via &rest)."
  (let* ((is-varargs (gethash "is_varargs" arg))
         (is-array   (gethash "is_array" arg))
         (name       (gethash "name" arg))
         (lisp-name  (format-symbol-name name))
         (type-obj   (gethash "type" arg))
         (desc       (when type-obj (gethash "description" type-obj)))
         (kind       (when desc (gethash "kind" desc)))
         (type-name  (when (and desc (string= kind "User")) (gethash "name" desc)))
         (expansion  (when type-name (shim-expansion-for type-name))))
    (cond
      (is-varargs nil)  ; caller adds &rest separately
      (expansion
       (destructuring-bind (sname ekind &rest edata) expansion
         (declare (ignore sname))
         (ecase ekind
           (:float-expand
            (loop for (fsuffix cffi-type) in edata
                  collect (list (format nil "~A-~A" lisp-name fsuffix) cffi-type)))
           (:pointer-wrap
            (list (list lisp-name :pointer))))))
      (is-array (list (list lisp-name :pointer)))
      (t (list (list lisp-name (if desc (map-type-description desc) :pointer)))))))

(defun generate-lisp-shim (func)
  "Generate a Lisp defcfun string for the generated shim of FUNC.
   The C name is the generated shim (e.g. ImGui_SetNextWindowPosExXY) but the
   Lisp symbol uses the original function name (set-next-window-pos-ex) so
   callers don't need to know about the ABI suffix.
   Returns NIL if the function cannot be auto-generated."
  (when (func-has-real-varargs-p func)
    (return-from generate-lisp-shim nil))
  (let* ((shim-name  (compute-shim-function-name func))
         (lisp-name  (format-symbol-name (gethash "name" func)))
         (ret-obj    (gethash "return_type" func))
         (ret-desc   (when ret-obj (gethash "description" ret-obj)))
         (ret-type   (if ret-desc (map-type-description ret-desc) :void))
         (args       (gethash "arguments" func)))
    (with-output-to-string (s)
      (format s "(defcfun (~S ~A) ~S~%" shim-name lisp-name ret-type)
      (when args
        (loop for arg across args
              do (let ((lps (arg-lisp-params arg)))
                   (loop for (lname ltype) in lps
                         do (format s "  (~A ~S)~%" lname ltype)))))
      (format s ")~%"))))

(defun write-generated-shims (by-value-funcs cpp-file lisp-file)
  "Write abi_shim_generated.cpp and shim.lisp for all auto-generatable
   functions in BY-VALUE-FUNCS.
   Returns (values n-generated n-skipped covered-orig-names) where covered-orig-names
   is a hash-set of original_fully_qualified_name strings that were generated."
  (let ((generated 0) (skipped 0)
        (covered-orig (make-hash-table :test 'equal)))
    ;; Write C++ file
    (with-open-file (cpp cpp-file
                         :direction :output
                         :if-exists :supersede
                         :if-does-not-exist :create)
      (format cpp "// abi_shim_generated.cpp~%")
      (format cpp "// Auto-generated ABI shims — DO NOT EDIT by hand.~%")
      (format cpp "// Regenerate by running cl-dear-imgui/generator.lisp.~%")
      (format cpp "// Expands by-value ImVec2/ImVec4 args to floats; ImTextureRef to pointer.~%~%")
      (format cpp "#include \"imgui.h\"~%")
      (format cpp "#include \"imgui_internal.h\"~%")
      (format cpp "#include <stdint.h>~%")
      (format cpp "#include <stdarg.h>~%~%")
      (format cpp "extern \"C\" {~%~%")
      (loop for func in by-value-funcs
            do (let ((cpp-shim (generate-cpp-shim func)))
                 (if cpp-shim
                     (progn
                       (format cpp "~A~%" cpp-shim)
                       (incf generated)
                       ;; Track the original name so the coverage check can exclude it
                       (let ((orig (gethash "original_fully_qualified_name" func)))
                         (when orig (setf (gethash orig covered-orig) t))))
                     (progn
                       (format cpp "// SKIPPED (varargs): ~A~%~%" (gethash "name" func))
                       (incf skipped)))))
      (format cpp "} // extern \"C\"~%"))
    ;; Write Lisp file
    (with-open-file (lisp lisp-file
                          :direction :output
                          :if-exists :supersede
                          :if-does-not-exist :create)
      (format lisp ";;;; shim.lisp~%")
      (format lisp ";;;; Auto-generated CFFI bindings for abi_shim_generated.cpp~%")
      (format lisp ";;;; DO NOT EDIT by hand — regenerate with generator.lisp~%~%")
      (format lisp "(in-package #:cl-dear-imgui)~%~%")
      (loop for func in by-value-funcs
            do (let ((lisp-shim (generate-lisp-shim func)))
                 (if lisp-shim
                     (format lisp "~A~%" lisp-shim)
                     (format lisp ";; SKIPPED (varargs): ~A~%~%" (gethash "name" func))))))
    (values generated skipped covered-orig)))

;;; ============================================================================
;;; Package File Generation
;;; ============================================================================

(defun generate-package-file (filepath metadata &key extra-exports)
  "Generate package.lisp with package definition and exports.
   EXTRA-EXPORTS is an optional list of additional symbol name strings to export
   (e.g. generated shim function names)."
  (with-open-file (stream filepath
                          :direction :output
                          :if-exists :supersede
                          :if-does-not-exist :create)
    (format stream ";;;; package.lisp~%")
    (format stream ";;;; Auto-generated CFFI bindings for Dear ImGui~%")
    (format stream ";;;; Generated from dcimgui.json~%~%")

    ;; Package definition
    (format stream "(defpackage #:cl-dear-imgui~%")
    (format stream "  (:use #:cl #:cffi)~%")

    ;; Export all public symbols
    (format stream "  (:export~%")
    (generate-exports stream metadata :extra-exports extra-exports)
    (format stream "   ))~%")))

(defun generate-exports (stream metadata &key extra-exports)
  "Generate export clauses for all public symbols.
   EXTRA-EXPORTS is an optional list of additional symbol name strings."
  (let ((exports (copy-list extra-exports)))

    ;; Export enum names and elements
    (loop for enum across (getf metadata :enums)
          do (let ((enum-name (gethash "name" enum)))
               (push (format-enum-name enum-name) exports)
               (loop for element across (gethash "elements" enum)
                     do (push (format-enum-element-name
                              enum-name
                              (gethash "name" element))
                             exports))))

    ;; Export typedef names
    (loop for typedef across (getf metadata :typedefs)
          do (push (format-type-name (gethash "name" typedef)) exports))

    ;; Export struct names
    (loop for struct across (getf metadata :structs)
          unless (gethash "forward_declaration" struct)
          do (push (format-type-name (gethash "name" struct)) exports))

    ;; Export function names.
    ;; Skip default-argument helpers that have by-value struct args — those are
    ;; covered by the auto-generated shims (passed in via extra-exports).
    ;; Non-by-value default-argument helpers (e.g. ImGui_Button) get a plain defcfun.
    (loop for func across (getf metadata :functions)
          unless (and (gethash "is_default_argument_helper" func)
                      (func-has-by-value-struct-arg-p func))
          do (push (format-symbol-name (gethash "name" func)) exports))

    ;; Export constant names from defines (skip preprocessor macros)
    (loop for define across (getf metadata :defines)
          do (let ((name (gethash "name" define))
                   (content (gethash "content" define)))
               (unless (should-skip-define-p name content)
                 (push (format nil "+~A+" (format-symbol-name name)) exports))))

    ;; Sort and output (remove duplicates)
    (loop for export in (sort (remove-duplicates exports :test #'string=) #'string<)
          do (format stream "   #:~A~%" export))))

(defun generate-bindings-file (filepath metadata)
  "Generate bindings.lisp with all CFFI definitions."
  (with-open-file (stream filepath
                          :direction :output
                          :if-exists :supersede
                          :if-does-not-exist :create)
    (format stream ";;;; bindings.lisp~%")
    (format stream ";;;; Auto-generated CFFI bindings for Dear ImGui~%")
    (format stream ";;;; Generated from dcimgui.json~%~%")
    (format stream "(in-package #:cl-dear-imgui)~%~%")

    ;; Library definition
    (generate-library-definition stream)

    ;; Constants from defines
    (generate-defines stream (getf metadata :defines))

    ;; Enums
    (generate-enums stream (getf metadata :enums))

    ;; Generate structs and typedefs in dependency order
    ;; (some typedefs reference structs, some structs reference typedefs)
    (generate-types-in-order stream
                             (getf metadata :typedefs)
                             (getf metadata :structs))

    ;; Functions
    (generate-functions stream (getf metadata :functions))))

(defun generate-library-definition (stream)
  "Generate define-foreign-library form for dcimgui."
  (format stream "(eval-when (:compile-toplevel :load-toplevel :execute)~%")
  (format stream "  (pushnew (asdf:system-relative-pathname :cl-dear-imgui \"./\")~%")
  (format stream "           cffi:*foreign-library-directories*~%")
  (format stream "           :test #'equal))~%~%")
  (format stream "(define-foreign-library dcimgui~%")
  (format stream "  (:darwin \"libdcimgui.dylib\")~%")
  (format stream "  (:unix \"libdcimgui.so\")~%")
  (format stream "  (:windows \"dcimgui.dll\")~%")
  (format stream "  (t (:default \"libdcimgui\")))~%~%")
  (format stream "(use-foreign-library dcimgui)~%~%"))

(defun generate-defines (stream defines)
  "Generate defconstant for #define values."
  (when (and defines (> (length defines) 0))
    (format stream ";;; ============================================================================~%")
    (format stream ";;; Constants from #defines~%")
    (format stream ";;; ============================================================================~%~%")

    (loop for define across defines
          do (let* ((name (gethash "name" define))
                    (content (gethash "content" define))
                    (lisp-name (format-symbol-name name))
                    (comment (get-comment define)))

               ;; Skip preprocessor macros
               (unless (should-skip-define-p name content)
                 ;; Output preceding comments
                 (let ((preceding (get-preceding-comments comment)))
                   (when preceding
                     (loop for line across preceding
                           do (format stream "~A~%" line))))

                 ;; Output constant definition
                 ;; Use defparameter instead of defconstant to allow reloading
                 (format stream "(defparameter +~A+ ~A)~%"
                         lisp-name
                         (parse-constant-value content))

                 ;; Output attached comment
                 (let ((attached (get-attached-comment comment)))
                   (when attached
                     (format stream "~A~%" attached)))

                 (format stream "~%"))))))

(defun generate-enums (stream enums)
  "Generate defcenum forms for all enums."
  (when (and enums (> (length enums) 0))
    (loop for enum across enums
          do (let* ((name (gethash "name" enum))
                    (lisp-name (format-enum-name name))
                    (elements (gethash "elements" enum))
                    (is-flags (gethash "is_flags_enum" enum))
                    (comment (get-comment enum)))

               ;; Output preceding comments
               (let ((preceding (get-preceding-comments comment)))
                 (when preceding
                   (loop for line across preceding
                         do (format stream "~A~%" line))))

               ;; For flags enums, add a comment
               (when is-flags
                 (format stream ";; Flags enum (bitfield) - combine with LOGIOR~%"))

               (format stream "(defcenum ~A~%" lisp-name)

               ;; Generate enum elements
               (loop for element across elements
                     do (let* ((elem-name (gethash "name" element))
                               (elem-lisp-name (format-enum-element-name name elem-name))
                               (value (gethash "value" element))
                               (is-count (gethash "is_count" element))
                               (elem-comment (get-comment element)))

                          ;; Skip count elements
                          (unless is-count
                            ;; Output attached comment inline if short
                            (let ((attached (get-attached-comment elem-comment)))
                              (if attached
                                  (format stream "  (:~A ~D) ~A~%"
                                          elem-lisp-name value attached)
                                  (if value
                                      (format stream "  (:~A ~D)~%"
                                              elem-lisp-name value)
                                      (format stream "  :~A~%"
                                              elem-lisp-name)))))))

               (format stream ")~%~%")))))

(defun get-type-dependencies-from-desc (desc collected)
  "Recursively collect all User type dependencies from a type description."
  (if (null desc)
      collected
      (let ((kind (gethash "kind" desc)))
        (cond
          ((string= kind "User")
           (pushnew (gethash "name" desc) collected :test #'string=)
           collected)
          ((string= kind "Type")
           (get-type-dependencies-from-desc (gethash "inner_type" desc) collected))
          ((string= kind "Pointer")
           (get-type-dependencies-from-desc (gethash "inner_type" desc) collected))
          ((string= kind "Array")
           (get-type-dependencies-from-desc (gethash "inner_type" desc) collected))
          (t collected)))))

(defun get-typedef-dependencies (typedef)
  "Get all type dependencies for a typedef."
  (let ((deps '()))
    (let* ((type-obj (gethash "type" typedef))
           (type-desc (when type-obj (gethash "description" type-obj))))
      (when type-desc
        (setf deps (get-type-dependencies-from-desc type-desc deps))))
    deps))

(defun get-struct-dependencies (struct)
  "Get all type dependencies for a struct (from its fields)."
  (let ((deps '())
        (struct-name (gethash "name" struct)))
    (let ((fields (gethash "fields" struct)))
      (when fields
        (loop for field across fields
              do (let* ((field-name (gethash "name" field))
                        (type-obj (gethash "type" field))
                        (type-desc (when type-obj (gethash "description" type-obj))))
                   (when type-desc
                     (setf deps (get-type-dependencies-from-desc type-desc deps)))))))
    deps))

(defun generate-types-in-order (stream typedefs structs)
  "Generate structs and typedefs in dependency order using topological sort."
  (let* ((type-items '())
         (type-map (make-hash-table :test 'equal)))

    ;; Create type items for typedefs
    (when typedefs
      (loop for typedef across typedefs
            do (let* ((name (gethash "name" typedef))
                      (deps (get-typedef-dependencies typedef))
                      (item (list :kind :typedef
                                  :name name
                                  :data typedef
                                  :deps deps)))
                 (push item type-items)
                 (setf (gethash name type-map) item))))

    ;; Create type items for structs (skip forward declarations)
    (when structs
      (loop for struct across structs
            unless (gethash "forward_declaration" struct)
            do (let* ((name (gethash "name" struct))
                      (deps (get-struct-dependencies struct))
                      (item (list :kind :struct
                                  :name name
                                  :data struct
                                  :deps deps)))
                 (push item type-items)
                 (setf (gethash name type-map) item))))

    ;; Topological sort
    (let ((sorted '())
          (visited (make-hash-table :test 'equal))
          (visiting (make-hash-table :test 'equal)))

      (labels ((visit (item)
                 (let ((name (getf item :name)))
                   (when (gethash name visiting)
                     ;; Circular dependency - just continue
                     (return-from visit))
                   (unless (gethash name visited)
                     (setf (gethash name visiting) t)
                     ;; Visit dependencies first
                     (loop for dep-name in (getf item :deps)
                           do (let ((dep-item (gethash dep-name type-map)))
                                ;; Only visit if it's a type we're generating
                                ;; (skip enums and external types)
                                (when dep-item
                                  (visit dep-item))))
                     (setf (gethash name visited) t)
                     (setf (gethash name visiting) nil)
                     ;; Add this type to sorted list
                     (push item sorted)))))

        ;; Visit all types (only visit if not already visited as a dependency)
        (dolist (item type-items)
          (unless (gethash (getf item :name) visited)
            (visit item))))

      ;; Build set of enum lisp-names to skip colliding typedefs
      (let ((enum-names (make-hash-table :test 'equal)))
        (when *current-metadata*
          (loop for enum across (getf *current-metadata* :enums)
                do (setf (gethash (format-enum-name (gethash "name" enum)) enum-names) t)))

        ;; Generate types in sorted order (dependencies first)
        ;; Note: We reverse because we built the list by pushing (adds to front)
        (dolist (item (nreverse sorted))
          (ecase (getf item :kind)
            (:typedef
             ;; Skip typedefs whose name collides with an enum (e.g. ImGuiCol
             ;; typedef int vs enum ImGuiCol_ — both map to "col").
             (let ((lisp-name (format-symbol-name (gethash "name" (getf item :data)))))
               (unless (gethash lisp-name enum-names)
                 (generate-single-typedef stream (getf item :data)))))
            (:struct
             (generate-single-struct stream (getf item :data)))))))))

(defun get-typedef-dependency (typedef)
  "Get the name of the type this typedef depends on (if it's a User type)."
  (let* ((type-obj (gethash "type" typedef))
         (type-desc (when type-obj (gethash "description" type-obj))))
    (when type-desc
      (let ((kind (gethash "kind" type-desc)))
        (cond
          ((string= kind "User")
           (gethash "name" type-desc))
          ((string= kind "Type")
           (get-typedef-dependency-from-desc (gethash "inner_type" type-desc)))
          (t nil))))))

(defun get-typedef-dependency-from-desc (desc)
  "Recursively get typedef dependency from type description."
  (when desc
    (let ((kind (gethash "kind" desc)))
      (cond
        ((string= kind "User")
         (gethash "name" desc))
        ((string= kind "Type")
         (get-typedef-dependency-from-desc (gethash "inner_type" desc)))
        (t nil)))))

(defun sort-typedefs-by-dependency (typedefs)
  "Sort typedefs so dependencies come first (topological sort)."
  (let* ((typedef-vec (coerce typedefs 'vector))
         (typedef-names (make-hash-table :test 'equal))
         (sorted '())
         (visited (make-hash-table :test 'equal)))

    ;; Build name -> typedef mapping
    (loop for typedef across typedef-vec
          do (setf (gethash (gethash "name" typedef) typedef-names) typedef))

    ;; Topological sort with DFS
    (labels ((visit (typedef)
               (let ((name (gethash "name" typedef)))
                 (unless (gethash name visited)
                   (setf (gethash name visited) t)
                   ;; Visit dependency first
                   (let ((dep-name (get-typedef-dependency typedef)))
                     (when dep-name
                       (let ((dep-typedef (gethash dep-name typedef-names)))
                         (when dep-typedef
                           (visit dep-typedef)))))
                   ;; Add this typedef to sorted list
                   (push typedef sorted)))))

      (loop for typedef across typedef-vec
            do (visit typedef)))

    ;; Return in reverse order (we built the list backwards)
    (nreverse sorted)))

(defun generate-single-typedef (stream typedef)
  "Generate a single defctype form."
  (let* ((name (gethash "name" typedef))
         (lisp-name (format-type-name name))
         (type-obj (gethash "type" typedef))
         (type-desc (when type-obj (gethash "description" type-obj)))
         (cffi-type (if type-desc
                        (map-type-description type-desc)
                        :pointer))
         (comment (get-comment typedef)))

    ;; Output preceding comments
    (let ((preceding (get-preceding-comments comment)))
      (when preceding
        (loop for line across preceding
              do (format stream "~A~%" line))))

    (format stream "(defctype ~A ~S)~%~%"
            lisp-name
            cffi-type)))

(defun generate-typedefs (stream typedefs)
  "Generate defctype forms for typedefs.
   Skips typedefs whose converted name collides with an existing enum
   (e.g. ImGuiCol typedef int vs enum ImGuiCol_  both map to 'col')."
  (when (and typedefs (> (length typedefs) 0))
    ;; Build a set of enum lisp-names so we can detect collisions
    (let ((enum-names (make-hash-table :test 'equal))
          (sorted-typedefs (sort-typedefs-by-dependency typedefs)))
      (when *current-metadata*
        (loop for enum across (getf *current-metadata* :enums)
              do (setf (gethash (format-enum-name (gethash "name" enum)) enum-names) t)))
      (loop for typedef in sorted-typedefs
            do (let ((lisp-name (format-symbol-name (gethash "name" typedef))))
                 (unless (gethash lisp-name enum-names)
                   (generate-single-typedef stream typedef)))))))

(defun generate-single-struct (stream struct)
  "Generate a single defcstruct form."
  (let* ((name (gethash "name" struct))
         (lisp-name (format-type-name name))
         (kind (gethash "kind" struct))
         (is-union (string= kind "union"))
         (fields (gethash "fields" struct))
         (is-anonymous (gethash "is_anonymous" struct))
         (comment (get-comment struct)))

    ;; Skip anonymous structs (handled inline)
    (unless is-anonymous
      ;; Output preceding comments
      (let ((preceding (get-preceding-comments comment)))
        (when preceding
          (loop for line across preceding
                do (format stream "~A~%" line))))

      (when is-anonymous
        (format stream ";; Anonymous struct~%"))

      (format stream "(~A ~A~%"
              (if is-union "defcunion" "defcstruct")
              lisp-name)

      ;; Generate fields
      (loop for field across fields
            do (generate-struct-field stream field))

      (format stream ")~%~%"))))

(defun generate-structs (stream structs)
  "Generate defcstruct forms for structures."
  (when (and structs (> (length structs) 0))
    (loop for struct across structs
          ;; Skip forward declarations
          unless (gethash "forward_declaration" struct)
          do (generate-single-struct stream struct))))

(defun get-array-element-type (type-desc)
  "Get the element type from an array type description."
  (if (and type-desc (string= (gethash "kind" type-desc) "Array"))
      (map-type-description (gethash "inner_type" type-desc) *current-metadata*)
      :pointer))

(defun is-enum-name-p (name)
  "Check if a name looks like an enum element (contains _COUNT or _MAX suffix)."
  (and name
       (or (search "_COUNT" (string-upcase name))
           (search "_MAX" (string-upcase name)))))

(defun is-simple-array-bounds (bounds)
  "Check if array bounds is a simple value (number or identifier).
   Returns T if it's usable as CFFI :count, NIL for complex expressions or enum elements."
  (and bounds
       (> (length bounds) 0)
       ;; Not a complex expression (no operators or parentheses)
       (not (find-if (lambda (c) (member c '(#\( #\) #\+ #\- #\* #\/  #\Space))) bounds))
       ;; Not an enum count element (CFFI doesn't support enum values as array bounds)
       (not (is-enum-name-p bounds))))

(defun parse-array-bounds (bounds)
  "Parse array bounds to a number or constant reference.
   Returns the numeric value if possible, otherwise a symbol name, or NIL for complex expressions."
  (cond
   ;; Try parsing as integer
   ((parse-integer bounds :junk-allowed t)
    (parse-integer bounds :junk-allowed t))
   ;; Simple identifier (enum element or constant)
   ((is-simple-array-bounds bounds)
    (intern (format-symbol-name bounds)))
   ;; Complex expression - can't use in CFFI :count
   (t nil)))

(defun generate-struct-field (stream field)
  "Generate a single struct field."
  (let* ((name (gethash "name" field))
         (lisp-name (format-symbol-name name))
         (is-array (gethash "is_array" field))
         (type-obj (gethash "type" field))
         (type-desc (when type-obj (gethash "description" type-obj)))
         (comment (get-comment field)))

    (if is-array
        (let* ((bounds (gethash "array_bounds" field))
               (element-type (get-array-element-type type-desc))
               (count (parse-array-bounds bounds)))
          (if count
              ;; Simple array with known size: (name element-type :count size)
              (format stream "  (~A ~S :count ~A)~%"
                      lisp-name
                      element-type
                      count)
              ;; Complex array expression - fall back to pointer
              (format stream "  (~A :pointer) ; Array with complex bounds: ~A~%"
                      lisp-name
                      bounds)))
        ;; Regular field: (name :type)
        (let ((cffi-type (if type-desc
                             (map-type-description type-desc)
                             :pointer)))
          (format stream "  (~A ~S)~%"
                  lisp-name
                  cffi-type)))))

(defun generate-functions (stream functions)
  "Generate defcfun forms for all functions.
   Functions that pass structs by value are omitted (they require ABI shims)."
  (when (and functions (> (length functions) 0))
    (loop for func across functions
          ;; Skip default-argument helpers that have by-value struct args —
          ;; those are handled by the auto-generated ABI shims instead.
          unless (and (gethash "is_default_argument_helper" func)
                      (func-has-by-value-struct-arg-p func))
          ;; Skip functions that pass structs by value (need ABI shims)
          unless (func-has-by-value-struct-arg-p func)
          do (let* ((c-name (gethash "name" func))
                    (lisp-name (format-symbol-name c-name))
                    (return-type-obj (gethash "return_type" func))
                    (return-type-desc (when return-type-obj
                                        (gethash "description" return-type-obj)))
                    (return-type (if return-type-desc
                                     (map-type-description return-type-desc)
                                     :void))
                    (arguments (gethash "arguments" func))
                    (is-manual (gethash "is_manual_helper" func))
                    (comment (get-comment func)))

               ;; Output preceding comments
               (let ((preceding (get-preceding-comments comment)))
                 (when preceding
                   (loop for line across preceding
                         do (format stream "~A~%" line))))

               (when is-manual
                 (format stream ";; Manual helper function~%"))

               (format stream "(defcfun (~S ~A) ~S"
                       c-name
                       lisp-name
                       return-type)

               ;; Generate arguments
               (if (and arguments (> (length arguments) 0))
                   (progn
                     (format stream "~%")
                     (loop for arg across arguments
                           do (generate-function-argument stream arg c-name))
                     (format stream ")~%~%"))
                   (format stream ")~%~%"))))))

;;; ============================================================================
;;; Parameter type overrides for specific (function, parameter) pairs
;;; ============================================================================

(defvar *pointer-overrides*
  '(("ImGui_TextUnformattedEx" . "text_end")
    ("ImGui_InputTextEx" . "buf"))
  "Alist of (C-function-name . C-param-name) pairs that should use :POINTER
instead of the type derived from the JSON (typically :STRING for char*).
Used to handle out-pointer parameters that are incorrectly typed as :STRING.")

(defun generate-function-argument (stream arg &optional func-name)
  "Generate a single function argument."
  (let* ((name (gethash "name" arg))
         (lisp-name (format-symbol-name name))
         (is-varargs (gethash "is_varargs" arg))
         (type-obj (gethash "type" arg))
         (type-desc (when type-obj (gethash "description" type-obj)))
         (cffi-type (if type-desc
                        (map-type-description type-desc)
                        :pointer))
         (is-array (gethash "is_array" arg))
         ;; Check if this (function, param) pair should be forced to :pointer
         (override-p (and func-name
                          (find-if (lambda (ov)
                                     (and (string= (car ov) func-name)
                                          (string= (cdr ov) name)))
                                   *pointer-overrides*))))

    (cond
      ;; Varargs: &rest
      (is-varargs
       (format stream "  &rest~%"))

      ;; Array argument: typically pointer
      (is-array
       (format stream "  (~A :pointer)~%"
               lisp-name))

      ;; Override: force :pointer regardless of derived type
      (override-p
       (format stream "  (~A :pointer) ; pointer override~%"
               lisp-name))

      ;; Regular argument
      (t
       (format stream "  (~A ~S)~%"
               lisp-name
               cffi-type)))))

(format t "~%;; cl-dear-imgui/generator loaded.~%")
(format t ";; Usage: (cl-dear-imgui/generator:generate-bindings \"dcimgui.json\" \"package.lisp\" \"bindings.lisp\")~%~%")

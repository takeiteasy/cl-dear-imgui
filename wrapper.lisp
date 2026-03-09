;;;; wrapper.lisp
;;;; CLOS wrapper around CFFI bindings for easier use

(in-package #:cl-dear-imgui)

(defclass vec2 ()
  ((x :accessor vec2-x :initarg :x :initform 0.0 :type float)
   (y :accessor vec2-y :initarg :y :initform 0.0 :type float))
  (:documentation "2D vector for positions, sizes, etc."))

(defclass vec4 ()
  ((x :accessor vec4-x :initarg :x :initform 0.0 :type float)
   (y :accessor vec4-y :initarg :y :initform 0.0 :type float)
   (z :accessor vec4-z :initarg :z :initform 0.0 :type float)
   (w :accessor vec4-w :initarg :w :initform 0.0 :type float))
  (:documentation "4D vector for colors (RGBA) or rectangles."))

;;; Convenience constructors

(defun make-vec2 (x y)
  "Create a 2D vector."
  (make-instance 'vec2 :x (float x) :y (float y)))

(defun make-vec4 (x y z w)
  "Create a 4D vector."
  (make-instance 'vec4
                 :x (float x)
                 :y (float y)
                 :z (float z)
                 :w (float w)))

(defun make-color (r g b &optional (a 1.0))
  "Create a color vector (RGBA). Values should be 0.0-1.0."
  (make-instance 'vec4
                 :x (float r)
                 :y (float g)
                 :z (float b)
                 :w (float a)))

;;; Conversion to/from foreign memory

(defun vec2-to-foreign (vec2 ptr)
  "Copy vec2 instance to foreign ImVec2 pointer."
  (setf (cffi:foreign-slot-value ptr '(:struct vec2) 'x) (vec2-x vec2))
  (setf (cffi:foreign-slot-value ptr '(:struct vec2) 'y) (vec2-y vec2))
  ptr)

(defun foreign-to-vec2 (ptr)
  "Create vec2 instance from foreign ImVec2 pointer."
  (make-instance 'vec2
                 :x (cffi:foreign-slot-value ptr '(:struct vec2) 'x)
                 :y (cffi:foreign-slot-value ptr '(:struct vec2) 'y)))

(defun vec4-to-foreign (vec4 ptr)
  "Copy vec4 instance to foreign ImVec4 pointer."
  (setf (cffi:foreign-slot-value ptr '(:struct vec4) 'x) (vec4-x vec4))
  (setf (cffi:foreign-slot-value ptr '(:struct vec4) 'y) (vec4-y vec4))
  (setf (cffi:foreign-slot-value ptr '(:struct vec4) 'z) (vec4-z vec4))
  (setf (cffi:foreign-slot-value ptr '(:struct vec4) 'w) (vec4-w vec4))
  ptr)

(defun foreign-to-vec4 (ptr)
  "Create vec4 instance from foreign ImVec4 pointer."
  (make-instance 'vec4
                 :x (cffi:foreign-slot-value ptr '(:struct vec4) 'x)
                 :y (cffi:foreign-slot-value ptr '(:struct vec4) 'y)
                 :z (cffi:foreign-slot-value ptr '(:struct vec4) 'z)
                 :w (cffi:foreign-slot-value ptr '(:struct vec4) 'w)))

;;; Macros for automatic conversion

(defmacro with-vec2 ((var vec2) &body body)
  "Execute body with VAR bound to a foreign ImVec2 initialized from VEC2."
  (let ((vec-var (gensym "VEC")))
    `(let ((,vec-var ,vec2))
       (cffi:with-foreign-object (,var '(:struct vec2))
         (vec2-to-foreign ,vec-var ,var)
         ,@body))))

(defmacro with-vec4 ((var vec4) &body body)
  "Execute body with VAR bound to a foreign ImVec4 initialized from VEC4."
  (let ((vec-var (gensym "VEC")))
    `(let ((,vec-var ,vec4))
       (cffi:with-foreign-object (,var '(:struct vec4))
         (vec4-to-foreign ,vec-var ,var)
         ,@body))))

(defun rgb (r g b)
  "Create RGB color (0-255 values)."
  (make-color (/ r 255.0) (/ g 255.0) (/ b 255.0) 1.0))

(defun rgba (r g b a)
  "Create RGBA color (0-255 values)."
  (make-color (/ r 255.0) (/ g 255.0) (/ b 255.0) (/ a 255.0)))

(defun hex-color (hex)
  "Create color from hex value. E.g., #xFF0000 for red."
  (let ((r (ldb (byte 8 16) hex))
        (g (ldb (byte 8 8) hex))
        (b (ldb (byte 8 0) hex)))
    (rgb r g b)))

;;; Predefined colors
(defparameter *color-white* (make-color 1.0 1.0 1.0 1.0))
(defparameter *color-black* (make-color 0.0 0.0 0.0 1.0))
(defparameter *color-red* (make-color 1.0 0.0 0.0 1.0))
(defparameter *color-green* (make-color 0.0 1.0 0.0 1.0))
(defparameter *color-blue* (make-color 0.0 0.0 1.0 1.0))
(defparameter *color-yellow* (make-color 1.0 1.0 0.0 1.0))
(defparameter *color-cyan* (make-color 0.0 1.0 1.0 1.0))
(defparameter *color-magenta* (make-color 1.0 0.0 1.0 1.0))
(defparameter *color-transparent* (make-color 0.0 0.0 0.0 0.0))

(defvar *context* nil
  "Current ImGui context.")

(defun initialize (&optional (shared-font-atlas (cffi:null-pointer)))
  "Initialize ImGui and create a context."
  (unless *context*
    (setf *context* (create-context shared-font-atlas)))
  *context*)

(defun shutdown ()
  "Shutdown ImGui and destroy the context."
  (when *context*
    (destroy-context *context*)
    (setf *context* nil)))

(defmacro with-context ((&optional context) &body body)
  "Execute body with an ImGui context. Creates one if not provided."
  (let ((ctx (gensym "CTX")))
    `(let ((,ctx ,(or context '(initialize))))
       (unwind-protect
            (progn ,@body)
         (when (and (not ,context) ,ctx)
           (destroy-context ,ctx))))))

(defmacro with-window ((name &key (open nil open-p) (flags 0)) &body body)
  "Execute body within an ImGui window. Automatically calls End."
  (let ((open-var (gensym "OPEN"))
        (result-var (gensym "RESULT")))
    `(let* ((,open-var ,(if open-p open t))
            (,result-var (begin ,name
                                ,(if open-p
                                     `(cffi:foreign-alloc :bool :initial-element ,open-var)
                                     '(cffi:null-pointer))
                                ,flags)))
       (unwind-protect
            (when ,result-var
              ,@body)
         (end)))))

(defmacro with-child ((str-id &key (size-x 0.0) (size-y 0.0) (child-flags 0) (window-flags 0)) &body body)
  "Execute body within a child window. Automatically calls EndChild."
  `(when (begin-child ,str-id (float ,size-x) (float ,size-y) ,child-flags ,window-flags)
     (unwind-protect
          (progn ,@body)
       (end-child))))

(defmacro with-group (&body body)
  "Execute body within a group. Groups widgets together."
  `(progn
     (begin-group)
     (unwind-protect
          (progn ,@body)
       (end-group))))

(defmacro with-id ((id) &body body)
  "Execute body with a specific ID pushed onto the stack."
  `(progn
     (push-id ,id)
     (unwind-protect
          (progn ,@body)
       (pop-id))))

(defmacro with-style-color ((idx color) &body body)
  "Execute body with a temporary style color."
  (let ((c (gensym "COLOR")))
    `(let ((,c ,color))
       (push-style-color-im-vec4 ,idx (vec4-x ,c) (vec4-y ,c) (vec4-z ,c) (vec4-w ,c))
       (unwind-protect
            (progn ,@body)
         (pop-style-color-ex 1)))))

(defmacro with-style-colors ((&rest color-specs) &body body)
  "Execute body with multiple temporary style colors.
   COLOR-SPECS is a list of (idx color) pairs."
  (let ((count (length color-specs)))
    `(progn
       ,@(mapcar (lambda (spec)
                   (destructuring-bind (idx color) spec
                     (let ((c (gensym "COLOR")))
                       `(let ((,c ,color))
                          (push-style-color-im-vec4 ,idx (vec4-x ,c) (vec4-y ,c) (vec4-z ,c) (vec4-w ,c))))))
                 color-specs)
       (unwind-protect
            (progn ,@body)
         (pop-style-color-ex ,count)))))

(defmacro with-style-var ((idx val) &body body)
  "Execute body with a temporary style variable."
  `(progn
     (push-style-var ,idx ,val)
     (unwind-protect
          (progn ,@body)
       (pop-style-var-ex 1))))

(defmacro with-font ((font) &body body)
  "Execute body with a specific font."
  `(progn
     (push-font ,font)
     (unwind-protect
          (progn ,@body)
       (pop-font))))

(defun text-colored (color text)
  "Display colored text."
  (text-colored-v (vec4-x color) (vec4-y color) (vec4-z color) (vec4-w color)
                  text (cffi:null-pointer)))

(defun button-colored (label color &key (size-x 0.0) (size-y 0.0))
  "Create a button with custom color."
  (with-style-color (:button color)
    (button-ex label (float size-x) (float size-y))))

(defun input-float-simple (label value &key (step 0.0) (step-fast 0.0) (format "%.3f") (flags 0))
  "Simplified input-float that returns the new value."
  (cffi:with-foreign-object (val :float)
    (setf (cffi:mem-ref val :float) (float value))
    (input-float-ex label val step step-fast format flags)
    (cffi:mem-ref val :float)))

(defun input-int-simple (label value &key (step 1) (step-fast 100) (flags 0))
  "Simplified input-int that returns the new value."
  (cffi:with-foreign-object (val :int)
    (setf (cffi:mem-ref val :int) value)
    (input-int-ex label val step step-fast flags)
    (cffi:mem-ref val :int)))

(defun checkbox-simple (label checked)
  "Simplified checkbox that returns the new state."
  (cffi:with-foreign-object (val :bool)
    (setf (cffi:mem-ref val :bool) checked)
    (checkbox label val)
    (cffi:mem-ref val :bool)))

(defun slider-float-simple (label value min max &key (format "%.3f") (flags 0))
  "Simplified slider-float that returns the new value."
  (cffi:with-foreign-object (val :float)
    (setf (cffi:mem-ref val :float) (float value))
    (slider-float-ex label val (float min) (float max) format flags)
    (cffi:mem-ref val :float)))

(defun slider-int-simple (label value min max &key (format "%d") (flags 0))
  "Simplified slider-int that returns the new value."
  (cffi:with-foreign-object (val :int)
    (setf (cffi:mem-ref val :int) value)
    (slider-int-ex label val min max format flags)
    (cffi:mem-ref val :int)))

(defun color-edit-simple (label color &key (flags 0))
  "Simplified color editor that returns the new color as a vec4."
  (cffi:with-foreign-object (col :float 4)
    (setf (cffi:mem-aref col :float 0) (vec4-x color))
    (setf (cffi:mem-aref col :float 1) (vec4-y color))
    (setf (cffi:mem-aref col :float 2) (vec4-z color))
    (setf (cffi:mem-aref col :float 3) (vec4-w color))
    (color-edit4 label col flags)
    (make-instance 'vec4
                   :x (cffi:mem-aref col :float 0)
                   :y (cffi:mem-aref col :float 1)
                   :z (cffi:mem-aref col :float 2)
                   :w (cffi:mem-aref col :float 3))))

(defmacro with-tree-node ((label &key (flags 0)) &body body)
  "Execute body if tree node is open. Automatically calls TreePop."
  `(when (tree-node-ex ,label ,flags)
     (unwind-protect
          (progn ,@body)
       (tree-pop))))

(defmacro with-collapsing-header ((label &key (flags 0)) &body body)
  "Execute body if collapsing header is open."
  `(when (collapsing-header ,label ,flags)
     ,@body))

(defmacro with-main-menu-bar (&body body)
  "Execute body within main menu bar."
  `(when (begin-main-menu-bar)
     (unwind-protect
          (progn ,@body)
       (end-main-menu-bar))))

(defmacro with-menu-bar (&body body)
  "Execute body within window menu bar."
  `(when (begin-menu-bar)
     (unwind-protect
          (progn ,@body)
       (end-menu-bar))))

(defmacro with-menu ((label &key (enabled t)) &body body)
  "Execute body within a menu."
  `(when (begin-menu-ex ,label ,enabled)
     (unwind-protect
          (progn ,@body)
       (end-menu))))

(defmacro with-popup ((str-id &key (flags 0)) &body body)
  "Execute body within a popup."
  `(when (begin-popup ,str-id ,flags)
     (unwind-protect
          (progn ,@body)
       (end-popup))))

(defmacro with-popup-modal ((name &key (open nil open-p) (flags 0)) &body body)
  "Execute body within a modal popup."
  (let ((open-var (gensym "OPEN")))
    `(let ((,open-var ,(if open-p open t)))
       (when (begin-popup-modal ,name
                                ,(if open-p
                                     `(cffi:foreign-alloc :bool :initial-element ,open-var)
                                     '(cffi:null-pointer))
                                ,flags)
         (unwind-protect
              (progn ,@body)
           (end-popup))))))

(defmacro with-table ((str-id columns &key (flags 0) (outer-size-x 0.0) (outer-size-y 0.0) (inner-width 0.0)) &body body)
  "Execute body within a table."
  `(when (begin-table-ex ,str-id ,columns ,flags (float ,outer-size-x) (float ,outer-size-y) (float ,inner-width))
     (unwind-protect
          (progn ,@body)
       (end-table))))

(defun same-line (&optional (offset-from-start-x 0.0) (spacing -1.0))
  "Keep next item on same line."
  (same-line-ex (float offset-from-start-x) (float spacing)))

(defun indent (&optional (indent-w 0.0))
  "Indent content."
  (indent-ex (float indent-w)))

(defun unindent (&optional (indent-w 0.0))
  "Unindent content."
  (unindent-ex (float indent-w)))

(defmethod print-object ((obj vec2) stream)
  (print-unreadable-object (obj stream :type t)
    (format stream "~,2F ~,2F" (vec2-x obj) (vec2-y obj))))

(defmethod print-object ((obj vec4) stream)
  (print-unreadable-object (obj stream :type t)
    (format stream "~,2F ~,2F ~,2F ~,2F"
            (vec4-x obj) (vec4-y obj) (vec4-z obj) (vec4-w obj))))

(export '(vec2 vec4
          vec2-x vec2-y
          vec4-x vec4-y vec4-z vec4-w
          make-vec2 make-vec4 make-color
          rgb rgba hex-color
          *color-white* *color-black* *color-red* *color-green*
          *color-blue* *color-yellow* *color-cyan* *color-magenta*
          *color-transparent*
          vec2-to-foreign foreign-to-vec2
          vec4-to-foreign foreign-to-vec4
          with-vec2 with-vec4
          *context*
          initialize shutdown with-context
          with-window with-child
          with-group with-id
          with-style-color with-style-colors with-style-var
          with-font
          text-colored button-colored
          input-float-simple input-int-simple
          checkbox-simple
          slider-float-simple slider-int-simple
          color-edit-simple
          with-tree-node with-collapsing-header
          with-main-menu-bar with-menu-bar with-menu
          with-popup with-popup-modal
          with-table
          same-line indent unindent))

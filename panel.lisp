(in-package :cl-dear-imgui)

;;;
;;; Window flag constants
;;;
(defparameter +wf-no-title-bar+ 1)
(defparameter +wf-no-resize+ 2)
(defparameter +wf-no-move+ 4)
(defparameter +wf-no-scrollbar+ 8)
(defparameter +wf-no-collapse+ 32)
(defparameter +wf-menu-bar+ 1024)
(defparameter +wf-no-bring-to-front+ 8192)
(defparameter +wf-no-inputs+ 197120)

;;;
;;; PANEL
;;;
(defclass panel (named basic-pane parent)
  ((x :initarg :x :initform 0.0)
   (y :initarg :y :initform 0.0)
   (width :initform 400.0)
   (height :initform 300.0)
   (title :initarg :title :initform "")
   (hidden-p :initform nil :reader hiddenp)
   (collapsed-p :initform nil :reader minimizedp)
   (window-flags :initform 0)
   (closable-p :initform nil)
   (first-frame-p :initform t)
   (option-list :initform nil)
   (style :initform nil)
   (redefined-p :initform nil)
   (bounds-updated-p :initform nil)))

(defgeneric on-close (element)
  (:method ((this panel)) (declare (ignore this))))

(defgeneric on-minimize (element)
  (:method ((this panel)) (declare (ignore this))))

(defgeneric on-restore (element)
  (:method ((this panel)) (declare (ignore this))))

(defgeneric on-move (element)
  (:method ((this panel)) (declare (ignore this))))

(defun update-panel-position (panel x y)
  (with-slots ((this-x x) (this-y y) bounds-updated-p) panel
    (setf this-x (float x 0.0)
          this-y (float y 0.0)
          bounds-updated-p t)))

(defun update-panel-size (panel width height)
  (with-slots ((this-width width) (this-height height) bounds-updated-p) panel
    (setf this-width (float width 0.0)
          this-height (float height 0.0)
          bounds-updated-p t)))

(defun %panel-position (panel)
  (with-slots (x y) panel
    (values x y)))

(defmacro with-panel-position ((x y) panel &body body)
  `(multiple-value-bind (,x ,y) (%panel-position ,panel)
     (declare (ignorable ,x ,y))
     ,@body))

(defun panel-position (panel &optional (result-vec2 (make-vec2)))
  (with-panel-position (x y) panel
    (setf (vec2-x result-vec2) (float x 0.0)
          (vec2-y result-vec2) (float y 0.0))
    result-vec2))

(defun %panel-dimensions (panel)
  (with-slots (width height) panel
    (values width height)))

(defmacro with-panel-dimensions ((width height) panel &body body)
  `(multiple-value-bind (,width ,height) (%panel-dimensions ,panel)
     (declare (ignorable ,width ,height))
     ,@body))

(defun panel-size (panel &optional (result-vec2 (make-vec2)))
  (with-panel-dimensions (width height) panel
    (setf (vec2-x result-vec2) (float width 0.0)
          (vec2-y result-vec2) (float height 0.0))
    result-vec2))

(defun hide-panel (panel)
  (with-slots (hidden-p) panel
    (unless hidden-p
      (setf hidden-p t))))

(defun show-panel (panel)
  (with-slots (hidden-p) panel
    (when hidden-p
      (setf hidden-p nil))))

(defun minimize-panel (panel)
  (with-ui-access (*context*)
    (set-next-window-collapsed t 0)))

(defun restore-panel (panel)
  (declare (ignore panel))
  (with-ui-access (*context*)
    (set-next-window-collapsed nil 0)))

(defun setup-panel (panel &key
                            (width 400)
                            (height 300)
                            (origin (make-vec2))
                            (title "") (background-color nil)
                            (hidden nil)
                            style
                    &allow-other-keys)
  (with-slots ((w width) (h height) (this-x x) (this-y y)
               (this-title title) (this-style style)
               first-frame-p bounds-updated-p)
      panel
    (setf w (float width 0.0)
          h (float height 0.0)
          this-style (apply #'make-style
                            (append (loop for (name value) on style by #'cddr
                                          if (eq name :from)
                                            append value
                                          else
                                            append (list name value))
                                    (list :layout-spacing 4
                                          :row-height 26)
                                    (when background-color
                                      (list :panel-background background-color))))
          this-x (vec2-x origin)
          this-y (vec2-y origin)
          this-title title
          first-frame-p t
          bounds-updated-p t)
    (when hidden
      (hide-panel panel))))

(defmethod initialize-instance :after ((this panel) &key &allow-other-keys)
  (reinitialize-panel this))

(defun add-panel (ui panel-class &rest initargs &key &allow-other-keys)
  (with-ui (ui)
    (%add-panel ui (apply #'make-instance panel-class initargs))))

(defun remove-panel (ui panel)
  (%remove-panel ui panel))

(defun remove-all-panels (ui)
  (%remove-all-panels ui))

(defun find-element (name &optional (panel *panel*))
  (labels ((%find-element (root name)
             (if (equal (name-of root) name)
                 root
                 (loop for child in (children-of root)
                    thereis (%find-element child name)))))
    (%find-element panel name)))

(defmethod compose :around ((this panel))
  (with-slots (style) this
    (if style
        (with-style (style)
          (call-next-method))
        (call-next-method))))

(defun compose-panel (win)
  (with-slots (x y width height title window-flags closable-p
               first-frame-p bounds-updated-p collapsed-p) win
    ;; Set position/size on first frame or when bounds updated
    (when (or first-frame-p bounds-updated-p)
      (set-next-window-pos (float x 0.0) (float y 0.0) 1)
      (set-next-window-size (float width 0.0) (float height 0.0) 1)
      (setf first-frame-p nil
            bounds-updated-p nil))
    ;; Begin window
    (let* ((window-id (format nil "~A###~A" title (%pane-id-of win)))
           (p-open (if closable-p
                       (cffi:foreign-alloc :bool :initial-element t)
                       (cffi:null-pointer)))
           (visible (begin window-id p-open window-flags)))
      (unwind-protect
           (progn
             ;; Compose children if visible
             (when visible
               (dolist (child (children-of win))
                 (compose child)))
             ;; Check collapsed state
             (let ((now-collapsed (is-window-collapsed)))
               (unless (eq now-collapsed collapsed-p)
                 (setf collapsed-p now-collapsed)
                 (if collapsed-p
                     (on-minimize win)
                     (on-restore win))))
             ;; Check if closed via p-open
             (when (and closable-p (not (cffi:mem-ref p-open :bool)))
               (with-slots (hidden-p) win
                 (setf hidden-p t))
               (on-close win)))
        ;; Always call End
        (end)
        ;; Free p-open if allocated
        (unless (cffi:null-pointer-p p-open)
          (cffi:foreign-free p-open))))))

(defmethod compose ((this panel))
  (with-slots (hidden-p redefined-p bounds-updated-p) this
    (unless hidden-p
      (when redefined-p
        (reinitialize-panel this)
        (setf redefined-p nil
              bounds-updated-p t))
      (let ((*panel* this))
        (compose-panel this)))))

(defun root-panel ()
  *panel*)

(defmethod update-instance-for-redefined-class :after ((this panel)
                                                       added-slots
                                                       discarded-slots
                                                       property-list
                                                       &rest initargs)
  (declare (ignore added-slots discarded-slots property-list initargs))
  (with-slots (redefined-p) this
    (setf redefined-p t)))

(defgeneric reinitialize-panel (panel)
  (:method (panel) (declare (ignore panel))))

(defun update-panel-options (panel &rest opts)
  (with-slots (window-flags closable-p option-list) panel
    (setf option-list opts)
    (let ((flags 0))
      (let ((has-movable nil)
            (has-resizable nil)
            (has-minimizable nil)
            (has-scrollable nil)
            (has-closable nil))
        (loop for opt in opts
              do (ecase opt
                   (:movable (setf has-movable t))
                   (:resizable (setf has-resizable t))
                   (:minimizable (setf has-minimizable t))
                   (:scrollable (setf has-scrollable t))
                   (:closable (setf has-closable t))
                   (:headerless (setf flags (logior flags +wf-no-title-bar+)))
                   (:backgrounded (setf flags (logior flags +wf-no-bring-to-front+)))
                   (:inputless (setf flags (logior flags +wf-no-inputs+)))
                   (:menu-bar (setf flags (logior flags +wf-menu-bar+)))))
        ;; Set negative flags (if option NOT present, add the restriction)
        (unless has-movable
          (setf flags (logior flags +wf-no-move+)))
        (unless has-resizable
          (setf flags (logior flags +wf-no-resize+)))
        (unless has-minimizable
          (setf flags (logior flags +wf-no-collapse+)))
        (unless has-scrollable
          (setf flags (logior flags +wf-no-scrollbar+)))
        (setf closable-p has-closable))
      (setf window-flags flags))))

(defmacro defpanel (name-and-opts &body layout)
  (flet ((filter-panel-initargs (opts)
           (loop with special-keywords = '(:inherit :options)
                 for (key . value) in opts
                 unless (member key special-keywords)
                   append (case key
                            (:origin (list key
                                           `(make-vec2 ,(or (first value) 0)
                                                             ,(or (second value) 0))))
                            (:background-color
                             (list key `(make-vec4 ,(or (first value) 0)
                                                         ,(or (second value) 0)
                                                         ,(or (third value) 0)
                                                         ,(or (fourth value) 1))))
                            (:style (list key `(list ,@value)))
                            (t (list key (first value)))))))
    (destructuring-bind (name &rest opts) (alexandria:ensure-list name-and-opts)
      (let ((layout-parent (gensym "LAYOUT-PARENT"))
            (initargs (filter-panel-initargs opts)))
        `(progn
           (defclass ,name (panel ,@(alexandria:assoc-value opts :inherit)) ()
             (:default-initargs ,@initargs))
           (defmethod reinitialize-panel ((,layout-parent ,name))
             (setup-panel ,layout-parent ,@initargs)
             (update-panel-options ,layout-parent ,@(alexandria:assoc-value opts :options))
             (abandon-all ,layout-parent)
             ,(when layout
                `(layout (,layout-parent) ,@layout)))
           (make-instances-obsolete ',name))))))

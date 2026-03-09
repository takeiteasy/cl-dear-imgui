(in-package :cl-dear-imgui/ui)

(defvar *radio-group* nil)

(declaim (special *panel*))

(defgeneric text-of (element))
(defgeneric (setf text-of) (value element))
(defgeneric compose (element))

;;;
;;; PARENT / CHILD infrastructure
;;;
(defclass parent ()
  ((children :initform nil :accessor children-of)))

(defgeneric adopt (parent child)
  (:method ((parent parent) child)
    (push child (children-of parent))
    child))

(defgeneric abandon (parent child)
  (:method ((parent parent) child)
    (alexandria:deletef (children-of parent) child)
    child))

(defgeneric abandon-all (parent)
  (:method ((parent parent))
    (setf (children-of parent) nil)))

(defmacro dochildren ((var parent) &body body)
  `(dolist (,var (children-of ,parent))
     ,@body))

(defmacro parent-tree ((parent-var) &body children)
  "Convenience macro for building a parent-child tree."
  (let ((p (gensym "PARENT")))
    `(let ((,p ,parent-var))
       ,@(loop for child in children
               collect `(adopt ,p ,child))
       ,p)))

;;;
;;; NAMED
;;;
(defclass named ()
  ((name :initarg :name :initform nil :reader name-of)))

;;;
;;; STYLED
;;;
(defclass styled ()
  ((style :initform nil)))

(defmethod initialize-instance :after ((this styled) &key style)
  (with-slots ((this-style style)) this
    (when style
      (setf this-style (apply #'make-style style)))))

(defmethod compose :around ((this styled))
  (with-slots (style) this
    (if style
        (with-style (style)
          (call-next-method))
        (call-next-method))))

;;;
;;; LAYOUT macro
;;;
(defmacro layout ((parent-layout) &body elements)
  `(parent-tree (,parent-layout) ,@elements))

;;;
;;; EXPANDABLE
;;;
(defgeneric expand-ratio-of (element)
  (:method (element) (declare (ignore element)) nil))

(defgeneric expandablep (element)
  (:method (element) (declare (ignore element)) t))

(defclass expandable ()
  ((expand-ratio :initform nil :initarg :expand-ratio :reader expand-ratio-of)
   (expandable-p :initform t :initarg :expandable :reader expandablep)))

;;;
;;; %LAYOUT (internal base layout)
;;;
(defclass %layout (named styled parent) ())

(defmethod compose ((this %layout))
  (dochildren (element this)
    (compose element)))

(defun make-container-layout ()
  (make-instance '%layout))

;;;
;;; BASIC PANE
;;;
(defclass basic-pane ()
  ((pane-id :initform (%next-pane-id) :reader %pane-id-of)))

;;;
;;; WIDGET
;;;
(defgeneric hide-widget (widget))
(defgeneric show-widget (widget))

(defclass widget (named styled expandable)
  ((hidden :initform nil :reader hiddenp)
   (width :initform nil :initarg :width :reader width-of)
   (height :initform nil :initarg :height :reader height-of)))

(defmethod hide-widget ((this widget))
  (with-slots (hidden) this
    (setf hidden t)))

(defmethod show-widget ((this widget))
  (with-slots (hidden) this
    (setf hidden nil)))

(defmethod compose :around ((this widget))
  (unless (hiddenp this)
    (call-next-method)))

(defmethod children-of ((this widget))
  (declare (ignore this))
  nil)

;;;
;;; BEHAVIOR ELEMENT
;;;
(defclass behavior-element (named)
  ((delegate :initarg :delegate :initform (error ":delegate missing"))))

(defmethod expand-ratio-of ((this behavior-element))
  (with-slots (delegate) this
    (expand-ratio-of delegate)))

(defmethod expandablep ((this behavior-element))
  (with-slots (delegate) this
    (expandablep delegate)))

(defmethod children-of ((this behavior-element))
  (with-slots (delegate) this
    (children-of delegate)))

(defmethod adopt ((this behavior-element) child)
  (with-slots (delegate) this
    (adopt delegate child)))

(defmethod abandon ((this behavior-element) child)
  (with-slots (delegate) this
    (abandon delegate child)))

(defmethod abandon-all ((this behavior-element))
  (with-slots (delegate) this
    (abandon-all delegate)))

(defmethod compose ((this behavior-element))
  (with-slots (delegate) this
    (compose delegate)))

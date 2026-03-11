(in-package :cl-dear-imgui)

;;;
;;; SCROLL AREA
;;;
(defclass scroll-area (basic-pane widget)
  ((layout :initform (make-instance 'vertical-layout))
   (scroll-x :initform 0.0)
   (scroll-y :initform 0.0)))

(defun make-scroll-area (&key width height)
  (make-instance 'scroll-area :width width :height height))

(defmethod children-of ((this scroll-area))
  (with-slots (layout) this
    (children-of layout)))

(defmethod adopt ((this scroll-area) child)
  (with-slots (layout) this
    (adopt layout child)))

(defmethod abandon ((this scroll-area) child)
  (with-slots (layout) this
    (abandon layout child)))

(defmethod abandon-all ((this scroll-area))
  (with-slots (layout) this
    (abandon-all layout)))

(defun update-area-scroll-position (pane x y)
  (with-slots (scroll-x scroll-y) pane
    (setf scroll-x (float x 0.0)
          scroll-y (float y 0.0)))
  (values))

(defun %area-scroll-position (pane)
  (with-slots (scroll-x scroll-y) pane
    (values scroll-x scroll-y)))

(defmacro with-area-scroll-position ((x y) pane &body body)
  `(multiple-value-bind (,x ,y) (%area-scroll-position ,pane)
     (declare (ignorable ,x ,y))
     ,@body))

(defun area-scroll-position (pane &optional (result (make-vec2)))
  (multiple-value-bind (x y) (%area-scroll-position pane)
    (setf (vec2-x result) (float x 0.0)
          (vec2-y result) (float y 0.0))
    result))

(defmethod compose ((this scroll-area))
  (with-slots (layout scroll-y) this
    (when (begin-child (%pane-id-of this)
                              (float (or (width-of this) 0.0) 0.0)
                              (float (or (height-of this) 0.0) 0.0)
                              0 0)
      (unwind-protect
           (progn
             (compose layout)
             (setf scroll-y (get-scroll-y)))
        (end-child)))))

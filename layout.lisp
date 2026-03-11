(in-package :cl-dear-imgui)

;;;
;;; VERTICAL LAYOUT
;;;
(defclass vertical-layout (parent named styled expandable) ())

(defun make-vertical-layout (&key name)
  (make-instance 'vertical-layout :name name))

(defmethod compose ((this vertical-layout))
  (begin-group)
  (unwind-protect
       (dochildren (child this)
         (compose child))
    (end-group)))

;;;
;;; HORIZONTAL LAYOUT
;;;
(defclass horizontal-layout (parent named styled expandable) ())

(defun make-horizontal-layout (&key name)
  (make-instance 'horizontal-layout :name name))

(defmethod compose ((this horizontal-layout))
  (begin-group)
  (unwind-protect
       (let ((first t))
         (dochildren (child this)
           (if first
               (setf first nil)
               (same-line))
           (compose child)))
    (end-group)))

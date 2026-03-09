(in-package :cl-dear-imgui/ui)

;;;
;;; VERTICAL LAYOUT
;;;
(defclass vertical-layout (parent named styled expandable) ())

(defun make-vertical-layout (&key name)
  (make-instance 'vertical-layout :name name))

(defmethod compose ((this vertical-layout))
  (imgui::begin-group)
  (unwind-protect
       (dochildren (child this)
         (compose child))
    (imgui::end-group)))

;;;
;;; HORIZONTAL LAYOUT
;;;
(defclass horizontal-layout (parent named styled expandable) ())

(defun make-horizontal-layout (&key name)
  (make-instance 'horizontal-layout :name name))

(defmethod compose ((this horizontal-layout))
  (imgui::begin-group)
  (unwind-protect
       (let ((first t))
         (dochildren (child this)
           (if first
               (setf first nil)
               (imgui:same-line))
           (compose child)))
    (imgui::end-group)))

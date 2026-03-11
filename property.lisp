(in-package :cl-dear-imgui)

;;;
;;; FLOAT PROPERTY — Slider
;;;
(defclass float-property (widget)
  ((label :initarg :label :initform "")
   (min :initarg :start :initform 0.0)
   (max :initarg :end :initform 1.0)
   (value :initarg :value :initform 0.0)))

(defun make-float-property (label &key (start 0.0) (end 1.0) (value 0.0) name)
  (make-instance 'float-property :label label
                 :start start :end end :value value :name name))

(defmethod compose ((this float-property))
  (with-slots (value min max label) this
    (setf value (slider-float-simple
                 label (float value 0.0)
                 (float min 0.0) (float max 0.0)))))

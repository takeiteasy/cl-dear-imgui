(in-package :cl-dear-imgui)

;;;
;;; COLOR PICKER
;;;
(defclass color-picker (widget)
  ((color :initform (make-vec4 1 1 1 1))
   (label :initarg :label :initform "##colorpicker")))

(defmethod initialize-instance :after ((this color-picker) &key (color (make-vec4 1 1 1 1)))
  (with-slots ((this-color color)) this
    (setf this-color color)))

(defun make-color-picker (&key label color)
  (make-instance 'color-picker
                 :label (or label "##colorpicker")
                 :color (or color (make-vec4 1 1 1 1))))

(defmethod compose ((this color-picker))
  (with-slots (color label) this
    (cffi:with-foreign-object (col :float 4)
      (setf (cffi:mem-aref col :float 0) (float (vec4-x color) 0.0)
            (cffi:mem-aref col :float 1) (float (vec4-y color) 0.0)
            (cffi:mem-aref col :float 2) (float (vec4-z color) 0.0)
            (cffi:mem-aref col :float 3) (float (vec4-w color) 0.0))
      (color-picker4 label col 0 (cffi:null-pointer))
      (setf (vec4-x color) (cffi:mem-aref col :float 0)
            (vec4-y color) (cffi:mem-aref col :float 1)
            (vec4-z color) (cffi:mem-aref col :float 2)
            (vec4-w color) (cffi:mem-aref col :float 3)))))

(in-package :cl-dear-imgui/ui)

;;;
;;; COLOR PICKER
;;;
(defclass color-picker (widget)
  ((color :initform (v:vec4 1 1 1 1))
   (label :initarg :label :initform "##colorpicker")))

(defmethod initialize-instance :after ((this color-picker) &key (color (v:vec4 1 1 1 1)))
  (with-slots ((this-color color)) this
    (setf this-color color)))

(defun make-color-picker (&key label color)
  (make-instance 'color-picker
                 :label (or label "##colorpicker")
                 :color (or color (v:vec4 1 1 1 1))))

(defmethod compose ((this color-picker))
  (with-slots (color label) this
    (cffi:with-foreign-object (col :float 4)
      (setf (cffi:mem-aref col :float 0) (float (v:vx color) 0.0)
            (cffi:mem-aref col :float 1) (float (v:vy color) 0.0)
            (cffi:mem-aref col :float 2) (float (v:vz color) 0.0)
            (cffi:mem-aref col :float 3) (float (v:vw color) 0.0))
      (imgui::color-picker4 label col 0 (cffi:null-pointer))
      (setf (v:vx color) (cffi:mem-aref col :float 0)
            (v:vy color) (cffi:mem-aref col :float 1)
            (v:vz color) (cffi:mem-aref col :float 2)
            (v:vw color) (cffi:mem-aref col :float 3)))))

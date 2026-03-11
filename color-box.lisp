(in-package :cl-dear-imgui)

;;;
;;; COLOR BOX — Click swatch to open color picker popup
;;;
(defclass color-box (widget)
  ((label :initarg :label :initform "Color")
   (color :initarg :color :initform (make-vec4 1 1 1 1))
   (popup-id :initform nil)))

(defmethod initialize-instance :after ((this color-box) &key)
  (with-slots (popup-id) this
    (setf popup-id (format nil "color-popup-~A" (%next-pane-id)))))

(defun make-color-box (&key label color name)
  (make-instance 'color-box :name name
                 :label (or label "Color")
                 :color (or color (make-vec4 1 1 1 1))))

(defmethod compose ((this color-box))
  (with-slots (label (this-color color) popup-id) this
    ;; Color button swatch
    (when (color-button label
                               (float (vec4-x this-color) 0.0)
                               (float (vec4-y this-color) 0.0)
                               (float (vec4-z this-color) 0.0)
                               (float (vec4-w this-color) 0.0)
                               0)
      (open-popup popup-id 0))
    ;; Popup with color picker
    (when (begin-popup popup-id 0)
      (unwind-protect
           (cffi:with-foreign-object (col :float 4)
             (setf (cffi:mem-aref col :float 0) (float (vec4-x this-color) 0.0)
                   (cffi:mem-aref col :float 1) (float (vec4-y this-color) 0.0)
                   (cffi:mem-aref col :float 2) (float (vec4-z this-color) 0.0)
                   (cffi:mem-aref col :float 3) (float (vec4-w this-color) 0.0))
             (color-picker4 (format nil "##~A" popup-id) col 0 (cffi:null-pointer))
             (setf (vec4-x this-color) (cffi:mem-aref col :float 0)
                   (vec4-y this-color) (cffi:mem-aref col :float 1)
                   (vec4-z this-color) (cffi:mem-aref col :float 2)
                   (vec4-w this-color) (cffi:mem-aref col :float 3)))
        (end-popup)))))

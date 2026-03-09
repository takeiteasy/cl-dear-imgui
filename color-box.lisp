(in-package :cl-dear-imgui/ui)

;;;
;;; COLOR BOX — Click swatch to open color picker popup
;;;
(defclass color-box (widget)
  ((label :initarg :label :initform "Color")
   (color :initarg :color :initform (v:vec4 1 1 1 1))
   (popup-id :initform nil)))

(defmethod initialize-instance :after ((this color-box) &key)
  (with-slots (popup-id) this
    (setf popup-id (format nil "color-popup-~A" (%next-pane-id)))))

(defun make-color-box (&key label color name)
  (make-instance 'color-box :name name
                 :label (or label "Color")
                 :color (or color (v:vec4 1 1 1 1))))

(defmethod compose ((this color-box))
  (with-slots (label (this-color color) popup-id) this
    ;; Color button swatch
    (when (imgui::color-button-xy label
                                   (float (v:vx this-color) 0.0)
                                   (float (v:vy this-color) 0.0)
                                   (float (v:vz this-color) 0.0)
                                   (float (v:vw this-color) 0.0)
                                   0 0.0 0.0)
      (imgui::open-popup popup-id 0))
    ;; Popup with color picker
    (when (imgui::begin-popup popup-id 0)
      (unwind-protect
           (cffi:with-foreign-object (col :float 4)
             (setf (cffi:mem-aref col :float 0) (float (v:vx this-color) 0.0)
                   (cffi:mem-aref col :float 1) (float (v:vy this-color) 0.0)
                   (cffi:mem-aref col :float 2) (float (v:vz this-color) 0.0)
                   (cffi:mem-aref col :float 3) (float (v:vw this-color) 0.0))
             (imgui::color-picker4 (format nil "##~A" popup-id) col 0 (cffi:null-pointer))
             (setf (v:vx this-color) (cffi:mem-aref col :float 0)
                   (v:vy this-color) (cffi:mem-aref col :float 1)
                   (v:vz this-color) (cffi:mem-aref col :float 2)
                   (v:vw this-color) (cffi:mem-aref col :float 3)))
        (imgui::end-popup)))))

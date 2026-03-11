(in-package :cl-dear-imgui)

;;;
;;; LABEL
;;;
(defclass label (widget)
  ((text :initarg :text :initform "" :accessor text-of)))

(defun make-label (text)
  (make-instance 'label :text text))

(defmethod compose ((this label))
  (with-slots (text) this
    (let ((str (if (functionp text)
                   (format nil "~A" (funcall text))
                   (or text ""))))
      (text-unformatted-ex str (cffi:null-pointer)))))

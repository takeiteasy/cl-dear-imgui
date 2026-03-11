(in-package :cl-dear-imgui)

;;;
;;; BUTTON
;;;
(defclass button (widget)
  ((label :initarg :label :initform "")
   (click-listener :initarg :on-click :initform nil)))

(defun make-button (label &key on-click)
  (make-instance 'button :label label :on-click on-click))

(defmethod compose ((this button))
  (with-slots (label click-listener) this
    (when (button label)
      (when click-listener
        (funcall click-listener *panel*)))))

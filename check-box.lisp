(in-package :cl-dear-imgui)

;;;
;;; CHECK BOX
;;;
(defclass check-box (widget)
  ((label :initarg :label :initform "")
   (checked-p :initarg :enabled-p :initform nil :accessor checked)
   (click-listener :initarg :on-click :initform nil)))

(defun make-check-box (label &key name enabled-p on-click)
  (make-instance 'check-box :label label :name name
                 :enabled-p enabled-p :on-click on-click))

(defmethod compose ((this check-box))
  (with-slots ((this-checked-p checked-p) click-listener label) this
    (let ((new-checked (checkbox-simple label this-checked-p)))
      (unless (eq this-checked-p new-checked)
        (setf this-checked-p new-checked)
        (when click-listener
          (funcall click-listener *panel*))))))

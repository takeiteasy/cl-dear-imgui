(in-package :cl-dear-imgui/ui)

;;;
;;; SPACING
;;;
(defclass spacing (widget)
  ((columns :initform 1 :initarg :columns)))

(defun make-spacing (&key (columns 1))
  (make-instance 'spacing :columns columns))

(defmethod compose ((this spacing))
  (with-slots (columns) this
    (if (= columns 1)
        (imgui:separator)
        (dotimes (i (floor columns))
          (imgui:spacing)))))

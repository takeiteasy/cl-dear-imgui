(in-package :cl-dear-imgui)

;;;
;;; MENU BAR — Parent panel must have :menu-bar option
;;;
(defclass menu-bar (%layout) ())

(defun make-menu-bar ()
  (make-instance 'menu-bar))

(defmethod compose ((this menu-bar))
  (when (begin-menu-bar)
    (unwind-protect
         (call-next-method)
      (end-menu-bar))))

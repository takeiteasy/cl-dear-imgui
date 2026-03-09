(in-package :cl-dear-imgui/ui)

;;;
;;; MENU BAR — Parent panel must have :menu-bar option
;;;
(defclass menu-bar (%layout) ())

(defun make-menu-bar ()
  (make-instance 'menu-bar))

(defmethod compose ((this menu-bar))
  (when (imgui::begin-menu-bar)
    (unwind-protect
         (call-next-method)
      (imgui::end-menu-bar))))

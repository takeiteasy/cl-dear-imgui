(in-package :cl-dear-imgui/ui)

;;;
;;; COMBO BOX — Pure Lisp strings, no foreign array needed
;;;
(defclass combo-box (widget)
  ((selected :initform 0 :accessor combo-box-selected)
   (values :initform (list "") :initarg :values)
   (label :initarg :label :initform "##combo")))

(defun make-combo-box (values &key label name)
  (make-instance 'combo-box :values values
                 :label (or label "##combo") :name name))

(defmethod compose ((this combo-box))
  (with-slots (selected values label) this
    (let ((preview (or (nth selected values) "")))
      (when (imgui::begin-combo label preview 0)
        (unwind-protect
             (loop for item in values
                   for i from 0
                   do (let ((is-selected (= i selected)))
                        (when (imgui::selectable item is-selected 0 0.0 0.0)
                          (setf selected i))))
          (imgui::end-combo))))))

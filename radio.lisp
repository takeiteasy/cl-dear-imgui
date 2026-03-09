(in-package :cl-dear-imgui/ui)

;;;
;;; RADIO GROUP
;;;
(defclass radio-group (behavior-element)
  ((radio-list :initform nil)
   (active :initform nil :reader active-radio-button-of)
   (on-change :initform nil :initarg :on-change))
  (:default-initargs :delegate (make-instance 'vertical-layout)))

(defun make-radio-group (delegate &key on-change)
  (make-instance 'radio-group :delegate delegate :on-change on-change))

(defun register-radio (radio)
  (with-slots (radio-list active) *radio-group*
    (when *radio-group*
      (cond
        ((and (null active) (activated radio))
         (setf active radio))
        ((and active (activated radio) (not (eq active radio)))
         (setf (activated radio) nil)))
      (push radio radio-list))))

(defun activate-radio (radio)
  (with-slots (radio-list active on-change) *radio-group*
    (when *radio-group*
      (let ((old-active active))
        (setf active radio)
        (loop for that-radio in radio-list
              unless (eq that-radio radio)
                do (setf (activated that-radio) nil))
        (unless (or (null on-change) (eq old-active radio))
          (funcall on-change *panel* radio))))))

(defmethod compose :around ((this radio-group))
  (with-slots (radio-list) this
    (let ((*radio-group* this))
      (call-next-method)
      (setf radio-list nil))))

;;;
;;; RADIO BUTTON
;;;
(defgeneric activated (radio))
(defgeneric (setf activated) (value radio))

(defclass radio (widget)
  ((label :initarg :label :initform "")
   (activated-p :initarg :activated :initform nil :accessor activated)
   (click-listener :initarg :on-click :initform nil)))

(defun make-radio (label &key activated on-click)
  (make-instance 'radio :label label :activated activated :on-click on-click))

(defmethod compose ((this radio))
  (with-slots (activated-p click-listener label) this
    (register-radio this)
    (when (imgui::radio-button label activated-p)
      (setf activated-p t)
      (activate-radio this)
      (when click-listener
        (funcall click-listener *panel*)))))

;; ui.lisp

(in-package :cl-dear-imgui)

(declaim (special *context*))

(defclass ui-context ()
  ((compose-tasks :initform nil)
   (compose-lock :initform (bt:make-lock "ui-compose-lock"))
   (last-panel-id :initform 0)
   (panels :initform nil :accessor %panels-of)
   (style :initform nil :reader %style-of)))

(defmethod initialize-instance :after ((this ui-context) &key)
  (with-slots (style) this
    (setf style (make-style))))

(defun make-ui ()
  (make-instance 'ui-context))

(defun %add-panel (ui panel)
  (push panel (%panels-of ui))
  panel)

(defun %remove-panel (ui panel)
  (alexandria:deletef (%panels-of ui) panel))

(defun %remove-all-panels (ui)
  (setf (%panels-of ui) nil))

(defun %next-pane-id ()
  (with-slots (last-panel-id) *context*
    (format nil "~A" (incf last-panel-id))))

(defun push-compose-task (ctx fn)
  (with-slots (compose-tasks compose-lock) ctx
    (bt:with-lock-held (compose-lock)
      (setf compose-tasks (nconc compose-tasks (list fn))))))

(defmacro with-ui-access ((ctx) &body body)
  `(push-compose-task ,ctx (lambda () ,@body)))

(defmacro with-ui ((ctx) &body body)
  `(let ((*context* ,ctx))
     ,@body))

(defun drain-compose-task-queue (ctx)
  (with-slots (compose-tasks compose-lock) ctx
    (with-ui (ctx)
      (let ((tasks (bt:with-lock-held (compose-lock)
                     (prog1 compose-tasks
                       (setf compose-tasks nil)))))
        (loop for task in tasks
              do (funcall task))))))

(defun compose-ui (ctx)
  (with-ui (ctx)
    (drain-compose-task-queue ctx)
    (let ((*style* (%style-of ctx)))
      (dolist (panel (%panels-of ctx))
        (compose panel)))))

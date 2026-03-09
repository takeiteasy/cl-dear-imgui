;; ui.lisp

(defpackage #:cl-dear-imgui/ui
  (:use #:cl #:cffi)
  (:local-nicknames (#:imgui #:cl-dear-imgui)
                    (#:v #:3d-vectors))
  (:export #:make-ui

           #:push-compose-task
           #:with-ui-access
           #:compose-ui
           #:root-panel

           #:defpanel
           #:find-element
           #:hiddenp
           #:minimizedp
           #:on-close
           #:on-minimize
           #:on-restore
           #:on-move
           #:update-panel-position
           #:panel-position
           #:with-panel-position
           #:update-panel-size
           #:with-panel-dimensions
           #:panel-size
           #:add-panel
           #:remove-panel
           #:remove-all-panels
           #:minimize-panel
           #:restore-panel

           #:adopt

           #:name-of
           #:vertical-layout
           #:horizontal-layout
           #:button
           #:label
           #:text-edit
           #:combo-box
           #:color-box
           #:spacing
           #:color-picker
           #:float-property
           #:radio
           #:activated
           #:radio-group
           #:active-radio-button-of
           #:check-box
           #:checked
           #:notebook
           #:tab

           #:styled-group

           #:scroll-area

           #:make-button
           #:make-label
           #:make-spacing
           #:make-check-box
           #:make-combo-box
           #:make-color-box
           #:make-color-picker
           #:make-float-property
           #:make-radio
           #:make-radio-group
           #:make-vertical-layout
           #:make-horizontal-layout
           #:make-notebook
           #:make-tab
           #:make-scroll-area
           #:make-styled-group
           #:make-text-edit
           #:update-area-scroll-position
           #:with-area-scroll-position
           #:area-scroll-position

           #:text-of

           #:list-select
           #:list-select-text-item
           #:item-name-of
           #:item-selected-p
           #:select-item
           #:add-item
           #:clear

           #:menu-bar

           #:hide-widget
           #:show-widget))

(in-package :cl-dear-imgui/ui)

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

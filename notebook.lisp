(in-package :cl-dear-imgui/ui)

;;;
;;; NOTEBOOK — Tab bar with ImGui tabs
;;;
(defgeneric label-of (element)
  (:method (element) (declare (ignore element)) nil))

(defclass tab (parent named)
  ((label :initform "" :initarg :label :reader label-of)))

(defun make-tab (label)
  (make-instance 'tab :label label))

(defmethod compose ((this tab))
  (dochildren (child this)
    (compose child)))

(defclass notebook (%layout)
  ((tabs :initform (make-array 0 :adjustable t :fill-pointer 0))
   (tab-bar-id :initform nil)))

(defun make-notebook ()
  (make-instance 'notebook))

(defmethod initialize-instance :after ((this notebook) &key)
  (with-slots (tab-bar-id) this
    (setf tab-bar-id (format nil "tabbar-~A" (%next-pane-id)))))

(defmethod adopt ((this notebook) tab)
  (with-slots (tabs) this
    (vector-push-extend tab tabs))
  (call-next-method))

(defmethod abandon ((this notebook) child)
  (with-slots (tabs) this
    (alexandria:deletef tabs child))
  (call-next-method))

(defmethod abandon-all ((this notebook))
  (with-slots (tabs) this
    (setf (fill-pointer tabs) 0))
  (call-next-method))

(defmethod compose ((this notebook))
  (with-slots (tabs tab-bar-id) this
    (when (imgui::begin-tab-bar tab-bar-id 0)
      (unwind-protect
           (loop for tab across tabs
                 do (when (imgui::begin-tab-item (or (label-of tab) "") (cffi:null-pointer) 0)
                      (unwind-protect
                           (compose tab)
                        (imgui::end-tab-item))))
        (imgui::end-tab-bar)))))

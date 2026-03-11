(in-package :cl-dear-imgui)

;;;
;;; LIST SELECT
;;;
(defgeneric item-status (item))
(defgeneric item-name-of (item))
(defgeneric item-selected-p (item))
(defgeneric select-item (item status))

(defclass list-select-text-item ()
  ((text :initarg :text :reader item-name-of)
   (selected :initform nil)))

(defmethod item-selected-p ((this list-select-text-item))
  (with-slots (selected) this
    selected))

(defmethod select-item ((this list-select-text-item) status)
  (with-slots (selected) this
    (setf selected (if status t nil))))

(defgeneric add-item (object item))
(defgeneric clear (object))

(defclass list-select (widget)
  ((items :initform nil)
   (item-height :initarg :item-height :initform 0)
   (label :initarg :label :initform "##listselect")))

(defun make-list-select (item-height &key name)
  (make-instance 'list-select :item-height item-height :name name))

(defmethod add-item ((this list-select) (text string))
  (with-slots (items) this
    (setf items (nconc items (list (make-instance 'list-select-text-item :text text))))))

(defmethod clear ((this list-select))
  (with-slots (items) this
    (setf items nil)))

(defmethod compose ((this list-select))
  (with-slots (items label) this
    (when (begin-list-box label
                                 (float (or (width-of this) 0.0) 0.0)
                                 (float (or (height-of this) 0.0) 0.0))
      (unwind-protect
           (dolist (item items)
             (when (selectable (item-name-of item)
                                      (item-selected-p item)
                                      0 0.0 0.0)
               ;; Deselect all others
               (dolist (other-item items)
                 (unless (eq item other-item)
                   (select-item other-item nil)))
               (select-item item t)))
        (end-list-box)))))

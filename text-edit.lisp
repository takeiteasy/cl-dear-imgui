(in-package :cl-dear-imgui)

;;;
;;; TEXT EDIT
;;;
(defparameter +text-edit-buffer-size+ 1024)

(defclass text-edit (widget)
  ((buffer :initform nil)
   (buffer-size :initform +text-edit-buffer-size+)
   (label-str :initarg :label :initform "##textedit")))

(defmethod initialize-instance :after ((this text-edit) &key text)
  (with-slots (buffer buffer-size) this
    (setf buffer (cffi:foreign-alloc :char :count buffer-size :initial-element 0))
    (when text
      (setf (text-of this) text))
    ;; Register finalizer for cleanup
    (let ((buf buffer))
      (trivial-garbage:finalize this (lambda () (cffi:foreign-free buf))))))

(defun make-text-edit (&key name text label)
  (make-instance 'text-edit :name name :text text
                 :label (or label "##textedit")))

(defmethod text-of ((this text-edit))
  (with-slots (buffer) this
    (cffi:foreign-string-to-lisp buffer :encoding :utf-8)))

(defmethod (setf text-of) ((value string) (this text-edit))
  (with-slots (buffer buffer-size) this
    ;; Clear buffer then copy string
    (dotimes (i buffer-size)
      (setf (cffi:mem-aref buffer :char i) 0))
    (let ((bytes (babel:string-to-octets value :encoding :utf-8)))
      (let ((len (min (length bytes) (1- buffer-size))))
        (dotimes (i len)
          (setf (cffi:mem-aref buffer :unsigned-char i) (aref bytes i)))))
    value))

(defmethod compose ((this text-edit))
  (with-slots (buffer buffer-size label-str) this
    (input-text-ex label-str buffer buffer-size 0
                          (cffi:null-pointer) (cffi:null-pointer))))

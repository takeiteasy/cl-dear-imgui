(in-package #:cl-dear-imgui)

;;; Simple vec2/vec4 types — no external dependency needed.

(defclass vec2 ()
  ((x :accessor vec2-x :initarg :x :initform 0.0 :type float)
   (y :accessor vec2-y :initarg :y :initform 0.0 :type float)))

(defclass vec4 ()
  ((x :accessor vec4-x :initarg :x :initform 0.0 :type float)
   (y :accessor vec4-y :initarg :y :initform 0.0 :type float)
   (z :accessor vec4-z :initarg :z :initform 0.0 :type float)
   (w :accessor vec4-w :initarg :w :initform 0.0 :type float)))

(defun make-vec2 (&optional (x 0) (y 0))
  (make-instance 'vec2 :x (float x) :y (float y)))

(defun make-vec4 (&optional (x 0) (y 0) (z 0) (w 0))
  (make-instance 'vec4 :x (float x) :y (float y) :z (float z) :w (float w)))

(defun make-color (r g b &optional (a 1.0))
  (make-instance 'vec4 :x (float r) :y (float g) :z (float b) :w (float a)))

(defun rgb (r g b)
  (make-color (/ r 255.0) (/ g 255.0) (/ b 255.0) 1.0))

(defun rgba (r g b a)
  (make-color (/ r 255.0) (/ g 255.0) (/ b 255.0) (/ a 255.0)))

(defun hex-color (hex)
  (rgb (ldb (byte 8 16) hex)
       (ldb (byte 8 8) hex)
       (ldb (byte 8 0) hex)))

(defparameter *color-white*       (make-color 1.0 1.0 1.0 1.0))
(defparameter *color-black*       (make-color 0.0 0.0 0.0 1.0))
(defparameter *color-red*         (make-color 1.0 0.0 0.0 1.0))
(defparameter *color-green*       (make-color 0.0 1.0 0.0 1.0))
(defparameter *color-blue*        (make-color 0.0 0.0 1.0 1.0))
(defparameter *color-yellow*      (make-color 1.0 1.0 0.0 1.0))
(defparameter *color-cyan*        (make-color 0.0 1.0 1.0 1.0))
(defparameter *color-magenta*     (make-color 1.0 0.0 1.0 1.0))
(defparameter *color-transparent* (make-color 0.0 0.0 0.0 0.0))

(defmethod print-object ((obj vec2) stream)
  (print-unreadable-object (obj stream :type t)
    (format stream "~,2F ~,2F" (vec2-x obj) (vec2-y obj))))

(defmethod print-object ((obj vec4) stream)
  (print-unreadable-object (obj stream :type t)
    (format stream "~,2F ~,2F ~,2F ~,2F"
            (vec4-x obj) (vec4-y obj) (vec4-z obj) (vec4-w obj))))

(export '(vec2 vec2-x vec2-y
          vec4 vec4-x vec4-y vec4-z vec4-w
          make-vec2 make-vec4 make-color
          rgb rgba hex-color
          *color-white* *color-black* *color-red* *color-green*
          *color-blue* *color-yellow* *color-cyan* *color-magenta*
          *color-transparent*))

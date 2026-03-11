(in-package :cl-dear-imgui)

(defgeneric style (style))
(defgeneric (setf style) (value style))

(declaim (special *style*))

(defclass style ()
  ((style-table :initarg :style-table :initform (make-hash-table))))

(defun make-style (&rest styles &key &allow-other-keys)
  (make-instance 'style :style-table (alexandria:plist-hash-table styles)))

(defun set-style (style name value &key (ignore-if-exists t))
  (with-slots (style-table) style
    (if ignore-if-exists
        (setf (gethash name style-table) value)
        (unless (gethash name style-table)
          (setf (gethash name style-table) value)))))

(defun get-style (style name)
  (with-slots (style-table) style
    (gethash name style-table)))

;;; ImGui style mapping tables

(defparameter *style-color-map*
  (alexandria:plist-hash-table
   (list :text-color        (cffi:foreign-enum-value 'im-col :col-text)
         :button-normal     (cffi:foreign-enum-value 'im-col :col-button)
         :button-hover      (cffi:foreign-enum-value 'im-col :col-button-hovered)
         :button-active     (cffi:foreign-enum-value 'im-col :col-button-active)
         :panel-background  (cffi:foreign-enum-value 'im-col :col-window-bg)
         :panel-border-color (cffi:foreign-enum-value 'im-col :col-border)
         :panel-header-active (cffi:foreign-enum-value 'im-col :col-title-bg-active)
         :frame-bg          (cffi:foreign-enum-value 'im-col :col-frame-bg)
         :frame-bg-hovered  (cffi:foreign-enum-value 'im-col :col-frame-bg-hovered)
         :frame-bg-active   (cffi:foreign-enum-value 'im-col :col-frame-bg-active)
         :check-mark        (cffi:foreign-enum-value 'im-col :col-check-mark)
         :slider-grab       (cffi:foreign-enum-value 'im-col :col-slider-grab)
         :header            (cffi:foreign-enum-value 'im-col :col-header)
         :header-hovered    (cffi:foreign-enum-value 'im-col :col-header-hovered)
         :header-active     (cffi:foreign-enum-value 'im-col :col-header-active))))

;; Style var map: keys that take a single float
(defparameter *style-float-var-map*
  (alexandria:plist-hash-table
   (list :panel-rounding  (cffi:foreign-enum-value 'im-style-var :style-var-window-rounding)
         :button-rounding (cffi:foreign-enum-value 'im-style-var :style-var-frame-rounding)
         :child-rounding  (cffi:foreign-enum-value 'im-style-var :style-var-child-rounding)
         :frame-rounding  (cffi:foreign-enum-value 'im-style-var :style-var-frame-rounding)
         :grab-rounding   (cffi:foreign-enum-value 'im-style-var :style-var-grab-rounding)
         :alpha           (cffi:foreign-enum-value 'im-style-var :style-var-alpha))))

;; Style var map: keys that take a vec2
(defparameter *style-vec2-var-map*
  (alexandria:plist-hash-table
   (list :panel-padding    (cffi:foreign-enum-value 'im-style-var :style-var-window-padding)
         :item-spacing     (cffi:foreign-enum-value 'im-style-var :style-var-item-spacing)
         :frame-padding    (cffi:foreign-enum-value 'im-style-var :style-var-frame-padding))))

(defun apply-style (style)
  "Push ImGui style colors and vars. Returns (color-count . var-count) for restore."
  (with-slots (style-table) style
    (let ((color-count 0)
          (var-count 0))
      (maphash (lambda (name value)
                 (cond
                   ;; Color style
                   ((gethash name *style-color-map*)
                    (let ((idx (gethash name *style-color-map*)))
                      (push-style-color idx
                                               (float (vec4-x value) 0.0)
                                               (float (vec4-y value) 0.0)
                                               (float (vec4-z value) 0.0)
                                               (float (vec4-w value) 0.0))
                      (incf color-count)))
                   ;; Float style var
                   ((gethash name *style-float-var-map*)
                    (let ((idx (gethash name *style-float-var-map*)))
                      (push-style-var idx (float value 0.0))
                      (incf var-count)))
                   ;; Vec2 style var
                   ((gethash name *style-vec2-var-map*)
                    (let ((idx (gethash name *style-vec2-var-map*)))
                      (push-style-var idx
                                             (float (vec2-x value) 0.0)
                                             (float (vec2-y value) 0.0))
                      (incf var-count)))
                   ;; cl-dear-imgui-only properties (stored but not pushed to ImGui)
                   (t nil)))
               style-table)
      (cons color-count var-count))))

(defun restore-style (counts)
  "Pop ImGui style colors and vars. COUNTS is (color-count . var-count)."
  (when (plusp (car counts))
    (pop-style-color-ex (car counts)))
  (when (plusp (cdr counts))
    (pop-style-var-ex (cdr counts))))

(defmacro with-style ((style) &body body)
  (let ((counts (gensym "COUNTS")))
    `(let ((,counts (apply-style ,style)))
       (unwind-protect
            (progn ,@body)
         (restore-style ,counts)))))

;;
;; Bodge UI internal styles (stored in *style* hash table, not pushed to ImGui)
;;
(defmethod style ((style (eql :row-height)))
  (with-slots (style-table) *style*
    (gethash style style-table)))

(defmethod (setf style) ((value number) (style (eql :row-height)))
  (with-slots (style-table) *style*
    (setf (gethash style style-table) value)))

(defmethod style ((style (eql :layout-spacing)))
  (with-slots (style-table) *style*
    (gethash style style-table)))

(defmethod (setf style) ((value number) (style (eql :layout-spacing)))
  (with-slots (style-table) *style*
    (setf (gethash style style-table) value)))

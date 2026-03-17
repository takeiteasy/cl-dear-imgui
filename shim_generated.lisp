;;;; shim.lisp
;;;; Auto-generated CFFI bindings for abi_shim_generated.cpp
;;;; DO NOT EDIT by hand — regenerate with generator.lisp

(in-package #:cl-dear-imgui)

#-ecl
(defcfun ("ImGui_BeginChildXY" begin-child) :BOOL
  (str-id :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (child-flags CHILD-FLAGS)
  (window-flags WINDOW-FLAGS)
)

#+ecl
(defun begin-child (str-id size-x size-y child-flags window-flags)
  (ffi:c-inline (str-id size-x size-y child-flags window-flags) (:CSTRING :FLOAT :FLOAT :INT :INT) :BOOL
    "ImGui_BeginChildXY(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginChildIDXY" begin-child-id) :BOOL
  (id ID)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (child-flags CHILD-FLAGS)
  (window-flags WINDOW-FLAGS)
)

#+ecl
(defun begin-child-id (id size-x size-y child-flags window-flags)
  (ffi:c-inline (id size-x size-y child-flags window-flags) (:INT :FLOAT :FLOAT :INT :INT) :BOOL
    "ImGui_BeginChildIDXY(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextWindowPosXY" set-next-window-pos) :VOID
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (cond COND)
)

#+ecl
(defun set-next-window-pos (pos-x pos-y cond)
  (ffi:c-inline (pos-x pos-y cond) (:FLOAT :FLOAT :INT) :VOID
    "ImGui_SetNextWindowPosXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextWindowPosExXY" set-next-window-pos-ex) :VOID
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (cond COND)
  (pivot-x :FLOAT)
  (pivot-y :FLOAT)
)

#+ecl
(defun set-next-window-pos-ex (pos-x pos-y cond pivot-x pivot-y)
  (ffi:c-inline (pos-x pos-y cond pivot-x pivot-y) (:FLOAT :FLOAT :INT :FLOAT :FLOAT) :VOID
    "ImGui_SetNextWindowPosExXY(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextWindowSizeXY" set-next-window-size) :VOID
  (size-x :FLOAT)
  (size-y :FLOAT)
  (cond COND)
)

#+ecl
(defun set-next-window-size (size-x size-y cond)
  (ffi:c-inline (size-x size-y cond) (:FLOAT :FLOAT :INT) :VOID
    "ImGui_SetNextWindowSizeXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextWindowSizeConstraintsXY" set-next-window-size-constraints) :VOID
  (size-min-x :FLOAT)
  (size-min-y :FLOAT)
  (size-max-x :FLOAT)
  (size-max-y :FLOAT)
  (custom-callback SIZE-CALLBACK)
  (custom-callback-data :POINTER)
)

#+ecl
(defun set-next-window-size-constraints (size-min-x size-min-y size-max-x size-max-y custom-callback custom-callback-data)
  (ffi:c-inline (size-min-x size-min-y size-max-x size-max-y custom-callback custom-callback-data) (:FLOAT :FLOAT :FLOAT :FLOAT :INT :POINTER-VOID) :VOID
    "ImGui_SetNextWindowSizeConstraintsXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextWindowContentSizeXY" set-next-window-content-size) :VOID
  (size-x :FLOAT)
  (size-y :FLOAT)
)

#+ecl
(defun set-next-window-content-size (size-x size-y)
  (ffi:c-inline (size-x size-y) (:FLOAT :FLOAT) :VOID
    "ImGui_SetNextWindowContentSizeXY(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextWindowScrollXY" set-next-window-scroll) :VOID
  (scroll-x :FLOAT)
  (scroll-y :FLOAT)
)

#+ecl
(defun set-next-window-scroll (scroll-x scroll-y)
  (ffi:c-inline (scroll-x scroll-y) (:FLOAT :FLOAT) :VOID
    "ImGui_SetNextWindowScrollXY(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetWindowPosXY" set-window-pos) :VOID
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (cond COND)
)

#+ecl
(defun set-window-pos (pos-x pos-y cond)
  (ffi:c-inline (pos-x pos-y cond) (:FLOAT :FLOAT :INT) :VOID
    "ImGui_SetWindowPosXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetWindowSizeXY" set-window-size) :VOID
  (size-x :FLOAT)
  (size-y :FLOAT)
  (cond COND)
)

#+ecl
(defun set-window-size (size-x size-y cond)
  (ffi:c-inline (size-x size-y cond) (:FLOAT :FLOAT :INT) :VOID
    "ImGui_SetWindowSizeXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetWindowPosStrXY" set-window-pos-str) :VOID
  (name :STRING)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (cond COND)
)

#+ecl
(defun set-window-pos-str (name pos-x pos-y cond)
  (ffi:c-inline (name pos-x pos-y cond) (:CSTRING :FLOAT :FLOAT :INT) :VOID
    "ImGui_SetWindowPosStrXY(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetWindowSizeStrXY" set-window-size-str) :VOID
  (name :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (cond COND)
)

#+ecl
(defun set-window-size-str (name size-x size-y cond)
  (ffi:c-inline (name size-x size-y cond) (:CSTRING :FLOAT :FLOAT :INT) :VOID
    "ImGui_SetWindowSizeStrXY(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushStyleColorImVec4XYZW" push-style-color-im-vec4) :VOID
  (idx COL)
  (col-x :FLOAT)
  (col-y :FLOAT)
  (col-z :FLOAT)
  (col-w :FLOAT)
)

#+ecl
(defun push-style-color-im-vec4 (idx col-x col-y col-z col-w)
  (ffi:c-inline (idx col-x col-y col-z col-w) (:INT :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImGui_PushStyleColorImVec4XYZW(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushStyleVarImVec2XY" push-style-var-im-vec2) :VOID
  (idx STYLE-VAR)
  (val-x :FLOAT)
  (val-y :FLOAT)
)

#+ecl
(defun push-style-var-im-vec2 (idx val-x val-y)
  (ffi:c-inline (idx val-x val-y) (:INT :FLOAT :FLOAT) :VOID
    "ImGui_PushStyleVarImVec2XY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetColorU32ImVec4XYZW" get-color-u32im-vec4) U32
  (col-x :FLOAT)
  (col-y :FLOAT)
  (col-z :FLOAT)
  (col-w :FLOAT)
)

#+ecl
(defun get-color-u32im-vec4 (col-x col-y col-z col-w)
  (ffi:c-inline (col-x col-y col-z col-w) (:FLOAT :FLOAT :FLOAT :FLOAT) :INT
    "ImGui_GetColorU32ImVec4XYZW(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetCursorScreenPosXY" set-cursor-screen-pos) :VOID
  (pos-x :FLOAT)
  (pos-y :FLOAT)
)

#+ecl
(defun set-cursor-screen-pos (pos-x pos-y)
  (ffi:c-inline (pos-x pos-y) (:FLOAT :FLOAT) :VOID
    "ImGui_SetCursorScreenPosXY(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetCursorPosXY" set-cursor-pos) :VOID
  (local-pos-x :FLOAT)
  (local-pos-y :FLOAT)
)

#+ecl
(defun set-cursor-pos (local-pos-x local-pos-y)
  (ffi:c-inline (local-pos-x local-pos-y) (:FLOAT :FLOAT) :VOID
    "ImGui_SetCursorPosXY(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DummyXY" dummy) :VOID
  (size-x :FLOAT)
  (size-y :FLOAT)
)

#+ecl
(defun dummy (size-x size-y)
  (ffi:c-inline (size-x size-y) (:FLOAT :FLOAT) :VOID
    "ImGui_DummyXY(#0, #1)"
    :one-liner t))

;; SKIPPED (varargs): ImGui_TextColored

#-ecl
(defcfun ("ImGui_TextColoredVXYZW" text-colored-v) :VOID
  (col-x :FLOAT)
  (col-y :FLOAT)
  (col-z :FLOAT)
  (col-w :FLOAT)
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun text-colored-v (col-x col-y col-z col-w fmt args)
  (ffi:c-inline (col-x col-y col-z col-w fmt args) (:FLOAT :FLOAT :FLOAT :FLOAT :CSTRING :POINTER-VOID) :VOID
    "ImGui_TextColoredVXYZW(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ButtonExXY" button-ex) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

#+ecl
(defun button-ex (label size-x size-y)
  (ffi:c-inline (label size-x size-y) (:CSTRING :FLOAT :FLOAT) :BOOL
    "ImGui_ButtonExXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InvisibleButtonXY" invisible-button) :BOOL
  (str-id :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (flags BUTTON-FLAGS)
)

#+ecl
(defun invisible-button (str-id size-x size-y flags)
  (ffi:c-inline (str-id size-x size-y flags) (:CSTRING :FLOAT :FLOAT :INT) :BOOL
    "ImGui_InvisibleButtonXY(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ProgressBarXY" progress-bar) :VOID
  (fraction :FLOAT)
  (size-arg-x :FLOAT)
  (size-arg-y :FLOAT)
  (overlay :STRING)
)

#+ecl
(defun progress-bar (fraction size-arg-x size-arg-y overlay)
  (ffi:c-inline (fraction size-arg-x size-arg-y overlay) (:FLOAT :FLOAT :FLOAT :CSTRING) :VOID
    "ImGui_ProgressBarXY(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ImageTRXY" image) :VOID
  (tex-ref :POINTER)
  (image-size-x :FLOAT)
  (image-size-y :FLOAT)
)

#+ecl
(defun image (tex-ref image-size-x image-size-y)
  (ffi:c-inline (tex-ref image-size-x image-size-y) (:POINTER-VOID :FLOAT :FLOAT) :VOID
    "ImGui_ImageTRXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ImageExTRXY" image-ex) :VOID
  (tex-ref :POINTER)
  (image-size-x :FLOAT)
  (image-size-y :FLOAT)
  (uv0-x :FLOAT)
  (uv0-y :FLOAT)
  (uv1-x :FLOAT)
  (uv1-y :FLOAT)
)

#+ecl
(defun image-ex (tex-ref image-size-x image-size-y uv0-x uv0-y uv1-x uv1-y)
  (ffi:c-inline (tex-ref image-size-x image-size-y uv0-x uv0-y uv1-x uv1-y) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImGui_ImageExTRXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ImageWithBgTRXY" image-with-bg) :VOID
  (tex-ref :POINTER)
  (image-size-x :FLOAT)
  (image-size-y :FLOAT)
)

#+ecl
(defun image-with-bg (tex-ref image-size-x image-size-y)
  (ffi:c-inline (tex-ref image-size-x image-size-y) (:POINTER-VOID :FLOAT :FLOAT) :VOID
    "ImGui_ImageWithBgTRXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ImageWithBgExTRXYXYZW" image-with-bg-ex) :VOID
  (tex-ref :POINTER)
  (image-size-x :FLOAT)
  (image-size-y :FLOAT)
  (uv0-x :FLOAT)
  (uv0-y :FLOAT)
  (uv1-x :FLOAT)
  (uv1-y :FLOAT)
  (bg-col-x :FLOAT)
  (bg-col-y :FLOAT)
  (bg-col-z :FLOAT)
  (bg-col-w :FLOAT)
  (tint-col-x :FLOAT)
  (tint-col-y :FLOAT)
  (tint-col-z :FLOAT)
  (tint-col-w :FLOAT)
)

#+ecl
(defun image-with-bg-ex (tex-ref image-size-x image-size-y uv0-x uv0-y uv1-x uv1-y bg-col-x bg-col-y bg-col-z bg-col-w tint-col-x tint-col-y tint-col-z tint-col-w)
  (ffi:c-inline (tex-ref image-size-x image-size-y uv0-x uv0-y uv1-x uv1-y bg-col-x bg-col-y bg-col-z bg-col-w tint-col-x tint-col-y tint-col-z tint-col-w) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImGui_ImageWithBgExTRXYXYZW(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11, #12, #13, #14)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ImageButtonTRXY" image-button) :BOOL
  (str-id :STRING)
  (tex-ref :POINTER)
  (image-size-x :FLOAT)
  (image-size-y :FLOAT)
)

#+ecl
(defun image-button (str-id tex-ref image-size-x image-size-y)
  (ffi:c-inline (str-id tex-ref image-size-x image-size-y) (:CSTRING :POINTER-VOID :FLOAT :FLOAT) :BOOL
    "ImGui_ImageButtonTRXY(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ImageButtonExTRXYXYZW" image-button-ex) :BOOL
  (str-id :STRING)
  (tex-ref :POINTER)
  (image-size-x :FLOAT)
  (image-size-y :FLOAT)
  (uv0-x :FLOAT)
  (uv0-y :FLOAT)
  (uv1-x :FLOAT)
  (uv1-y :FLOAT)
  (bg-col-x :FLOAT)
  (bg-col-y :FLOAT)
  (bg-col-z :FLOAT)
  (bg-col-w :FLOAT)
  (tint-col-x :FLOAT)
  (tint-col-y :FLOAT)
  (tint-col-z :FLOAT)
  (tint-col-w :FLOAT)
)

#+ecl
(defun image-button-ex (str-id tex-ref image-size-x image-size-y uv0-x uv0-y uv1-x uv1-y bg-col-x bg-col-y bg-col-z bg-col-w tint-col-x tint-col-y tint-col-z tint-col-w)
  (ffi:c-inline (str-id tex-ref image-size-x image-size-y uv0-x uv0-y uv1-x uv1-y bg-col-x bg-col-y bg-col-z bg-col-w tint-col-x tint-col-y tint-col-z tint-col-w) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT) :BOOL
    "ImGui_ImageButtonExTRXYXYZW(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11, #12, #13, #14, #15)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_VSliderFloatXY" vslider-float) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (v :POINTER)
  (v-min :FLOAT)
  (v-max :FLOAT)
)

#+ecl
(defun vslider-float (label size-x size-y v v-min v-max)
  (ffi:c-inline (label size-x size-y v v-min v-max) (:CSTRING :FLOAT :FLOAT :POINTER-VOID :FLOAT :FLOAT) :BOOL
    "ImGui_VSliderFloatXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_VSliderFloatExXY" vslider-float-ex) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (v :POINTER)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun vslider-float-ex (label size-x size-y v v-min v-max format flags)
  (ffi:c-inline (label size-x size-y v v-min v-max format flags) (:CSTRING :FLOAT :FLOAT :POINTER-VOID :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_VSliderFloatExXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_VSliderIntXY" vslider-int) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (v :POINTER)
  (v-min :INT)
  (v-max :INT)
)

#+ecl
(defun vslider-int (label size-x size-y v v-min v-max)
  (ffi:c-inline (label size-x size-y v v-min v-max) (:CSTRING :FLOAT :FLOAT :POINTER-VOID :INT :INT) :BOOL
    "ImGui_VSliderIntXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_VSliderIntExXY" vslider-int-ex) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (v :POINTER)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun vslider-int-ex (label size-x size-y v v-min v-max format flags)
  (ffi:c-inline (label size-x size-y v v-min v-max format flags) (:CSTRING :FLOAT :FLOAT :POINTER-VOID :INT :INT :CSTRING :INT) :BOOL
    "ImGui_VSliderIntExXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_VSliderScalarXY" vslider-scalar) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (p-min :POINTER)
  (p-max :POINTER)
)

#+ecl
(defun vslider-scalar (label size-x size-y data-type p-data p-min p-max)
  (ffi:c-inline (label size-x size-y data-type p-data p-min p-max) (:CSTRING :FLOAT :FLOAT :INT :POINTER-VOID :POINTER-VOID :POINTER-VOID) :BOOL
    "ImGui_VSliderScalarXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_VSliderScalarExXY" vslider-scalar-ex) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun vslider-scalar-ex (label size-x size-y data-type p-data p-min p-max format flags)
  (ffi:c-inline (label size-x size-y data-type p-data p-min p-max format flags) (:CSTRING :FLOAT :FLOAT :INT :POINTER-VOID :POINTER-VOID :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_VSliderScalarExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputTextMultilineExXY" input-text-multiline-ex) :BOOL
  (label :STRING)
  (buf :STRING)
  (buf-size :SIZE)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (flags INPUT-TEXT-FLAGS)
  (callback INPUT-TEXT-CALLBACK)
  (user-data :POINTER)
)

#+ecl
(defun input-text-multiline-ex (label buf buf-size size-x size-y flags callback user-data)
  (ffi:c-inline (label buf buf-size size-x size-y flags callback user-data) (:CSTRING :CSTRING :UNSIGNED-LONG :FLOAT :FLOAT :INT :INT :POINTER-VOID) :BOOL
    "ImGui_InputTextMultilineExXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorButtonXYZW" color-button) :BOOL
  (desc-id :STRING)
  (col-x :FLOAT)
  (col-y :FLOAT)
  (col-z :FLOAT)
  (col-w :FLOAT)
  (flags COLOR-EDIT-FLAGS)
)

#+ecl
(defun color-button (desc-id col-x col-y col-z col-w flags)
  (ffi:c-inline (desc-id col-x col-y col-z col-w flags) (:CSTRING :FLOAT :FLOAT :FLOAT :FLOAT :INT) :BOOL
    "ImGui_ColorButtonXYZW(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorButtonExXYZWXY" color-button-ex) :BOOL
  (desc-id :STRING)
  (col-x :FLOAT)
  (col-y :FLOAT)
  (col-z :FLOAT)
  (col-w :FLOAT)
  (flags COLOR-EDIT-FLAGS)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

#+ecl
(defun color-button-ex (desc-id col-x col-y col-z col-w flags size-x size-y)
  (ffi:c-inline (desc-id col-x col-y col-z col-w flags size-x size-y) (:CSTRING :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT :FLOAT) :BOOL
    "ImGui_ColorButtonExXYZWXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SelectableExXY" selectable-ex) :BOOL
  (label :STRING)
  (selected :BOOL)
  (flags SELECTABLE-FLAGS)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

#+ecl
(defun selectable-ex (label selected flags size-x size-y)
  (ffi:c-inline (label selected flags size-x size-y) (:CSTRING :BOOL :INT :FLOAT :FLOAT) :BOOL
    "ImGui_SelectableExXY(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SelectableBoolPtrExXY" selectable-bool-ptr-ex) :BOOL
  (label :STRING)
  (p-selected :POINTER)
  (flags SELECTABLE-FLAGS)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

#+ecl
(defun selectable-bool-ptr-ex (label p-selected flags size-x size-y)
  (ffi:c-inline (label p-selected flags size-x size-y) (:CSTRING :POINTER-VOID :INT :FLOAT :FLOAT) :BOOL
    "ImGui_SelectableBoolPtrExXY(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginListBoxXY" begin-list-box) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

#+ecl
(defun begin-list-box (label size-x size-y)
  (ffi:c-inline (label size-x size-y) (:CSTRING :FLOAT :FLOAT) :BOOL
    "ImGui_BeginListBoxXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PlotLinesExXY" plot-lines-ex) :VOID
  (label :STRING)
  (values :POINTER)
  (values-count :INT)
  (values-offset :INT)
  (overlay-text :STRING)
  (scale-min :FLOAT)
  (scale-max :FLOAT)
  (graph-size-x :FLOAT)
  (graph-size-y :FLOAT)
  (stride :INT)
)

#+ecl
(defun plot-lines-ex (label values values-count values-offset overlay-text scale-min scale-max graph-size-x graph-size-y stride)
  (ffi:c-inline (label values values-count values-offset overlay-text scale-min scale-max graph-size-x graph-size-y stride) (:CSTRING :POINTER-VOID :INT :INT :CSTRING :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImGui_PlotLinesExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PlotLinesCallbackExXY" plot-lines-callback-ex) :VOID
  (label :STRING)
  (values-getter :POINTER)
  (data :POINTER)
  (values-count :INT)
  (values-offset :INT)
  (overlay-text :STRING)
  (scale-min :FLOAT)
  (scale-max :FLOAT)
  (graph-size-x :FLOAT)
  (graph-size-y :FLOAT)
)

#+ecl
(defun plot-lines-callback-ex (label values-getter data values-count values-offset overlay-text scale-min scale-max graph-size-x graph-size-y)
  (ffi:c-inline (label values-getter data values-count values-offset overlay-text scale-min scale-max graph-size-x graph-size-y) (:CSTRING :POINTER-VOID :POINTER-VOID :INT :INT :CSTRING :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImGui_PlotLinesCallbackExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PlotHistogramExXY" plot-histogram-ex) :VOID
  (label :STRING)
  (values :POINTER)
  (values-count :INT)
  (values-offset :INT)
  (overlay-text :STRING)
  (scale-min :FLOAT)
  (scale-max :FLOAT)
  (graph-size-x :FLOAT)
  (graph-size-y :FLOAT)
  (stride :INT)
)

#+ecl
(defun plot-histogram-ex (label values values-count values-offset overlay-text scale-min scale-max graph-size-x graph-size-y stride)
  (ffi:c-inline (label values values-count values-offset overlay-text scale-min scale-max graph-size-x graph-size-y stride) (:CSTRING :POINTER-VOID :INT :INT :CSTRING :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImGui_PlotHistogramExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PlotHistogramCallbackExXY" plot-histogram-callback-ex) :VOID
  (label :STRING)
  (values-getter :POINTER)
  (data :POINTER)
  (values-count :INT)
  (values-offset :INT)
  (overlay-text :STRING)
  (scale-min :FLOAT)
  (scale-max :FLOAT)
  (graph-size-x :FLOAT)
  (graph-size-y :FLOAT)
)

#+ecl
(defun plot-histogram-callback-ex (label values-getter data values-count values-offset overlay-text scale-min scale-max graph-size-x graph-size-y)
  (ffi:c-inline (label values-getter data values-count values-offset overlay-text scale-min scale-max graph-size-x graph-size-y) (:CSTRING :POINTER-VOID :POINTER-VOID :INT :INT :CSTRING :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImGui_PlotHistogramCallbackExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginTableExXY" begin-table-ex) :BOOL
  (str-id :STRING)
  (columns :INT)
  (flags TABLE-FLAGS)
  (outer-size-x :FLOAT)
  (outer-size-y :FLOAT)
  (inner-width :FLOAT)
)

#+ecl
(defun begin-table-ex (str-id columns flags outer-size-x outer-size-y inner-width)
  (ffi:c-inline (str-id columns flags outer-size-x outer-size-y inner-width) (:CSTRING :INT :INT :FLOAT :FLOAT :FLOAT) :BOOL
    "ImGui_BeginTableExXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushClipRectXY" push-clip-rect) :VOID
  (clip-rect-min-x :FLOAT)
  (clip-rect-min-y :FLOAT)
  (clip-rect-max-x :FLOAT)
  (clip-rect-max-y :FLOAT)
  (intersect-with-current-clip-rect :BOOL)
)

#+ecl
(defun push-clip-rect (clip-rect-min-x clip-rect-min-y clip-rect-max-x clip-rect-max-y intersect-with-current-clip-rect)
  (ffi:c-inline (clip-rect-min-x clip-rect-min-y clip-rect-max-x clip-rect-max-y intersect-with-current-clip-rect) (:FLOAT :FLOAT :FLOAT :FLOAT :BOOL) :VOID
    "ImGui_PushClipRectXY(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsRectVisibleBySizeXY" is-rect-visible-by-size) :BOOL
  (size-x :FLOAT)
  (size-y :FLOAT)
)

#+ecl
(defun is-rect-visible-by-size (size-x size-y)
  (ffi:c-inline (size-x size-y) (:FLOAT :FLOAT) :BOOL
    "ImGui_IsRectVisibleBySizeXY(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsRectVisibleXY" is-rect-visible) :BOOL
  (rect-min-x :FLOAT)
  (rect-min-y :FLOAT)
  (rect-max-x :FLOAT)
  (rect-max-y :FLOAT)
)

#+ecl
(defun is-rect-visible (rect-min-x rect-min-y rect-max-x rect-max-y)
  (ffi:c-inline (rect-min-x rect-min-y rect-max-x rect-max-y) (:FLOAT :FLOAT :FLOAT :FLOAT) :BOOL
    "ImGui_IsRectVisibleXY(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorConvertFloat4ToU32XYZW" color-convert-float4to-u32) U32
  (in-x :FLOAT)
  (in-y :FLOAT)
  (in-z :FLOAT)
  (in-w :FLOAT)
)

#+ecl
(defun color-convert-float4to-u32 (in-x in-y in-z in-w)
  (ffi:c-inline (in-x in-y in-z in-w) (:FLOAT :FLOAT :FLOAT :FLOAT) :INT
    "ImGui_ColorConvertFloat4ToU32XYZW(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMouseHoveringRectXY" is-mouse-hovering-rect) :BOOL
  (r-min-x :FLOAT)
  (r-min-y :FLOAT)
  (r-max-x :FLOAT)
  (r-max-y :FLOAT)
)

#+ecl
(defun is-mouse-hovering-rect (r-min-x r-min-y r-max-x r-max-y)
  (ffi:c-inline (r-min-x r-min-y r-max-x r-max-y) (:FLOAT :FLOAT :FLOAT :FLOAT) :BOOL
    "ImGui_IsMouseHoveringRectXY(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMouseHoveringRectExXY" is-mouse-hovering-rect-ex) :BOOL
  (r-min-x :FLOAT)
  (r-min-y :FLOAT)
  (r-max-x :FLOAT)
  (r-max-y :FLOAT)
  (clip :BOOL)
)

#+ecl
(defun is-mouse-hovering-rect-ex (r-min-x r-min-y r-max-x r-max-y clip)
  (ffi:c-inline (r-min-x r-min-y r-max-x r-max-y clip) (:FLOAT :FLOAT :FLOAT :FLOAT :BOOL) :BOOL
    "ImGui_IsMouseHoveringRectExXY(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PushClipRectXY" draw-list-push-clip-rect) :VOID
  (self :POINTER)
  (clip-rect-min-x :FLOAT)
  (clip-rect-min-y :FLOAT)
  (clip-rect-max-x :FLOAT)
  (clip-rect-max-y :FLOAT)
  (intersect-with-current-clip-rect :BOOL)
)

#+ecl
(defun draw-list-push-clip-rect (self clip-rect-min-x clip-rect-min-y clip-rect-max-x clip-rect-max-y intersect-with-current-clip-rect)
  (ffi:c-inline (self clip-rect-min-x clip-rect-min-y clip-rect-max-x clip-rect-max-y intersect-with-current-clip-rect) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :BOOL) :VOID
    "ImDrawList_PushClipRectXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PushTextureTR" draw-list-push-texture) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
)

#+ecl
(defun draw-list-push-texture (self tex-ref)
  (ffi:c-inline (self tex-ref) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImDrawList_PushTextureTR(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddLineXY" draw-list-add-line) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-line (self p1-x p1-y p2-x p2-y col)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddLineXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddLineExXY" draw-list-add-line-ex) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (col U32)
  (thickness :FLOAT)
)

#+ecl
(defun draw-list-add-line-ex (self p1-x p1-y p2-x p2-y col thickness)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y col thickness) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT) :VOID
    "ImDrawList_AddLineExXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddRectXY" draw-list-add-rect) :VOID
  (self :POINTER)
  (p-min-x :FLOAT)
  (p-min-y :FLOAT)
  (p-max-x :FLOAT)
  (p-max-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-rect (self p-min-x p-min-y p-max-x p-max-y col)
  (ffi:c-inline (self p-min-x p-min-y p-max-x p-max-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddRectXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddRectExXY" draw-list-add-rect-ex) :VOID
  (self :POINTER)
  (p-min-x :FLOAT)
  (p-min-y :FLOAT)
  (p-max-x :FLOAT)
  (p-max-y :FLOAT)
  (col U32)
  (rounding :FLOAT)
  (flags DRAW-FLAGS)
  (thickness :FLOAT)
)

#+ecl
(defun draw-list-add-rect-ex (self p-min-x p-min-y p-max-x p-max-y col rounding flags thickness)
  (ffi:c-inline (self p-min-x p-min-y p-max-x p-max-y col rounding flags thickness) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT :INT :FLOAT) :VOID
    "ImDrawList_AddRectExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddRectFilledXY" draw-list-add-rect-filled) :VOID
  (self :POINTER)
  (p-min-x :FLOAT)
  (p-min-y :FLOAT)
  (p-max-x :FLOAT)
  (p-max-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-rect-filled (self p-min-x p-min-y p-max-x p-max-y col)
  (ffi:c-inline (self p-min-x p-min-y p-max-x p-max-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddRectFilledXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddRectFilledExXY" draw-list-add-rect-filled-ex) :VOID
  (self :POINTER)
  (p-min-x :FLOAT)
  (p-min-y :FLOAT)
  (p-max-x :FLOAT)
  (p-max-y :FLOAT)
  (col U32)
  (rounding :FLOAT)
  (flags DRAW-FLAGS)
)

#+ecl
(defun draw-list-add-rect-filled-ex (self p-min-x p-min-y p-max-x p-max-y col rounding flags)
  (ffi:c-inline (self p-min-x p-min-y p-max-x p-max-y col rounding flags) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT :INT) :VOID
    "ImDrawList_AddRectFilledExXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddRectFilledMultiColorXY" draw-list-add-rect-filled-multi-color) :VOID
  (self :POINTER)
  (p-min-x :FLOAT)
  (p-min-y :FLOAT)
  (p-max-x :FLOAT)
  (p-max-y :FLOAT)
  (col-upr-left U32)
  (col-upr-right U32)
  (col-bot-right U32)
  (col-bot-left U32)
)

#+ecl
(defun draw-list-add-rect-filled-multi-color (self p-min-x p-min-y p-max-x p-max-y col-upr-left col-upr-right col-bot-right col-bot-left)
  (ffi:c-inline (self p-min-x p-min-y p-max-x p-max-y col-upr-left col-upr-right col-bot-right col-bot-left) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT :INT :INT :INT) :VOID
    "ImDrawList_AddRectFilledMultiColorXY(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddQuadXY" draw-list-add-quad) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (p4-x :FLOAT)
  (p4-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-quad (self p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y col)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddQuadXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddQuadExXY" draw-list-add-quad-ex) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (p4-x :FLOAT)
  (p4-y :FLOAT)
  (col U32)
  (thickness :FLOAT)
)

#+ecl
(defun draw-list-add-quad-ex (self p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y col thickness)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y col thickness) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT) :VOID
    "ImDrawList_AddQuadExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddQuadFilledXY" draw-list-add-quad-filled) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (p4-x :FLOAT)
  (p4-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-quad-filled (self p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y col)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddQuadFilledXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddTriangleXY" draw-list-add-triangle) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-triangle (self p1-x p1-y p2-x p2-y p3-x p3-y col)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y p3-x p3-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddTriangleXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddTriangleExXY" draw-list-add-triangle-ex) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (col U32)
  (thickness :FLOAT)
)

#+ecl
(defun draw-list-add-triangle-ex (self p1-x p1-y p2-x p2-y p3-x p3-y col thickness)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y p3-x p3-y col thickness) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT) :VOID
    "ImDrawList_AddTriangleExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddTriangleFilledXY" draw-list-add-triangle-filled) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-triangle-filled (self p1-x p1-y p2-x p2-y p3-x p3-y col)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y p3-x p3-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddTriangleFilledXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddCircleXY" draw-list-add-circle) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-circle (self center-x center-y radius col)
  (ffi:c-inline (self center-x center-y radius col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddCircleXY(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddCircleExXY" draw-list-add-circle-ex) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
  (thickness :FLOAT)
)

#+ecl
(defun draw-list-add-circle-ex (self center-x center-y radius col num-segments thickness)
  (ffi:c-inline (self center-x center-y radius col num-segments thickness) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :INT :FLOAT) :VOID
    "ImDrawList_AddCircleExXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddCircleFilledXY" draw-list-add-circle-filled) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
)

#+ecl
(defun draw-list-add-circle-filled (self center-x center-y radius col num-segments)
  (ffi:c-inline (self center-x center-y radius col num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :INT) :VOID
    "ImDrawList_AddCircleFilledXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddNgonXY" draw-list-add-ngon) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
)

#+ecl
(defun draw-list-add-ngon (self center-x center-y radius col num-segments)
  (ffi:c-inline (self center-x center-y radius col num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :INT) :VOID
    "ImDrawList_AddNgonXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddNgonExXY" draw-list-add-ngon-ex) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
  (thickness :FLOAT)
)

#+ecl
(defun draw-list-add-ngon-ex (self center-x center-y radius col num-segments thickness)
  (ffi:c-inline (self center-x center-y radius col num-segments thickness) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :INT :FLOAT) :VOID
    "ImDrawList_AddNgonExXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddNgonFilledXY" draw-list-add-ngon-filled) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
)

#+ecl
(defun draw-list-add-ngon-filled (self center-x center-y radius col num-segments)
  (ffi:c-inline (self center-x center-y radius col num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :INT) :VOID
    "ImDrawList_AddNgonFilledXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddEllipseXY" draw-list-add-ellipse) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius-x :FLOAT)
  (radius-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-ellipse (self center-x center-y radius-x radius-y col)
  (ffi:c-inline (self center-x center-y radius-x radius-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddEllipseXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddEllipseExXY" draw-list-add-ellipse-ex) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius-x :FLOAT)
  (radius-y :FLOAT)
  (col U32)
  (rot :FLOAT)
  (num-segments :INT)
  (thickness :FLOAT)
)

#+ecl
(defun draw-list-add-ellipse-ex (self center-x center-y radius-x radius-y col rot num-segments thickness)
  (ffi:c-inline (self center-x center-y radius-x radius-y col rot num-segments thickness) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT :INT :FLOAT) :VOID
    "ImDrawList_AddEllipseExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddEllipseFilledXY" draw-list-add-ellipse-filled) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius-x :FLOAT)
  (radius-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-ellipse-filled (self center-x center-y radius-x radius-y col)
  (ffi:c-inline (self center-x center-y radius-x radius-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddEllipseFilledXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddEllipseFilledExXY" draw-list-add-ellipse-filled-ex) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius-x :FLOAT)
  (radius-y :FLOAT)
  (col U32)
  (rot :FLOAT)
  (num-segments :INT)
)

#+ecl
(defun draw-list-add-ellipse-filled-ex (self center-x center-y radius-x radius-y col rot num-segments)
  (ffi:c-inline (self center-x center-y radius-x radius-y col rot num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT :INT) :VOID
    "ImDrawList_AddEllipseFilledExXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddTextXY" draw-list-add-text) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (col U32)
  (text-begin :STRING)
)

#+ecl
(defun draw-list-add-text (self pos-x pos-y col text-begin)
  (ffi:c-inline (self pos-x pos-y col text-begin) (:POINTER-VOID :FLOAT :FLOAT :INT :CSTRING) :VOID
    "ImDrawList_AddTextXY(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddTextExXY" draw-list-add-text-ex) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (col U32)
  (text-begin :STRING)
  (text-end :STRING)
)

#+ecl
(defun draw-list-add-text-ex (self pos-x pos-y col text-begin text-end)
  (ffi:c-inline (self pos-x pos-y col text-begin text-end) (:POINTER-VOID :FLOAT :FLOAT :INT :CSTRING :CSTRING) :VOID
    "ImDrawList_AddTextExXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddTextImFontPtrXY" draw-list-add-text-im-font-ptr) :VOID
  (self :POINTER)
  (font :POINTER)
  (font-size :FLOAT)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (col U32)
  (text-begin :STRING)
)

#+ecl
(defun draw-list-add-text-im-font-ptr (self font font-size pos-x pos-y col text-begin)
  (ffi:c-inline (self font font-size pos-x pos-y col text-begin) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :CSTRING) :VOID
    "ImDrawList_AddTextImFontPtrXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddTextImFontPtrExXY" draw-list-add-text-im-font-ptr-ex) :VOID
  (self :POINTER)
  (font :POINTER)
  (font-size :FLOAT)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (col U32)
  (text-begin :STRING)
  (text-end :STRING)
  (wrap-width :FLOAT)
  (cpu-fine-clip-rect :POINTER)
)

#+ecl
(defun draw-list-add-text-im-font-ptr-ex (self font font-size pos-x pos-y col text-begin text-end wrap-width cpu-fine-clip-rect)
  (ffi:c-inline (self font font-size pos-x pos-y col text-begin text-end wrap-width cpu-fine-clip-rect) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :CSTRING :CSTRING :FLOAT :POINTER-VOID) :VOID
    "ImDrawList_AddTextImFontPtrExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddBezierCubicXY" draw-list-add-bezier-cubic) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (p4-x :FLOAT)
  (p4-y :FLOAT)
  (col U32)
  (thickness :FLOAT)
  (num-segments :INT)
)

#+ecl
(defun draw-list-add-bezier-cubic (self p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y col thickness num-segments)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y col thickness num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT :INT) :VOID
    "ImDrawList_AddBezierCubicXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddBezierQuadraticXY" draw-list-add-bezier-quadratic) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (col U32)
  (thickness :FLOAT)
  (num-segments :INT)
)

#+ecl
(defun draw-list-add-bezier-quadratic (self p1-x p1-y p2-x p2-y p3-x p3-y col thickness num-segments)
  (ffi:c-inline (self p1-x p1-y p2-x p2-y p3-x p3-y col thickness num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT :INT) :VOID
    "ImDrawList_AddBezierQuadraticXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddImageTRXY" draw-list-add-image) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
  (p-min-x :FLOAT)
  (p-min-y :FLOAT)
  (p-max-x :FLOAT)
  (p-max-y :FLOAT)
)

#+ecl
(defun draw-list-add-image (self tex-ref p-min-x p-min-y p-max-x p-max-y)
  (ffi:c-inline (self tex-ref p-min-x p-min-y p-max-x p-max-y) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImDrawList_AddImageTRXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddImageExTRXY" draw-list-add-image-ex) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
  (p-min-x :FLOAT)
  (p-min-y :FLOAT)
  (p-max-x :FLOAT)
  (p-max-y :FLOAT)
  (uv-min-x :FLOAT)
  (uv-min-y :FLOAT)
  (uv-max-x :FLOAT)
  (uv-max-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-image-ex (self tex-ref p-min-x p-min-y p-max-x p-max-y uv-min-x uv-min-y uv-max-x uv-max-y col)
  (ffi:c-inline (self tex-ref p-min-x p-min-y p-max-x p-max-y uv-min-x uv-min-y uv-max-x uv-max-y col) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddImageExTRXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddImageQuadTRXY" draw-list-add-image-quad) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (p4-x :FLOAT)
  (p4-y :FLOAT)
)

#+ecl
(defun draw-list-add-image-quad (self tex-ref p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y)
  (ffi:c-inline (self tex-ref p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImDrawList_AddImageQuadTRXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddImageQuadExTRXY" draw-list-add-image-quad-ex) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (p4-x :FLOAT)
  (p4-y :FLOAT)
  (uv1-x :FLOAT)
  (uv1-y :FLOAT)
  (uv2-x :FLOAT)
  (uv2-y :FLOAT)
  (uv3-x :FLOAT)
  (uv3-y :FLOAT)
  (uv4-x :FLOAT)
  (uv4-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-add-image-quad-ex (self tex-ref p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y uv1-x uv1-y uv2-x uv2-y uv3-x uv3-y uv4-x uv4-y col)
  (ffi:c-inline (self tex-ref p1-x p1-y p2-x p2-y p3-x p3-y p4-x p4-y uv1-x uv1-y uv2-x uv2-y uv3-x uv3-y uv4-x uv4-y col) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_AddImageQuadExTRXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11, #12, #13, #14, #15, #16, #17, #18)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddImageRoundedTRXY" draw-list-add-image-rounded) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
  (p-min-x :FLOAT)
  (p-min-y :FLOAT)
  (p-max-x :FLOAT)
  (p-max-y :FLOAT)
  (uv-min-x :FLOAT)
  (uv-min-y :FLOAT)
  (uv-max-x :FLOAT)
  (uv-max-y :FLOAT)
  (col U32)
  (rounding :FLOAT)
  (flags DRAW-FLAGS)
)

#+ecl
(defun draw-list-add-image-rounded (self tex-ref p-min-x p-min-y p-max-x p-max-y uv-min-x uv-min-y uv-max-x uv-max-y col rounding flags)
  (ffi:c-inline (self tex-ref p-min-x p-min-y p-max-x p-max-y uv-min-x uv-min-y uv-max-x uv-max-y col rounding flags) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT :FLOAT :INT) :VOID
    "ImDrawList_AddImageRoundedTRXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11, #12)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathLineToXY" draw-list-path-line-to) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
)

#+ecl
(defun draw-list-path-line-to (self pos-x pos-y)
  (ffi:c-inline (self pos-x pos-y) (:POINTER-VOID :FLOAT :FLOAT) :VOID
    "ImDrawList_PathLineToXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathLineToMergeDuplicateXY" draw-list-path-line-to-merge-duplicate) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
)

#+ecl
(defun draw-list-path-line-to-merge-duplicate (self pos-x pos-y)
  (ffi:c-inline (self pos-x pos-y) (:POINTER-VOID :FLOAT :FLOAT) :VOID
    "ImDrawList_PathLineToMergeDuplicateXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathArcToXY" draw-list-path-arc-to) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (a-min :FLOAT)
  (a-max :FLOAT)
  (num-segments :INT)
)

#+ecl
(defun draw-list-path-arc-to (self center-x center-y radius a-min a-max num-segments)
  (ffi:c-inline (self center-x center-y radius a-min a-max num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PathArcToXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathArcToFastXY" draw-list-path-arc-to-fast) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (a-min-of-12 :INT)
  (a-max-of-12 :INT)
)

#+ecl
(defun draw-list-path-arc-to-fast (self center-x center-y radius a-min-of-12 a-max-of-12)
  (ffi:c-inline (self center-x center-y radius a-min-of-12 a-max-of-12) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :INT) :VOID
    "ImDrawList_PathArcToFastXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathEllipticalArcToXY" draw-list-path-elliptical-arc-to) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius-x :FLOAT)
  (radius-y :FLOAT)
  (rot :FLOAT)
  (a-min :FLOAT)
  (a-max :FLOAT)
)

#+ecl
(defun draw-list-path-elliptical-arc-to (self center-x center-y radius-x radius-y rot a-min a-max)
  (ffi:c-inline (self center-x center-y radius-x radius-y rot a-min a-max) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImDrawList_PathEllipticalArcToXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathEllipticalArcToExXY" draw-list-path-elliptical-arc-to-ex) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius-x :FLOAT)
  (radius-y :FLOAT)
  (rot :FLOAT)
  (a-min :FLOAT)
  (a-max :FLOAT)
  (num-segments :INT)
)

#+ecl
(defun draw-list-path-elliptical-arc-to-ex (self center-x center-y radius-x radius-y rot a-min a-max num-segments)
  (ffi:c-inline (self center-x center-y radius-x radius-y rot a-min a-max num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PathEllipticalArcToExXY(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathBezierCubicCurveToXY" draw-list-path-bezier-cubic-curve-to) :VOID
  (self :POINTER)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (p4-x :FLOAT)
  (p4-y :FLOAT)
  (num-segments :INT)
)

#+ecl
(defun draw-list-path-bezier-cubic-curve-to (self p2-x p2-y p3-x p3-y p4-x p4-y num-segments)
  (ffi:c-inline (self p2-x p2-y p3-x p3-y p4-x p4-y num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PathBezierCubicCurveToXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathBezierQuadraticCurveToXY" draw-list-path-bezier-quadratic-curve-to) :VOID
  (self :POINTER)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (num-segments :INT)
)

#+ecl
(defun draw-list-path-bezier-quadratic-curve-to (self p2-x p2-y p3-x p3-y num-segments)
  (ffi:c-inline (self p2-x p2-y p3-x p3-y num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PathBezierQuadraticCurveToXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathRectXY" draw-list-path-rect) :VOID
  (self :POINTER)
  (rect-min-x :FLOAT)
  (rect-min-y :FLOAT)
  (rect-max-x :FLOAT)
  (rect-max-y :FLOAT)
  (rounding :FLOAT)
  (flags DRAW-FLAGS)
)

#+ecl
(defun draw-list-path-rect (self rect-min-x rect-min-y rect-max-x rect-max-y rounding flags)
  (ffi:c-inline (self rect-min-x rect-min-y rect-max-x rect-max-y rounding flags) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PathRectXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PrimRectXY" draw-list-prim-rect) :VOID
  (self :POINTER)
  (a-x :FLOAT)
  (a-y :FLOAT)
  (b-x :FLOAT)
  (b-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-prim-rect (self a-x a-y b-x b-y col)
  (ffi:c-inline (self a-x a-y b-x b-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PrimRectXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PrimRectUVXY" draw-list-prim-rect-uv) :VOID
  (self :POINTER)
  (a-x :FLOAT)
  (a-y :FLOAT)
  (b-x :FLOAT)
  (b-y :FLOAT)
  (uv-a-x :FLOAT)
  (uv-a-y :FLOAT)
  (uv-b-x :FLOAT)
  (uv-b-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-prim-rect-uv (self a-x a-y b-x b-y uv-a-x uv-a-y uv-b-x uv-b-y col)
  (ffi:c-inline (self a-x a-y b-x b-y uv-a-x uv-a-y uv-b-x uv-b-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PrimRectUVXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PrimQuadUVXY" draw-list-prim-quad-uv) :VOID
  (self :POINTER)
  (a-x :FLOAT)
  (a-y :FLOAT)
  (b-x :FLOAT)
  (b-y :FLOAT)
  (c-x :FLOAT)
  (c-y :FLOAT)
  (d-x :FLOAT)
  (d-y :FLOAT)
  (uv-a-x :FLOAT)
  (uv-a-y :FLOAT)
  (uv-b-x :FLOAT)
  (uv-b-y :FLOAT)
  (uv-c-x :FLOAT)
  (uv-c-y :FLOAT)
  (uv-d-x :FLOAT)
  (uv-d-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-prim-quad-uv (self a-x a-y b-x b-y c-x c-y d-x d-y uv-a-x uv-a-y uv-b-x uv-b-y uv-c-x uv-c-y uv-d-x uv-d-y col)
  (ffi:c-inline (self a-x a-y b-x b-y c-x c-y d-x d-y uv-a-x uv-a-y uv-b-x uv-b-y uv-c-x uv-c-y uv-d-x uv-d-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PrimQuadUVXY(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11, #12, #13, #14, #15, #16, #17)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PrimWriteVtxXY" draw-list-prim-write-vtx) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (uv-x :FLOAT)
  (uv-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-prim-write-vtx (self pos-x pos-y uv-x uv-y col)
  (ffi:c-inline (self pos-x pos-y uv-x uv-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PrimWriteVtxXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PrimVtxXY" draw-list-prim-vtx) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (uv-x :FLOAT)
  (uv-y :FLOAT)
  (col U32)
)

#+ecl
(defun draw-list-prim-vtx (self pos-x pos-y uv-x uv-y col)
  (ffi:c-inline (self pos-x pos-y uv-x uv-y col) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList_PrimVtxXY(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PushTextureIDTR" draw-list-push-texture-id) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
)

#+ecl
(defun draw-list-push-texture-id (self tex-ref)
  (ffi:c-inline (self tex-ref) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImDrawList_PushTextureIDTR(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__SetTextureTR" draw-list--set-texture) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
)

#+ecl
(defun draw-list--set-texture (self tex-ref)
  (ffi:c-inline (self tex-ref) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImDrawList__SetTextureTR(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__PathArcToFastExXY" draw-list--path-arc-to-fast-ex) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (a-min-sample :INT)
  (a-max-sample :INT)
  (a-step :INT)
)

#+ecl
(defun draw-list--path-arc-to-fast-ex (self center-x center-y radius a-min-sample a-max-sample a-step)
  (ffi:c-inline (self center-x center-y radius a-min-sample a-max-sample a-step) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :INT :INT) :VOID
    "ImDrawList__PathArcToFastExXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__PathArcToNXY" draw-list--path-arc-to-n) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (a-min :FLOAT)
  (a-max :FLOAT)
  (num-segments :INT)
)

#+ecl
(defun draw-list--path-arc-to-n (self center-x center-y radius a-min a-max num-segments)
  (ffi:c-inline (self center-x center-y radius a-min a-max num-segments) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :INT) :VOID
    "ImDrawList__PathArcToNXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawData_ScaleClipRectsXY" draw-data-scale-clip-rects) :VOID
  (self :POINTER)
  (fb-scale-x :FLOAT)
  (fb-scale-y :FLOAT)
)

#+ecl
(defun draw-data-scale-clip-rects (self fb-scale-x fb-scale-y)
  (ffi:c-inline (self fb-scale-x fb-scale-y) (:POINTER-VOID :FLOAT :FLOAT) :VOID
    "ImDrawData_ScaleClipRectsXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_SetTexIDImTextureRefTR" font-atlas-set-tex-idim-texture-ref) :VOID
  (self :POINTER)
  (id :POINTER)
)

#+ecl
(defun font-atlas-set-tex-idim-texture-ref (self id)
  (ffi:c-inline (self id) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImFontAtlas_SetTexIDImTextureRefTR(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddCustomRectFontGlyphXY" font-atlas-add-custom-rect-font-glyph) FONT-ATLAS-RECT-ID
  (self :POINTER)
  (font :POINTER)
  (codepoint WCHAR)
  (w :INT)
  (h :INT)
  (advance-x :FLOAT)
  (offset-x :FLOAT)
  (offset-y :FLOAT)
)

#+ecl
(defun font-atlas-add-custom-rect-font-glyph (self font codepoint w h advance-x offset-x offset-y)
  (ffi:c-inline (self font codepoint w h advance-x offset-x offset-y) (:POINTER-VOID :POINTER-VOID :INT :INT :INT :FLOAT :FLOAT :FLOAT) :INT
    "ImFontAtlas_AddCustomRectFontGlyphXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddCustomRectFontGlyphForSizeXY" font-atlas-add-custom-rect-font-glyph-for-size) FONT-ATLAS-RECT-ID
  (self :POINTER)
  (font :POINTER)
  (font-size :FLOAT)
  (codepoint WCHAR)
  (w :INT)
  (h :INT)
  (advance-x :FLOAT)
  (offset-x :FLOAT)
  (offset-y :FLOAT)
)

#+ecl
(defun font-atlas-add-custom-rect-font-glyph-for-size (self font font-size codepoint w h advance-x offset-x offset-y)
  (ffi:c-inline (self font font-size codepoint w h advance-x offset-x offset-y) (:POINTER-VOID :POINTER-VOID :FLOAT :INT :INT :INT :FLOAT :FLOAT :FLOAT) :INT
    "ImFontAtlas_AddCustomRectFontGlyphForSizeXY(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_RenderCharXY" font-render-char) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (size :FLOAT)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (col U32)
  (c WCHAR)
)

#+ecl
(defun font-render-char (self draw-list size pos-x pos-y col c)
  (ffi:c-inline (self draw-list size pos-x pos-y col c) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :INT) :VOID
    "ImFont_RenderCharXY(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_RenderCharExXY" font-render-char-ex) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (size :FLOAT)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (col U32)
  (c WCHAR)
  (cpu-fine-clip :POINTER)
)

#+ecl
(defun font-render-char-ex (self draw-list size pos-x pos-y col c cpu-fine-clip)
  (ffi:c-inline (self draw-list size pos-x pos-y col c cpu-fine-clip) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :INT :POINTER-VOID) :VOID
    "ImFont_RenderCharExXY(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_RenderTextXYXYZW" font-render-text) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (size :FLOAT)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (col U32)
  (clip-rect-x :FLOAT)
  (clip-rect-y :FLOAT)
  (clip-rect-z :FLOAT)
  (clip-rect-w :FLOAT)
  (text-begin :STRING)
  (text-end :STRING)
  (wrap-width :FLOAT)
  (flags DRAW-TEXT-FLAGS)
)

#+ecl
(defun font-render-text (self draw-list size pos-x pos-y col clip-rect-x clip-rect-y clip-rect-z clip-rect-w text-begin text-end wrap-width flags)
  (ffi:c-inline (self draw-list size pos-x pos-y col clip-rect-x clip-rect-y clip-rect-z clip-rect-w text-begin text-end wrap-width flags) (:POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :INT :FLOAT :FLOAT :FLOAT :FLOAT :CSTRING :CSTRING :FLOAT :INT) :VOID
    "ImFont_RenderTextXYXYZW(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11, #12, #13)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ImageImVec4TRXYXYZW" image-im-vec4) :VOID
  (tex-ref :POINTER)
  (image-size-x :FLOAT)
  (image-size-y :FLOAT)
  (uv0-x :FLOAT)
  (uv0-y :FLOAT)
  (uv1-x :FLOAT)
  (uv1-y :FLOAT)
  (tint-col-x :FLOAT)
  (tint-col-y :FLOAT)
  (tint-col-z :FLOAT)
  (tint-col-w :FLOAT)
  (border-col-x :FLOAT)
  (border-col-y :FLOAT)
  (border-col-z :FLOAT)
  (border-col-w :FLOAT)
)

#+ecl
(defun image-im-vec4 (tex-ref image-size-x image-size-y uv0-x uv0-y uv1-x uv1-y tint-col-x tint-col-y tint-col-z tint-col-w border-col-x border-col-y border-col-z border-col-w)
  (ffi:c-inline (tex-ref image-size-x image-size-y uv0-x uv0-y uv1-x uv1-y tint-col-x tint-col-y tint-col-z tint-col-w border-col-x border-col-y border-col-z border-col-w) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImGui_ImageImVec4TRXYXYZW(#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11, #12, #13, #14)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginChildFrameXY" begin-child-frame) :BOOL
  (id ID)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

#+ecl
(defun begin-child-frame (id size-x size-y)
  (ffi:c-inline (id size-x size-y) (:INT :FLOAT :FLOAT) :BOOL
    "ImGui_BeginChildFrameXY(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginChildFrameExXY" begin-child-frame-ex) :BOOL
  (id ID)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (window-flags WINDOW-FLAGS)
)

#+ecl
(defun begin-child-frame-ex (id size-x size-y window-flags)
  (ffi:c-inline (id size-x size-y window-flags) (:INT :FLOAT :FLOAT :INT) :BOOL
    "ImGui_BeginChildFrameExXY(#0, #1, #2, #3)"
    :one-liner t))


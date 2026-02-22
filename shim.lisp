;;; shims.lisp

;; ARM64 ABI shims: float pairs instead of ImVec2/ImVec4 struct-by-value.
;; Needed because CFFI on SBCL/ARM64 cannot correctly pass HFA structs.

(in-package #:cl-dear-imgui)

(defcfun ("ImGui_SetNextWindowPosXY" set-next-window-pos-xy) :VOID
  (x :FLOAT) (y :FLOAT)
  (cond :INT)
  (px :FLOAT) (py :FLOAT))

(defcfun ("ImGui_SetNextWindowSizeXY" set-next-window-size-xy) :VOID
  (w :FLOAT) (h :FLOAT)
  (cond :INT))

(defcfun ("ImGui_BeginChildXY" begin-child-xy) :BOOL
  (str-id :STRING)
  (w :FLOAT) (h :FLOAT)
  (child-flags :INT)
  (window-flags :INT))

(defcfun ("ImGui_ButtonXY" button-xy) :BOOL
  (label :STRING)
  (w :FLOAT) (h :FLOAT))

(defcfun ("ImGui_BeginListBoxXY" begin-list-box-xy) :BOOL
  (label :STRING)
  (w :FLOAT) (h :FLOAT))

(defcfun ("ImGui_SelectableXY" selectable-xy) :BOOL
  (label :STRING)
  (selected :BOOL)
  (flags :INT)
  (w :FLOAT) (h :FLOAT))

(defcfun ("ImGui_ColorButtonXY" color-button-xy) :BOOL
  (desc-id :STRING)
  (r :FLOAT) (g :FLOAT) (b :FLOAT) (a :FLOAT)
  (flags :INT)
  (w :FLOAT) (h :FLOAT))

(defcfun ("ImGui_PushStyleVarXY" push-style-var-xy) :VOID
  (idx :INT)
  (x :FLOAT) (y :FLOAT))

(defcfun ("ImGui_PushStyleColorXYZW" push-style-color-xyzw) :VOID
  (idx :INT)
  (r :FLOAT) (g :FLOAT) (b :FLOAT) (a :FLOAT))


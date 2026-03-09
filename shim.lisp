;;;; shim_generated.lisp
;;;; Auto-generated CFFI bindings for abi_shim_generated.cpp
;;;; DO NOT EDIT by hand — regenerate with generator.lisp

(in-package #:cl-dear-imgui)

(defcfun ("ImGui_BeginChildXY" begin-child-xy) :BOOL
  (str-id :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (child-flags CHILD-FLAGS)
  (window-flags WINDOW-FLAGS)
)

(defcfun ("ImGui_BeginChildIDXY" begin-child-idxy) :BOOL
  (id ID)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (child-flags CHILD-FLAGS)
  (window-flags WINDOW-FLAGS)
)

(defcfun ("ImGui_SetNextWindowPosExXY" set-next-window-pos-ex-xy) :VOID
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (cond COND)
  (pivot-x :FLOAT)
  (pivot-y :FLOAT)
)

(defcfun ("ImGui_SetNextWindowSizeXY" set-next-window-size-xy) :VOID
  (size-x :FLOAT)
  (size-y :FLOAT)
  (cond COND)
)

(defcfun ("ImGui_SetNextWindowSizeConstraintsXY" set-next-window-size-constraints-xy) :VOID
  (size-min-x :FLOAT)
  (size-min-y :FLOAT)
  (size-max-x :FLOAT)
  (size-max-y :FLOAT)
  (custom-callback SIZE-CALLBACK)
  (custom-callback-data :POINTER)
)

(defcfun ("ImGui_SetNextWindowContentSizeXY" set-next-window-content-size-xy) :VOID
  (size-x :FLOAT)
  (size-y :FLOAT)
)

(defcfun ("ImGui_SetNextWindowScrollXY" set-next-window-scroll-xy) :VOID
  (scroll-x :FLOAT)
  (scroll-y :FLOAT)
)

(defcfun ("ImGui_SetWindowPosXY" set-window-pos-xy) :VOID
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (cond COND)
)

(defcfun ("ImGui_SetWindowSizeXY" set-window-size-xy) :VOID
  (size-x :FLOAT)
  (size-y :FLOAT)
  (cond COND)
)

(defcfun ("ImGui_SetWindowPosStrXY" set-window-pos-str-xy) :VOID
  (name :STRING)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (cond COND)
)

(defcfun ("ImGui_SetWindowSizeStrXY" set-window-size-str-xy) :VOID
  (name :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (cond COND)
)

(defcfun ("ImGui_PushStyleColorImVec4XYZW" push-style-color-im-vec4xyzw) :VOID
  (idx COL)
  (col-x :FLOAT)
  (col-y :FLOAT)
  (col-z :FLOAT)
  (col-w :FLOAT)
)

(defcfun ("ImGui_PushStyleVarImVec2XY" push-style-var-im-vec2xy) :VOID
  (idx STYLE-VAR)
  (val-x :FLOAT)
  (val-y :FLOAT)
)

(defcfun ("ImGui_GetColorU32ImVec4XYZW" get-color-u32im-vec4xyzw) U32
  (col-x :FLOAT)
  (col-y :FLOAT)
  (col-z :FLOAT)
  (col-w :FLOAT)
)

(defcfun ("ImGui_SetCursorScreenPosXY" set-cursor-screen-pos-xy) :VOID
  (pos-x :FLOAT)
  (pos-y :FLOAT)
)

(defcfun ("ImGui_SetCursorPosXY" set-cursor-pos-xy) :VOID
  (local-pos-x :FLOAT)
  (local-pos-y :FLOAT)
)

(defcfun ("ImGui_DummyXY" dummy-xy) :VOID
  (size-x :FLOAT)
  (size-y :FLOAT)
)

;; SKIPPED (varargs): ImGui_TextColored

(defcfun ("ImGui_TextColoredVXYZW" text-colored-vxyzw) :VOID
  (col-x :FLOAT)
  (col-y :FLOAT)
  (col-z :FLOAT)
  (col-w :FLOAT)
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_ButtonExXY" button-ex-xy) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

(defcfun ("ImGui_InvisibleButtonXY" invisible-button-xy) :BOOL
  (str-id :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (flags BUTTON-FLAGS)
)

(defcfun ("ImGui_ProgressBarXY" progress-bar-xy) :VOID
  (fraction :FLOAT)
  (size-arg-x :FLOAT)
  (size-arg-y :FLOAT)
  (overlay :STRING)
)

(defcfun ("ImGui_ImageExTRXY" image-ex-trxy) :VOID
  (tex-ref :POINTER)
  (image-size-x :FLOAT)
  (image-size-y :FLOAT)
  (uv0-x :FLOAT)
  (uv0-y :FLOAT)
  (uv1-x :FLOAT)
  (uv1-y :FLOAT)
)

(defcfun ("ImGui_ImageWithBgExTRXYXYZW" image-with-bg-ex-trxyxyzw) :VOID
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

(defcfun ("ImGui_ImageButtonExTRXYXYZW" image-button-ex-trxyxyzw) :BOOL
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

(defcfun ("ImGui_VSliderFloatExXY" vslider-float-ex-xy) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (v :POINTER)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

(defcfun ("ImGui_VSliderIntExXY" vslider-int-ex-xy) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (v :POINTER)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

(defcfun ("ImGui_VSliderScalarExXY" vslider-scalar-ex-xy) :BOOL
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

(defcfun ("ImGui_InputTextMultilineExXY" input-text-multiline-ex-xy) :BOOL
  (label :STRING)
  (buf :STRING)
  (buf-size :SIZE)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (flags INPUT-TEXT-FLAGS)
  (callback INPUT-TEXT-CALLBACK)
  (user-data :POINTER)
)

(defcfun ("ImGui_ColorButtonExXYZWXY" color-button-ex-xyzwxy) :BOOL
  (desc-id :STRING)
  (col-x :FLOAT)
  (col-y :FLOAT)
  (col-z :FLOAT)
  (col-w :FLOAT)
  (flags COLOR-EDIT-FLAGS)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

(defcfun ("ImGui_SelectableExXY" selectable-ex-xy) :BOOL
  (label :STRING)
  (selected :BOOL)
  (flags SELECTABLE-FLAGS)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

(defcfun ("ImGui_SelectableBoolPtrExXY" selectable-bool-ptr-ex-xy) :BOOL
  (label :STRING)
  (p-selected :POINTER)
  (flags SELECTABLE-FLAGS)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

(defcfun ("ImGui_BeginListBoxXY" begin-list-box-xy) :BOOL
  (label :STRING)
  (size-x :FLOAT)
  (size-y :FLOAT)
)

(defcfun ("ImGui_PlotLinesExXY" plot-lines-ex-xy) :VOID
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

(defcfun ("ImGui_PlotLinesCallbackExXY" plot-lines-callback-ex-xy) :VOID
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

(defcfun ("ImGui_PlotHistogramExXY" plot-histogram-ex-xy) :VOID
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

(defcfun ("ImGui_PlotHistogramCallbackExXY" plot-histogram-callback-ex-xy) :VOID
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

(defcfun ("ImGui_BeginTableExXY" begin-table-ex-xy) :BOOL
  (str-id :STRING)
  (columns :INT)
  (flags TABLE-FLAGS)
  (outer-size-x :FLOAT)
  (outer-size-y :FLOAT)
  (inner-width :FLOAT)
)

(defcfun ("ImGui_PushClipRectXY" push-clip-rect-xy) :VOID
  (clip-rect-min-x :FLOAT)
  (clip-rect-min-y :FLOAT)
  (clip-rect-max-x :FLOAT)
  (clip-rect-max-y :FLOAT)
  (intersect-with-current-clip-rect :BOOL)
)

(defcfun ("ImGui_IsRectVisibleBySizeXY" is-rect-visible-by-size-xy) :BOOL
  (size-x :FLOAT)
  (size-y :FLOAT)
)

(defcfun ("ImGui_IsRectVisibleXY" is-rect-visible-xy) :BOOL
  (rect-min-x :FLOAT)
  (rect-min-y :FLOAT)
  (rect-max-x :FLOAT)
  (rect-max-y :FLOAT)
)

(defcfun ("ImGui_ColorConvertFloat4ToU32XYZW" color-convert-float4to-u32xyzw) U32
  (in-x :FLOAT)
  (in-y :FLOAT)
  (in-z :FLOAT)
  (in-w :FLOAT)
)

(defcfun ("ImGui_IsMouseHoveringRectExXY" is-mouse-hovering-rect-ex-xy) :BOOL
  (r-min-x :FLOAT)
  (r-min-y :FLOAT)
  (r-max-x :FLOAT)
  (r-max-y :FLOAT)
  (clip :BOOL)
)

(defcfun ("ImDrawList_PushClipRectXY" draw-list-push-clip-rect-xy) :VOID
  (self :POINTER)
  (clip-rect-min-x :FLOAT)
  (clip-rect-min-y :FLOAT)
  (clip-rect-max-x :FLOAT)
  (clip-rect-max-y :FLOAT)
  (intersect-with-current-clip-rect :BOOL)
)

(defcfun ("ImDrawList_PushTextureTR" draw-list-push-texture-tr) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
)

(defcfun ("ImDrawList_AddLineExXY" draw-list-add-line-ex-xy) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (col U32)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddRectExXY" draw-list-add-rect-ex-xy) :VOID
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

(defcfun ("ImDrawList_AddRectFilledExXY" draw-list-add-rect-filled-ex-xy) :VOID
  (self :POINTER)
  (p-min-x :FLOAT)
  (p-min-y :FLOAT)
  (p-max-x :FLOAT)
  (p-max-y :FLOAT)
  (col U32)
  (rounding :FLOAT)
  (flags DRAW-FLAGS)
)

(defcfun ("ImDrawList_AddRectFilledMultiColorXY" draw-list-add-rect-filled-multi-color-xy) :VOID
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

(defcfun ("ImDrawList_AddQuadExXY" draw-list-add-quad-ex-xy) :VOID
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

(defcfun ("ImDrawList_AddQuadFilledXY" draw-list-add-quad-filled-xy) :VOID
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

(defcfun ("ImDrawList_AddTriangleExXY" draw-list-add-triangle-ex-xy) :VOID
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

(defcfun ("ImDrawList_AddTriangleFilledXY" draw-list-add-triangle-filled-xy) :VOID
  (self :POINTER)
  (p1-x :FLOAT)
  (p1-y :FLOAT)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (col U32)
)

(defcfun ("ImDrawList_AddCircleExXY" draw-list-add-circle-ex-xy) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddCircleFilledXY" draw-list-add-circle-filled-xy) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
)

(defcfun ("ImDrawList_AddNgonExXY" draw-list-add-ngon-ex-xy) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddNgonFilledXY" draw-list-add-ngon-filled-xy) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
)

(defcfun ("ImDrawList_AddEllipseExXY" draw-list-add-ellipse-ex-xy) :VOID
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

(defcfun ("ImDrawList_AddEllipseFilledExXY" draw-list-add-ellipse-filled-ex-xy) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius-x :FLOAT)
  (radius-y :FLOAT)
  (col U32)
  (rot :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawList_AddTextExXY" draw-list-add-text-ex-xy) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (col U32)
  (text-begin :STRING)
  (text-end :STRING)
)

(defcfun ("ImDrawList_AddTextImFontPtrExXY" draw-list-add-text-im-font-ptr-ex-xy) :VOID
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

(defcfun ("ImDrawList_AddBezierCubicXY" draw-list-add-bezier-cubic-xy) :VOID
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

(defcfun ("ImDrawList_AddBezierQuadraticXY" draw-list-add-bezier-quadratic-xy) :VOID
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

(defcfun ("ImDrawList_AddImageExTRXY" draw-list-add-image-ex-trxy) :VOID
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

(defcfun ("ImDrawList_AddImageQuadExTRXY" draw-list-add-image-quad-ex-trxy) :VOID
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

(defcfun ("ImDrawList_AddImageRoundedTRXY" draw-list-add-image-rounded-trxy) :VOID
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

(defcfun ("ImDrawList_PathLineToXY" draw-list-path-line-to-xy) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
)

(defcfun ("ImDrawList_PathLineToMergeDuplicateXY" draw-list-path-line-to-merge-duplicate-xy) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
)

(defcfun ("ImDrawList_PathArcToXY" draw-list-path-arc-to-xy) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (a-min :FLOAT)
  (a-max :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawList_PathArcToFastXY" draw-list-path-arc-to-fast-xy) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (a-min-of-12 :INT)
  (a-max-of-12 :INT)
)

(defcfun ("ImDrawList_PathEllipticalArcToExXY" draw-list-path-elliptical-arc-to-ex-xy) :VOID
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

(defcfun ("ImDrawList_PathBezierCubicCurveToXY" draw-list-path-bezier-cubic-curve-to-xy) :VOID
  (self :POINTER)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (p4-x :FLOAT)
  (p4-y :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawList_PathBezierQuadraticCurveToXY" draw-list-path-bezier-quadratic-curve-to-xy) :VOID
  (self :POINTER)
  (p2-x :FLOAT)
  (p2-y :FLOAT)
  (p3-x :FLOAT)
  (p3-y :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawList_PathRectXY" draw-list-path-rect-xy) :VOID
  (self :POINTER)
  (rect-min-x :FLOAT)
  (rect-min-y :FLOAT)
  (rect-max-x :FLOAT)
  (rect-max-y :FLOAT)
  (rounding :FLOAT)
  (flags DRAW-FLAGS)
)

(defcfun ("ImDrawList_PrimRectXY" draw-list-prim-rect-xy) :VOID
  (self :POINTER)
  (a-x :FLOAT)
  (a-y :FLOAT)
  (b-x :FLOAT)
  (b-y :FLOAT)
  (col U32)
)

(defcfun ("ImDrawList_PrimRectUVXY" draw-list-prim-rect-uvxy) :VOID
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

(defcfun ("ImDrawList_PrimQuadUVXY" draw-list-prim-quad-uvxy) :VOID
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

(defcfun ("ImDrawList_PrimWriteVtxXY" draw-list-prim-write-vtx-xy) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (uv-x :FLOAT)
  (uv-y :FLOAT)
  (col U32)
)

(defcfun ("ImDrawList_PrimVtxXY" draw-list-prim-vtx-xy) :VOID
  (self :POINTER)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (uv-x :FLOAT)
  (uv-y :FLOAT)
  (col U32)
)

(defcfun ("ImDrawList_PushTextureIDTR" draw-list-push-texture-idtr) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
)

(defcfun ("ImDrawList__SetTextureTR" draw-list--set-texture-tr) :VOID
  (self :POINTER)
  (tex-ref :POINTER)
)

(defcfun ("ImDrawList__PathArcToFastExXY" draw-list--path-arc-to-fast-ex-xy) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (a-min-sample :INT)
  (a-max-sample :INT)
  (a-step :INT)
)

(defcfun ("ImDrawList__PathArcToNXY" draw-list--path-arc-to-nxy) :VOID
  (self :POINTER)
  (center-x :FLOAT)
  (center-y :FLOAT)
  (radius :FLOAT)
  (a-min :FLOAT)
  (a-max :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawData_ScaleClipRectsXY" draw-data-scale-clip-rects-xy) :VOID
  (self :POINTER)
  (fb-scale-x :FLOAT)
  (fb-scale-y :FLOAT)
)

(defcfun ("ImFontAtlas_SetTexIDImTextureRefTR" font-atlas-set-tex-idim-texture-ref-tr) :VOID
  (self :POINTER)
  (id :POINTER)
)

(defcfun ("ImFontAtlas_AddCustomRectFontGlyphXY" font-atlas-add-custom-rect-font-glyph-xy) FONT-ATLAS-RECT-ID
  (self :POINTER)
  (font :POINTER)
  (codepoint WCHAR)
  (w :INT)
  (h :INT)
  (advance-x :FLOAT)
  (offset-x :FLOAT)
  (offset-y :FLOAT)
)

(defcfun ("ImFontAtlas_AddCustomRectFontGlyphForSizeXY" font-atlas-add-custom-rect-font-glyph-for-size-xy) FONT-ATLAS-RECT-ID
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

(defcfun ("ImFont_RenderCharExXY" font-render-char-ex-xy) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (size :FLOAT)
  (pos-x :FLOAT)
  (pos-y :FLOAT)
  (col U32)
  (c WCHAR)
  (cpu-fine-clip :POINTER)
)

(defcfun ("ImFont_RenderTextXYXYZW" font-render-text-xyxyzw) :VOID
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

(defcfun ("ImGui_ImageImVec4TRXYXYZW" image-im-vec4trxyxyzw) :VOID
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

(defcfun ("ImGui_BeginChildFrameExXY" begin-child-frame-ex-xy) :BOOL
  (id ID)
  (size-x :FLOAT)
  (size-y :FLOAT)
  (window-flags WINDOW-FLAGS)
)


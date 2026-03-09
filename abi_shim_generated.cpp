// abi_shim_generated.cpp
// Auto-generated ABI shims — DO NOT EDIT by hand.
// Regenerate by running cl-dear-imgui/generator.lisp.
// Expands by-value ImVec2/ImVec4 args to floats; ImTextureRef to pointer.

#include "imgui.h"
#include "imgui_internal.h"
#include <stdint.h>
#include <stdarg.h>

extern "C" {

bool ImGui_BeginChildXY(const char* str_id, float size_x, float size_y, ::ImGuiChildFlags child_flags, ::ImGuiWindowFlags window_flags)
{
    return ::ImGui::BeginChild(str_id, ::ImVec2(size_x, size_y), child_flags, window_flags);
}

bool ImGui_BeginChildIDXY(::ImGuiID id, float size_x, float size_y, ::ImGuiChildFlags child_flags, ::ImGuiWindowFlags window_flags)
{
    return ::ImGui::BeginChild(id, ::ImVec2(size_x, size_y), child_flags, window_flags);
}

void ImGui_SetNextWindowPosExXY(float pos_x, float pos_y, ::ImGuiCond cond, float pivot_x, float pivot_y)
{
    ::ImGui::SetNextWindowPos(::ImVec2(pos_x, pos_y), cond, ::ImVec2(pivot_x, pivot_y));
}

void ImGui_SetNextWindowSizeXY(float size_x, float size_y, ::ImGuiCond cond)
{
    ::ImGui::SetNextWindowSize(::ImVec2(size_x, size_y), cond);
}

void ImGui_SetNextWindowSizeConstraintsXY(float size_min_x, float size_min_y, float size_max_x, float size_max_y, ::ImGuiSizeCallback custom_callback, void* custom_callback_data)
{
    ::ImGui::SetNextWindowSizeConstraints(::ImVec2(size_min_x, size_min_y), ::ImVec2(size_max_x, size_max_y), custom_callback, custom_callback_data);
}

void ImGui_SetNextWindowContentSizeXY(float size_x, float size_y)
{
    ::ImGui::SetNextWindowContentSize(::ImVec2(size_x, size_y));
}

void ImGui_SetNextWindowScrollXY(float scroll_x, float scroll_y)
{
    ::ImGui::SetNextWindowScroll(::ImVec2(scroll_x, scroll_y));
}

void ImGui_SetWindowPosXY(float pos_x, float pos_y, ::ImGuiCond cond)
{
    ::ImGui::SetWindowPos(::ImVec2(pos_x, pos_y), cond);
}

void ImGui_SetWindowSizeXY(float size_x, float size_y, ::ImGuiCond cond)
{
    ::ImGui::SetWindowSize(::ImVec2(size_x, size_y), cond);
}

void ImGui_SetWindowPosStrXY(const char* name, float pos_x, float pos_y, ::ImGuiCond cond)
{
    ::ImGui::SetWindowPos(name, ::ImVec2(pos_x, pos_y), cond);
}

void ImGui_SetWindowSizeStrXY(const char* name, float size_x, float size_y, ::ImGuiCond cond)
{
    ::ImGui::SetWindowSize(name, ::ImVec2(size_x, size_y), cond);
}

void ImGui_PushStyleColorImVec4XYZW(::ImGuiCol idx, float col_x, float col_y, float col_z, float col_w)
{
    ::ImGui::PushStyleColor(idx, ::ImVec4(col_x, col_y, col_z, col_w));
}

void ImGui_PushStyleVarImVec2XY(::ImGuiStyleVar idx, float val_x, float val_y)
{
    ::ImGui::PushStyleVar(idx, ::ImVec2(val_x, val_y));
}

unsigned int ImGui_GetColorU32ImVec4XYZW(float col_x, float col_y, float col_z, float col_w)
{
    return ::ImGui::GetColorU32(::ImVec4(col_x, col_y, col_z, col_w));
}

void ImGui_SetCursorScreenPosXY(float pos_x, float pos_y)
{
    ::ImGui::SetCursorScreenPos(::ImVec2(pos_x, pos_y));
}

void ImGui_SetCursorPosXY(float local_pos_x, float local_pos_y)
{
    ::ImGui::SetCursorPos(::ImVec2(local_pos_x, local_pos_y));
}

void ImGui_DummyXY(float size_x, float size_y)
{
    ::ImGui::Dummy(::ImVec2(size_x, size_y));
}

// SKIPPED (varargs): ImGui_TextColored

void ImGui_TextColoredVXYZW(float col_x, float col_y, float col_z, float col_w, const char* fmt, va_list args)
{
    ::ImGui::TextColoredV(::ImVec4(col_x, col_y, col_z, col_w), fmt, args);
}

bool ImGui_ButtonExXY(const char* label, float size_x, float size_y)
{
    return ::ImGui::Button(label, ::ImVec2(size_x, size_y));
}

bool ImGui_InvisibleButtonXY(const char* str_id, float size_x, float size_y, ::ImGuiButtonFlags flags)
{
    return ::ImGui::InvisibleButton(str_id, ::ImVec2(size_x, size_y), flags);
}

void ImGui_ProgressBarXY(float fraction, float size_arg_x, float size_arg_y, const char* overlay)
{
    ::ImGui::ProgressBar(fraction, ::ImVec2(size_arg_x, size_arg_y), overlay);
}

void ImGui_ImageExTRXY(::ImTextureRef* tex_ref, float image_size_x, float image_size_y, float uv0_x, float uv0_y, float uv1_x, float uv1_y)
{
    ::ImGui::Image(*tex_ref, ::ImVec2(image_size_x, image_size_y), ::ImVec2(uv0_x, uv0_y), ::ImVec2(uv1_x, uv1_y));
}

void ImGui_ImageWithBgExTRXYXYZW(::ImTextureRef* tex_ref, float image_size_x, float image_size_y, float uv0_x, float uv0_y, float uv1_x, float uv1_y, float bg_col_x, float bg_col_y, float bg_col_z, float bg_col_w, float tint_col_x, float tint_col_y, float tint_col_z, float tint_col_w)
{
    ::ImGui::ImageWithBg(*tex_ref, ::ImVec2(image_size_x, image_size_y), ::ImVec2(uv0_x, uv0_y), ::ImVec2(uv1_x, uv1_y), ::ImVec4(bg_col_x, bg_col_y, bg_col_z, bg_col_w), ::ImVec4(tint_col_x, tint_col_y, tint_col_z, tint_col_w));
}

bool ImGui_ImageButtonExTRXYXYZW(const char* str_id, ::ImTextureRef* tex_ref, float image_size_x, float image_size_y, float uv0_x, float uv0_y, float uv1_x, float uv1_y, float bg_col_x, float bg_col_y, float bg_col_z, float bg_col_w, float tint_col_x, float tint_col_y, float tint_col_z, float tint_col_w)
{
    return ::ImGui::ImageButton(str_id, *tex_ref, ::ImVec2(image_size_x, image_size_y), ::ImVec2(uv0_x, uv0_y), ::ImVec2(uv1_x, uv1_y), ::ImVec4(bg_col_x, bg_col_y, bg_col_z, bg_col_w), ::ImVec4(tint_col_x, tint_col_y, tint_col_z, tint_col_w));
}

bool ImGui_VSliderFloatExXY(const char* label, float size_x, float size_y, void* v, float v_min, float v_max, const char* format, ::ImGuiSliderFlags flags)
{
    return ::ImGui::VSliderFloat(label, ::ImVec2(size_x, size_y), v, v_min, v_max, format, flags);
}

bool ImGui_VSliderIntExXY(const char* label, float size_x, float size_y, void* v, int v_min, int v_max, const char* format, ::ImGuiSliderFlags flags)
{
    return ::ImGui::VSliderInt(label, ::ImVec2(size_x, size_y), v, v_min, v_max, format, flags);
}

bool ImGui_VSliderScalarExXY(const char* label, float size_x, float size_y, ::ImGuiDataType data_type, void* p_data, void* p_min, void* p_max, const char* format, ::ImGuiSliderFlags flags)
{
    return ::ImGui::VSliderScalar(label, ::ImVec2(size_x, size_y), data_type, p_data, p_min, p_max, format, flags);
}

bool ImGui_InputTextMultilineExXY(const char* label, const char* buf, size_t buf_size, float size_x, float size_y, ::ImGuiInputTextFlags flags, ::ImGuiInputTextCallback callback, void* user_data)
{
    return ::ImGui::InputTextMultiline(label, buf, buf_size, ::ImVec2(size_x, size_y), flags, callback, user_data);
}

bool ImGui_ColorButtonExXYZWXY(const char* desc_id, float col_x, float col_y, float col_z, float col_w, ::ImGuiColorEditFlags flags, float size_x, float size_y)
{
    return ::ImGui::ColorButton(desc_id, ::ImVec4(col_x, col_y, col_z, col_w), flags, ::ImVec2(size_x, size_y));
}

bool ImGui_SelectableExXY(const char* label, bool selected, ::ImGuiSelectableFlags flags, float size_x, float size_y)
{
    return ::ImGui::Selectable(label, selected, flags, ::ImVec2(size_x, size_y));
}

bool ImGui_SelectableBoolPtrExXY(const char* label, void* p_selected, ::ImGuiSelectableFlags flags, float size_x, float size_y)
{
    return ::ImGui::Selectable(label, p_selected, flags, ::ImVec2(size_x, size_y));
}

bool ImGui_BeginListBoxXY(const char* label, float size_x, float size_y)
{
    return ::ImGui::BeginListBox(label, ::ImVec2(size_x, size_y));
}

void ImGui_PlotLinesExXY(const char* label, void* values, int values_count, int values_offset, const char* overlay_text, float scale_min, float scale_max, float graph_size_x, float graph_size_y, int stride)
{
    ::ImGui::PlotLines(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, ::ImVec2(graph_size_x, graph_size_y), stride);
}

void ImGui_PlotLinesCallbackExXY(const char* label, void* values_getter, void* data, int values_count, int values_offset, const char* overlay_text, float scale_min, float scale_max, float graph_size_x, float graph_size_y)
{
    ::ImGui::PlotLines(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, ::ImVec2(graph_size_x, graph_size_y));
}

void ImGui_PlotHistogramExXY(const char* label, void* values, int values_count, int values_offset, const char* overlay_text, float scale_min, float scale_max, float graph_size_x, float graph_size_y, int stride)
{
    ::ImGui::PlotHistogram(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, ::ImVec2(graph_size_x, graph_size_y), stride);
}

void ImGui_PlotHistogramCallbackExXY(const char* label, void* values_getter, void* data, int values_count, int values_offset, const char* overlay_text, float scale_min, float scale_max, float graph_size_x, float graph_size_y)
{
    ::ImGui::PlotHistogram(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, ::ImVec2(graph_size_x, graph_size_y));
}

bool ImGui_BeginTableExXY(const char* str_id, int columns, ::ImGuiTableFlags flags, float outer_size_x, float outer_size_y, float inner_width)
{
    return ::ImGui::BeginTable(str_id, columns, flags, ::ImVec2(outer_size_x, outer_size_y), inner_width);
}

void ImGui_PushClipRectXY(float clip_rect_min_x, float clip_rect_min_y, float clip_rect_max_x, float clip_rect_max_y, bool intersect_with_current_clip_rect)
{
    ::ImGui::PushClipRect(::ImVec2(clip_rect_min_x, clip_rect_min_y), ::ImVec2(clip_rect_max_x, clip_rect_max_y), intersect_with_current_clip_rect);
}

bool ImGui_IsRectVisibleBySizeXY(float size_x, float size_y)
{
    return ::ImGui::IsRectVisible(::ImVec2(size_x, size_y));
}

bool ImGui_IsRectVisibleXY(float rect_min_x, float rect_min_y, float rect_max_x, float rect_max_y)
{
    return ::ImGui::IsRectVisible(::ImVec2(rect_min_x, rect_min_y), ::ImVec2(rect_max_x, rect_max_y));
}

unsigned int ImGui_ColorConvertFloat4ToU32XYZW(float in_x, float in_y, float in_z, float in_w)
{
    return ::ImGui::ColorConvertFloat4ToU32(::ImVec4(in_x, in_y, in_z, in_w));
}

bool ImGui_IsMouseHoveringRectExXY(float r_min_x, float r_min_y, float r_max_x, float r_max_y, bool clip)
{
    return ::ImGui::IsMouseHoveringRect(::ImVec2(r_min_x, r_min_y), ::ImVec2(r_max_x, r_max_y), clip);
}

void ImDrawList_PushClipRectXY(::ImDrawList* self, float clip_rect_min_x, float clip_rect_min_y, float clip_rect_max_x, float clip_rect_max_y, bool intersect_with_current_clip_rect)
{
    self->PushClipRect(::ImVec2(clip_rect_min_x, clip_rect_min_y), ::ImVec2(clip_rect_max_x, clip_rect_max_y), intersect_with_current_clip_rect);
}

void ImDrawList_PushTextureTR(::ImDrawList* self, ::ImTextureRef* tex_ref)
{
    self->PushTexture(*tex_ref);
}

void ImDrawList_AddLineExXY(::ImDrawList* self, float p1_x, float p1_y, float p2_x, float p2_y, unsigned int col, float thickness)
{
    self->AddLine(::ImVec2(p1_x, p1_y), ::ImVec2(p2_x, p2_y), col, thickness);
}

void ImDrawList_AddRectExXY(::ImDrawList* self, float p_min_x, float p_min_y, float p_max_x, float p_max_y, unsigned int col, float rounding, ::ImDrawFlags flags, float thickness)
{
    self->AddRect(::ImVec2(p_min_x, p_min_y), ::ImVec2(p_max_x, p_max_y), col, rounding, flags, thickness);
}

void ImDrawList_AddRectFilledExXY(::ImDrawList* self, float p_min_x, float p_min_y, float p_max_x, float p_max_y, unsigned int col, float rounding, ::ImDrawFlags flags)
{
    self->AddRectFilled(::ImVec2(p_min_x, p_min_y), ::ImVec2(p_max_x, p_max_y), col, rounding, flags);
}

void ImDrawList_AddRectFilledMultiColorXY(::ImDrawList* self, float p_min_x, float p_min_y, float p_max_x, float p_max_y, unsigned int col_upr_left, unsigned int col_upr_right, unsigned int col_bot_right, unsigned int col_bot_left)
{
    self->AddRectFilledMultiColor(::ImVec2(p_min_x, p_min_y), ::ImVec2(p_max_x, p_max_y), col_upr_left, col_upr_right, col_bot_right, col_bot_left);
}

void ImDrawList_AddQuadExXY(::ImDrawList* self, float p1_x, float p1_y, float p2_x, float p2_y, float p3_x, float p3_y, float p4_x, float p4_y, unsigned int col, float thickness)
{
    self->AddQuad(::ImVec2(p1_x, p1_y), ::ImVec2(p2_x, p2_y), ::ImVec2(p3_x, p3_y), ::ImVec2(p4_x, p4_y), col, thickness);
}

void ImDrawList_AddQuadFilledXY(::ImDrawList* self, float p1_x, float p1_y, float p2_x, float p2_y, float p3_x, float p3_y, float p4_x, float p4_y, unsigned int col)
{
    self->AddQuadFilled(::ImVec2(p1_x, p1_y), ::ImVec2(p2_x, p2_y), ::ImVec2(p3_x, p3_y), ::ImVec2(p4_x, p4_y), col);
}

void ImDrawList_AddTriangleExXY(::ImDrawList* self, float p1_x, float p1_y, float p2_x, float p2_y, float p3_x, float p3_y, unsigned int col, float thickness)
{
    self->AddTriangle(::ImVec2(p1_x, p1_y), ::ImVec2(p2_x, p2_y), ::ImVec2(p3_x, p3_y), col, thickness);
}

void ImDrawList_AddTriangleFilledXY(::ImDrawList* self, float p1_x, float p1_y, float p2_x, float p2_y, float p3_x, float p3_y, unsigned int col)
{
    self->AddTriangleFilled(::ImVec2(p1_x, p1_y), ::ImVec2(p2_x, p2_y), ::ImVec2(p3_x, p3_y), col);
}

void ImDrawList_AddCircleExXY(::ImDrawList* self, float center_x, float center_y, float radius, unsigned int col, int num_segments, float thickness)
{
    self->AddCircle(::ImVec2(center_x, center_y), radius, col, num_segments, thickness);
}

void ImDrawList_AddCircleFilledXY(::ImDrawList* self, float center_x, float center_y, float radius, unsigned int col, int num_segments)
{
    self->AddCircleFilled(::ImVec2(center_x, center_y), radius, col, num_segments);
}

void ImDrawList_AddNgonExXY(::ImDrawList* self, float center_x, float center_y, float radius, unsigned int col, int num_segments, float thickness)
{
    self->AddNgon(::ImVec2(center_x, center_y), radius, col, num_segments, thickness);
}

void ImDrawList_AddNgonFilledXY(::ImDrawList* self, float center_x, float center_y, float radius, unsigned int col, int num_segments)
{
    self->AddNgonFilled(::ImVec2(center_x, center_y), radius, col, num_segments);
}

void ImDrawList_AddEllipseExXY(::ImDrawList* self, float center_x, float center_y, float radius_x, float radius_y, unsigned int col, float rot, int num_segments, float thickness)
{
    self->AddEllipse(::ImVec2(center_x, center_y), ::ImVec2(radius_x, radius_y), col, rot, num_segments, thickness);
}

void ImDrawList_AddEllipseFilledExXY(::ImDrawList* self, float center_x, float center_y, float radius_x, float radius_y, unsigned int col, float rot, int num_segments)
{
    self->AddEllipseFilled(::ImVec2(center_x, center_y), ::ImVec2(radius_x, radius_y), col, rot, num_segments);
}

void ImDrawList_AddTextExXY(::ImDrawList* self, float pos_x, float pos_y, unsigned int col, const char* text_begin, const char* text_end)
{
    self->AddText(::ImVec2(pos_x, pos_y), col, text_begin, text_end);
}

void ImDrawList_AddTextImFontPtrExXY(::ImDrawList* self, ::ImFont* font, float font_size, float pos_x, float pos_y, unsigned int col, const char* text_begin, const char* text_end, float wrap_width, ::ImVec4* cpu_fine_clip_rect)
{
    self->AddText(font, font_size, ::ImVec2(pos_x, pos_y), col, text_begin, text_end, wrap_width, cpu_fine_clip_rect);
}

void ImDrawList_AddBezierCubicXY(::ImDrawList* self, float p1_x, float p1_y, float p2_x, float p2_y, float p3_x, float p3_y, float p4_x, float p4_y, unsigned int col, float thickness, int num_segments)
{
    self->AddBezierCubic(::ImVec2(p1_x, p1_y), ::ImVec2(p2_x, p2_y), ::ImVec2(p3_x, p3_y), ::ImVec2(p4_x, p4_y), col, thickness, num_segments);
}

void ImDrawList_AddBezierQuadraticXY(::ImDrawList* self, float p1_x, float p1_y, float p2_x, float p2_y, float p3_x, float p3_y, unsigned int col, float thickness, int num_segments)
{
    self->AddBezierQuadratic(::ImVec2(p1_x, p1_y), ::ImVec2(p2_x, p2_y), ::ImVec2(p3_x, p3_y), col, thickness, num_segments);
}

void ImDrawList_AddImageExTRXY(::ImDrawList* self, ::ImTextureRef* tex_ref, float p_min_x, float p_min_y, float p_max_x, float p_max_y, float uv_min_x, float uv_min_y, float uv_max_x, float uv_max_y, unsigned int col)
{
    self->AddImage(*tex_ref, ::ImVec2(p_min_x, p_min_y), ::ImVec2(p_max_x, p_max_y), ::ImVec2(uv_min_x, uv_min_y), ::ImVec2(uv_max_x, uv_max_y), col);
}

void ImDrawList_AddImageQuadExTRXY(::ImDrawList* self, ::ImTextureRef* tex_ref, float p1_x, float p1_y, float p2_x, float p2_y, float p3_x, float p3_y, float p4_x, float p4_y, float uv1_x, float uv1_y, float uv2_x, float uv2_y, float uv3_x, float uv3_y, float uv4_x, float uv4_y, unsigned int col)
{
    self->AddImageQuad(*tex_ref, ::ImVec2(p1_x, p1_y), ::ImVec2(p2_x, p2_y), ::ImVec2(p3_x, p3_y), ::ImVec2(p4_x, p4_y), ::ImVec2(uv1_x, uv1_y), ::ImVec2(uv2_x, uv2_y), ::ImVec2(uv3_x, uv3_y), ::ImVec2(uv4_x, uv4_y), col);
}

void ImDrawList_AddImageRoundedTRXY(::ImDrawList* self, ::ImTextureRef* tex_ref, float p_min_x, float p_min_y, float p_max_x, float p_max_y, float uv_min_x, float uv_min_y, float uv_max_x, float uv_max_y, unsigned int col, float rounding, ::ImDrawFlags flags)
{
    self->AddImageRounded(*tex_ref, ::ImVec2(p_min_x, p_min_y), ::ImVec2(p_max_x, p_max_y), ::ImVec2(uv_min_x, uv_min_y), ::ImVec2(uv_max_x, uv_max_y), col, rounding, flags);
}

void ImDrawList_PathLineToXY(::ImDrawList* self, float pos_x, float pos_y)
{
    self->PathLineTo(::ImVec2(pos_x, pos_y));
}

void ImDrawList_PathLineToMergeDuplicateXY(::ImDrawList* self, float pos_x, float pos_y)
{
    self->PathLineToMergeDuplicate(::ImVec2(pos_x, pos_y));
}

void ImDrawList_PathArcToXY(::ImDrawList* self, float center_x, float center_y, float radius, float a_min, float a_max, int num_segments)
{
    self->PathArcTo(::ImVec2(center_x, center_y), radius, a_min, a_max, num_segments);
}

void ImDrawList_PathArcToFastXY(::ImDrawList* self, float center_x, float center_y, float radius, int a_min_of_12, int a_max_of_12)
{
    self->PathArcToFast(::ImVec2(center_x, center_y), radius, a_min_of_12, a_max_of_12);
}

void ImDrawList_PathEllipticalArcToExXY(::ImDrawList* self, float center_x, float center_y, float radius_x, float radius_y, float rot, float a_min, float a_max, int num_segments)
{
    self->PathEllipticalArcTo(::ImVec2(center_x, center_y), ::ImVec2(radius_x, radius_y), rot, a_min, a_max, num_segments);
}

void ImDrawList_PathBezierCubicCurveToXY(::ImDrawList* self, float p2_x, float p2_y, float p3_x, float p3_y, float p4_x, float p4_y, int num_segments)
{
    self->PathBezierCubicCurveTo(::ImVec2(p2_x, p2_y), ::ImVec2(p3_x, p3_y), ::ImVec2(p4_x, p4_y), num_segments);
}

void ImDrawList_PathBezierQuadraticCurveToXY(::ImDrawList* self, float p2_x, float p2_y, float p3_x, float p3_y, int num_segments)
{
    self->PathBezierQuadraticCurveTo(::ImVec2(p2_x, p2_y), ::ImVec2(p3_x, p3_y), num_segments);
}

void ImDrawList_PathRectXY(::ImDrawList* self, float rect_min_x, float rect_min_y, float rect_max_x, float rect_max_y, float rounding, ::ImDrawFlags flags)
{
    self->PathRect(::ImVec2(rect_min_x, rect_min_y), ::ImVec2(rect_max_x, rect_max_y), rounding, flags);
}

void ImDrawList_PrimRectXY(::ImDrawList* self, float a_x, float a_y, float b_x, float b_y, unsigned int col)
{
    self->PrimRect(::ImVec2(a_x, a_y), ::ImVec2(b_x, b_y), col);
}

void ImDrawList_PrimRectUVXY(::ImDrawList* self, float a_x, float a_y, float b_x, float b_y, float uv_a_x, float uv_a_y, float uv_b_x, float uv_b_y, unsigned int col)
{
    self->PrimRectUV(::ImVec2(a_x, a_y), ::ImVec2(b_x, b_y), ::ImVec2(uv_a_x, uv_a_y), ::ImVec2(uv_b_x, uv_b_y), col);
}

void ImDrawList_PrimQuadUVXY(::ImDrawList* self, float a_x, float a_y, float b_x, float b_y, float c_x, float c_y, float d_x, float d_y, float uv_a_x, float uv_a_y, float uv_b_x, float uv_b_y, float uv_c_x, float uv_c_y, float uv_d_x, float uv_d_y, unsigned int col)
{
    self->PrimQuadUV(::ImVec2(a_x, a_y), ::ImVec2(b_x, b_y), ::ImVec2(c_x, c_y), ::ImVec2(d_x, d_y), ::ImVec2(uv_a_x, uv_a_y), ::ImVec2(uv_b_x, uv_b_y), ::ImVec2(uv_c_x, uv_c_y), ::ImVec2(uv_d_x, uv_d_y), col);
}

void ImDrawList_PrimWriteVtxXY(::ImDrawList* self, float pos_x, float pos_y, float uv_x, float uv_y, unsigned int col)
{
    self->PrimWriteVtx(::ImVec2(pos_x, pos_y), ::ImVec2(uv_x, uv_y), col);
}

void ImDrawList_PrimVtxXY(::ImDrawList* self, float pos_x, float pos_y, float uv_x, float uv_y, unsigned int col)
{
    self->PrimVtx(::ImVec2(pos_x, pos_y), ::ImVec2(uv_x, uv_y), col);
}

void ImDrawList_PushTextureIDTR(::ImDrawList* self, ::ImTextureRef* tex_ref)
{
    self->PushTextureID(*tex_ref);
}

void ImDrawList__SetTextureTR(::ImDrawList* self, ::ImTextureRef* tex_ref)
{
    self->_SetTexture(*tex_ref);
}

void ImDrawList__PathArcToFastExXY(::ImDrawList* self, float center_x, float center_y, float radius, int a_min_sample, int a_max_sample, int a_step)
{
    self->_PathArcToFastEx(::ImVec2(center_x, center_y), radius, a_min_sample, a_max_sample, a_step);
}

void ImDrawList__PathArcToNXY(::ImDrawList* self, float center_x, float center_y, float radius, float a_min, float a_max, int num_segments)
{
    self->_PathArcToN(::ImVec2(center_x, center_y), radius, a_min, a_max, num_segments);
}

void ImDrawData_ScaleClipRectsXY(::ImDrawData* self, float fb_scale_x, float fb_scale_y)
{
    self->ScaleClipRects(::ImVec2(fb_scale_x, fb_scale_y));
}

void ImFontAtlas_SetTexIDImTextureRefTR(::ImFontAtlas* self, ::ImTextureRef* id)
{
    self->SetTexID(*id);
}

::ImFontAtlasRectId ImFontAtlas_AddCustomRectFontGlyphXY(::ImFontAtlas* self, ::ImFont* font, unsigned short codepoint, int w, int h, float advance_x, float offset_x, float offset_y)
{
    return self->AddCustomRectFontGlyph(font, codepoint, w, h, advance_x, ::ImVec2(offset_x, offset_y));
}

::ImFontAtlasRectId ImFontAtlas_AddCustomRectFontGlyphForSizeXY(::ImFontAtlas* self, ::ImFont* font, float font_size, unsigned short codepoint, int w, int h, float advance_x, float offset_x, float offset_y)
{
    return self->AddCustomRectFontGlyphForSize(font, font_size, codepoint, w, h, advance_x, ::ImVec2(offset_x, offset_y));
}

void ImFont_RenderCharExXY(::ImFont* self, ::ImDrawList* draw_list, float size, float pos_x, float pos_y, unsigned int col, unsigned short c, ::ImVec4* cpu_fine_clip)
{
    self->RenderChar(draw_list, size, ::ImVec2(pos_x, pos_y), col, c, cpu_fine_clip);
}

void ImFont_RenderTextXYXYZW(::ImFont* self, ::ImDrawList* draw_list, float size, float pos_x, float pos_y, unsigned int col, float clip_rect_x, float clip_rect_y, float clip_rect_z, float clip_rect_w, const char* text_begin, const char* text_end, float wrap_width, ::ImDrawTextFlags flags)
{
    self->RenderText(draw_list, size, ::ImVec2(pos_x, pos_y), col, ::ImVec4(clip_rect_x, clip_rect_y, clip_rect_z, clip_rect_w), text_begin, text_end, wrap_width, flags);
}

void ImGui_ImageImVec4TRXYXYZW(::ImTextureRef* tex_ref, float image_size_x, float image_size_y, float uv0_x, float uv0_y, float uv1_x, float uv1_y, float tint_col_x, float tint_col_y, float tint_col_z, float tint_col_w, float border_col_x, float border_col_y, float border_col_z, float border_col_w)
{
    ::ImGui::Image(*tex_ref, ::ImVec2(image_size_x, image_size_y), ::ImVec2(uv0_x, uv0_y), ::ImVec2(uv1_x, uv1_y), ::ImVec4(tint_col_x, tint_col_y, tint_col_z, tint_col_w), ::ImVec4(border_col_x, border_col_y, border_col_z, border_col_w));
}

bool ImGui_BeginChildFrameExXY(::ImGuiID id, float size_x, float size_y, ::ImGuiWindowFlags window_flags)
{
    return ::ImGui::BeginChildFrame(id, ::ImVec2(size_x, size_y), window_flags);
}

} // extern "C"

#include "imgui.h"
#include "imgui_internal.h"

#include <stdio.h>
#include <stdint.h>
#include <stddef.h>

// Wrap this in a namespace to keep it separate from the C++ API
namespace cimgui
{
#include "dcimgui.h"
}

extern "C" {
void ImGui_SetNextWindowPosXY(float x, float y, int cond, float px, float py)
{
    ::ImGui::SetNextWindowPos(::ImVec2(x, y), (::ImGuiCond)cond, ::ImVec2(px, py));
}

void ImGui_SetNextWindowSizeXY(float w, float h, int cond)
{
    ::ImGui::SetNextWindowSize(::ImVec2(w, h), (::ImGuiCond)cond);
}

bool ImGui_BeginChildXY(const char* str_id, float w, float h, int child_flags, int window_flags)
{
    return ::ImGui::BeginChild(str_id, ::ImVec2(w, h), (::ImGuiChildFlags)child_flags, (::ImGuiWindowFlags)window_flags);
}

bool ImGui_ButtonXY(const char* label, float w, float h)
{
    return ::ImGui::Button(label, ::ImVec2(w, h));
}

bool ImGui_BeginListBoxXY(const char* label, float w, float h)
{
    return ::ImGui::BeginListBox(label, ::ImVec2(w, h));
}

bool ImGui_SelectableXY(const char* label, bool selected, int flags, float w, float h)
{
    return ::ImGui::Selectable(label, selected, (::ImGuiSelectableFlags)flags, ::ImVec2(w, h));
}

bool ImGui_ColorButtonXY(const char* desc_id, float r, float g, float b, float a, int flags, float w, float h)
{
    return ::ImGui::ColorButton(desc_id, ::ImVec4(r, g, b, a), (::ImGuiColorEditFlags)flags, ::ImVec2(w, h));
}

void ImGui_PushStyleVarXY(int idx, float x, float y)
{
    ::ImGui::PushStyleVar((::ImGuiStyleVar)idx, ::ImVec2(x, y));
}

void ImGui_PushStyleColorXYZW(int idx, float r, float g, float b, float a)
{
    ::ImGui::PushStyleColor(idx, ::ImVec4(r, g, b, a));
}

void ImGui_RendererInit(float display_w, float display_h, float scale)
{
    auto& io = ::ImGui::GetIO();
    io.DisplaySize = ::ImVec2(display_w / scale, display_h / scale);
    io.DisplayFramebufferScale = ::ImVec2(scale, scale);
    io.DeltaTime = 1.0f / 60.0f;
}

const unsigned char* ImGui_GetFontTexData(int* out_width, int* out_height)
{
    unsigned char* pixels = nullptr;
    ::ImGui::GetIO().Fonts->GetTexDataAsRGBA32(&pixels, out_width, out_height, nullptr);
    return pixels;
}

void ImGui_SetFontTexID(uint64_t tex_id)
{
    ::ImGui::GetIO().Fonts->SetTexID((ImTextureID)tex_id);
}

void ImGui_SetFrameInfo(float display_w, float display_h, float delta_t)
{
    auto& io = ::ImGui::GetIO();
    io.DisplaySize = ::ImVec2(display_w, display_h);
    io.DeltaTime = (delta_t > 0.0f) ? delta_t : 0.0001f;
}

void ImGui_IOAddMousePosEvent(float x, float y)
{ ::ImGui::GetIO().AddMousePosEvent(x, y); }

void ImGui_IOAddMouseButtonEvent(int button, bool down)
{ ::ImGui::GetIO().AddMouseButtonEvent(button, down); }

void ImGui_IOAddMouseWheelEvent(float dx, float dy)
{ ::ImGui::GetIO().AddMouseWheelEvent(dx, dy); }

void ImGui_IOAddInputCharacter(unsigned int c)
{ ::ImGui::GetIO().AddInputCharacter(c); }

void ImGui_IOAddKeyEvent(int key, bool down)
{ ::ImGui::GetIO().AddKeyEvent((::ImGuiKey)key, down); }

int ImDrawData_GetCmdListCount(void* draw_data)
{ return ((ImDrawData*)draw_data)->CmdLists.Size; }

void ImDrawData_GetDisplayInfo(void* draw_data,
    float* display_x, float* display_y,
    float* display_w, float* display_h,
    float* fb_scale_x, float* fb_scale_y)
{
    auto* dd = (ImDrawData*)draw_data;
    *display_x  = dd->DisplayPos.x;
    *display_y  = dd->DisplayPos.y;
    *display_w  = dd->DisplaySize.x;
    *display_h  = dd->DisplaySize.y;
    *fb_scale_x = dd->FramebufferScale.x;
    *fb_scale_y = dd->FramebufferScale.y;
}

void* ImDrawData_GetCmdList(void* draw_data, int idx)
{ return ((ImDrawData*)draw_data)->CmdLists[idx]; }

void ImDrawList_GetVtxBuffer(void* draw_list, const void** out_data, int* out_count)
{
    auto* dl = (ImDrawList*)draw_list;
    *out_data  = dl->VtxBuffer.Data;
    *out_count = dl->VtxBuffer.Size;
}

void ImDrawList_GetIdxBuffer(void* draw_list, const void** out_data, int* out_count)
{
    auto* dl = (ImDrawList*)draw_list;
    *out_data  = dl->IdxBuffer.Data;
    *out_count = dl->IdxBuffer.Size;
}

int ImDrawList_GetCmdCount(void* draw_list)
{ return ((ImDrawList*)draw_list)->CmdBuffer.Size; }

// Returns 1 if this is a draw-elements command, 0 if a user callback.
int ImDrawList_GetCmd(void* draw_list, int cmd_idx,
    float* clip_x1, float* clip_y1, float* clip_x2, float* clip_y2,
    uint64_t* tex_id,
    unsigned int* vtx_offset, unsigned int* idx_offset,
    unsigned int* elem_count)
{
    auto& cmd = ((ImDrawList*)draw_list)->CmdBuffer[cmd_idx];
    *clip_x1    = cmd.ClipRect.x;
    *clip_y1    = cmd.ClipRect.y;
    *clip_x2    = cmd.ClipRect.z;
    *clip_y2    = cmd.ClipRect.w;
    *tex_id     = (uint64_t)cmd.GetTexID();
    *vtx_offset = cmd.VtxOffset;
    *idx_offset = cmd.IdxOffset;
    *elem_count = cmd.ElemCount;
    return (cmd.UserCallback == nullptr) ? 1 : 0;
}
    
} // extern "C"
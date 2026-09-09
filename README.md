# cl-dear-imgui

Common Lisp CFFI + ECL bindings for [Dear ImGui](https://github.com/ocornut/imgui) using [dear_bindings](https://github.com/dearimgui/dear_bindings). This project provides automatically generated bindings for Dear ImGui. The bindings are generated from the `dcimgui.json` metadata file produced by the dear_bindings Python tool. 

## Clone

`imgui/` and `dear_bindings/` are git submodules, pinned to the revisions the
committed `dcimgui.*` bindings were generated against.

```bash
git clone --recursive https://github.com/takeiteasy/cl-dear-imgui
# or, in an existing checkout:
git submodule update --init
```

## Build 

```bash
make                  # native platform (libdcimgui.dylib on macOS, libdcimgui.so on Linux)
make linux            # cross-build Linux x86_64 → libdcimgui-linux-x86_64.so
make windows          # cross-build Windows x86_64 → dcimgui-windows-x86_64.dll
make macos-universal  # fat arm64+x86_64 dylib → libdcimgui-universal.dylib (macOS host only)
make all              # all of the above
make clean
```

Cross-compiler requirements:
- **Linux target:** `brew install FiloSottile/musl-cross/musl-cross` (macOS) or `apt install g++-x86-64-linux-gnu` (Linux). Override with `LINUX_CXX=…`
- **Windows target:** `brew install mingw-w64` (macOS) or `apt install g++-mingw-w64-x86-64` (Linux). Override with `WIN_CXX=…`
- **macOS universal:** uses `clang++ -target` + `lipo`; requires Xcode (not just Command Line Tools) so that `xcrun --sdk macosx` resolves a full SDK.

## Common Lisp Bindings

```lisp
;; Load the generator
(ql:quickload :cl-dear-imgui/generator)

;; Generate bindings
(cl-dear-imgui/generator:generate-bindings
  "dcimgui.json"
  "package.lisp"
  "bindings.lisp")
```

This creates:
- `package.lisp` - Package definition with all exports
- `bindings.lisp` - FFI bindings (constants, enums, types, structs, functions)
- `abi_shim_generated.cpp` - Auto-generated C++ shims for functions that pass structs by value (ARM64 ABI)
- `shim.lisp` - FFI bindings for the generated shims

The generator detects functions that pass `ImVec2`, `ImVec4`, or `ImTextureRef` by value (which CFFI cannot handle correctly on ARM64) and automatically generates C++ shims that expand them to individual scalar arguments. These shims are bound under the original function's Lisp name, so callers see no difference.

## Naming Conventions

The generator creates idiomatic Lisp names by:

1. **Stripping redundant prefixes**:
   - `ImGui_` → removed (functions)
   - `ImGui` → removed (types and structs)
   - `Im` → removed (types like `ImVec2` → `vec2`)
   - `IMGUI_` → removed (constants)

2. **Converting CamelCase to kebab-case**:
   - `WindowFlags` → `window-flags`
   - `GetIO` → `get-io`
   - `SetNextWindowPos` → `set-next-window-pos`
   - `TableSortSpecs` → `table-sort-specs`

3. **Enum type names are prefixed with `im-`** to avoid namespace collisions:
   - `ImGuiCol_` → `im-col`
   - `ImGuiWindowFlags_` → `im-window-flags`
   - `ImGuiTableFlags_` → `im-table-flags`

4. **Simplifying enum elements** — the enum type prefix is stripped:
   - `ImGuiWindowFlags_None` → `:window-flags-none`
   - `ImGuiCol_Text` → `:col-text`

5. **ARM64 ABI shims** — functions that pass `ImVec2`/`ImVec4`/`ImTextureRef` by value are excluded from `bindings.lisp` and replaced by auto-generated shims. The shims expand struct arguments to individual floats and are exported under the **original function name**, so call sites are unaffected:
   ```lisp
   ;; Calls ImGui_SetNextWindowPosExXY under the hood — transparent to callers
   (set-next-window-pos-ex 100.0 200.0 0 0.0 0.0)
   ```

## License

MIT License (same as Dear ImGui)

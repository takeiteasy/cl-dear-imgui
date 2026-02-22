# cl-dear-imgui

Common Lisp CFFI bindings for [Dear ImGui](https://github.com/ocornut/imgui) using [dear_bindings](https://github.com/dearimgui/dear_bindings). This project provides automatically generated CFFI bindings for Dear ImGui. The bindings are generated from the `dcimgui.json` metadata file produced by the dear_bindings Python tool.

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
- `bindings.lisp` - CFFI bindings (constants, enums, types, structs, functions)

### Usage 

```lisp
;; Load cl-dear-imgui
(ql:quickload :cl-dear-imgui)

;; Initialize ImGui (wrapper style)
(initialize)

;; Use with-window macro for automatic cleanup
(with-window ("Hello, Dear ImGui!")
  (text "This is working!")
  (when (button "Click me!" 120 0)
    (format t "Button clicked!~%")))

;; Or use raw CFFI bindings
(new-frame)
(when (begin "Manual Window" (cffi:null-pointer) :none)
  (text "Using raw bindings")
  (end))
(render)

;; Cleanup
(shutdown)
```

## CLOS Wrapper API

The library includes a high-level CLOS wrapper that makes ImGui much easier to use in Common Lisp.

### Vector and Color Classes

```lisp
;; Create vectors
(defparameter *pos* (make-vec2 100.0 200.0))
(defparameter *color* (make-color 1.0 0.0 0.0 1.0)) ; RGBA

;; Predefined colors
*color-red*
*color-green*
*color-blue*

;; Create colors from RGB (0-255)
(rgb 255 0 0) ; Red

;; Create colors from hex
(hex-color #xFF0000) ; Red
```

### Convenience Macros

```lisp
;; Automatic window management
(with-window ("My Window" :flags :no-resize)
  (text "Content here"))

;; Style customization
(with-style-color (:button *color-red*)
  (button "Red Button" 0 0))

;; Menu bars
(with-main-menu-bar ()
  (with-menu ("File")
    (when (menu-item "Open" "" nil t)
      (format t "Open clicked~%"))))

;; Tree nodes
(with-tree-node ("Node" :flags :default-open)
  (text "Child content"))
```

### Simplified Input Widgets

The wrapper provides simplified versions that return values directly:

```lisp
;; Instead of managing foreign memory manually:
(setf my-value (slider-float-simple "Volume" my-value 0.0 1.0))
(setf my-int (input-int-simple "Count" my-int))
(setf checked (checkbox-simple "Enable" checked))
(setf my-color (color-edit-simple "Color" my-color))
```

### Context Management

```lisp
;; Automatic context lifecycle
(with-context ()
  ;; Your ImGui code here
  (new-frame)
  ;; ...
  )

;; Or manual management
(initialize)
;; ... use ImGui ...
(shutdown)
```

## Naming Conventions

The generator creates idiomatic Lisp names by:

1. **Stripping redundant prefixes**:
   - `ImGui_` → removed (functions)
   - `ImGui` → removed (types)
   - `Im` → removed (types like `ImVec2` → `vec2`)
   - `IMGUI_` → removed (constants)

2. **Converting CamelCase to kebab-case**:
   - `WindowFlags` → `window-flags`
   - `GetIO` → `get-io`
   - `SetNextWindowPos` → `set-next-window-pos`

3. **Simplifying enum elements**:
   - `ImGuiWindowFlags_None` → `:none`
   - `ImGuiCol_Text` → `:text`
   - Enum type prefix is stripped from elements

## License

MIT License (same as Dear ImGui)

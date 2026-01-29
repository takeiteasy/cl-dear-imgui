# cl-dear-imgui

Common Lisp CFFI bindings for [Dear ImGui](https://github.com/ocornut/imgui) using [dear_bindings](https://github.com/dearimgui/dear_bindings).

## Overview

This project provides automatically generated CFFI bindings for Dear ImGui. The bindings are generated from the `dcimgui.json` metadata file produced by the dear_bindings Python tool.

## Prerequisites

### Required Software

1. **Common Lisp** - Any modern CL implementation (SBCL, CCL, etc.)
2. **Quicklisp** - For package management
3. **Python 3.10+** - To run dear_bindings generator
4. **Dear ImGui source code** - Download from https://github.com/ocornut/imgui
5. **C++ compiler** - To compile the dcimgui shared library

### Required Libraries

**Runtime:**
- CFFI - `(ql:quickload :cffi)`

**Build-time (for generator):**
- com.inuoe.jzon - `(ql:quickload :com.inuoe.jzon)`

## Quick Start

### Step 1: Clone Dear ImGui

```bash
cd /Users/george/quicklisp/local-projects/
git clone https://github.com/ocornut/imgui.git
```

### Step 2: Install dear_bindings Dependencies

```bash
cd cl-dear-imgui/dear_bindings
pip install -r requirements.txt
```

### Step 3: Generate dcimgui Files

```bash
cd /Users/george/quicklisp/local-projects/cl-dear-imgui
python dear_bindings/dear_bindings.py -o dcimgui ../imgui/imgui.h
```

This creates:
- `dcimgui.h` - C API header
- `dcimgui.cpp` - C API implementation
- `dcimgui.json` - Metadata file (input for our generator)

### Step 4: Compile dcimgui Shared Library

**macOS:**
```bash
clang++ -shared -fPIC -I../imgui \
    dcimgui.cpp \
    ../imgui/imgui.cpp \
    ../imgui/imgui_draw.cpp \
    ../imgui/imgui_tables.cpp \
    ../imgui/imgui_widgets.cpp \
    ../imgui/imgui_demo.cpp \
    -o libdcimgui.dylib
```

**Linux:**
```bash
g++ -shared -fPIC -I../imgui \
    dcimgui.cpp \
    ../imgui/imgui.cpp \
    ../imgui/imgui_draw.cpp \
    ../imgui/imgui_tables.cpp \
    ../imgui/imgui_widgets.cpp \
    ../imgui/imgui_demo.cpp \
    -o libdcimgui.so
```

**Windows:**
```cmd
cl /LD /I..\imgui ^
    dcimgui.cpp ^
    ..\imgui\imgui.cpp ^
    ..\imgui\imgui_draw.cpp ^
    ..\imgui\imgui_tables.cpp ^
    ..\imgui\imgui_widgets.cpp ^
    ..\imgui\imgui_demo.cpp ^
    /Fe:dcimgui.dll
```

### Step 5: Generate Common Lisp Bindings

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

### Step 6: Use the Bindings

```lisp
;; Load cl-dear-imgui
(ql:quickload :cl-dear-imgui)

;; Initialize ImGui (wrapper style)
(cl-dear-imgui:initialize)

;; Use with-window macro for automatic cleanup
(cl-dear-imgui:with-window ("Hello, Dear ImGui!")
  (cl-dear-imgui:text "This is working!")
  (when (cl-dear-imgui:button "Click me!" 120 0)
    (format t "Button clicked!~%")))

;; Or use raw CFFI bindings
(cl-dear-imgui:new-frame)
(when (cl-dear-imgui:begin "Manual Window" (cffi:null-pointer) :none)
  (cl-dear-imgui:text "Using raw bindings")
  (cl-dear-imgui:end))
(cl-dear-imgui:render)

;; Cleanup
(cl-dear-imgui:shutdown)
```

## CLOS Wrapper API

The library includes a high-level CLOS wrapper that makes ImGui much easier to use in Common Lisp.

### Vector and Color Classes

```lisp
;; Create vectors
(defparameter *pos* (cl-dear-imgui:make-vec2 100.0 200.0))
(defparameter *color* (cl-dear-imgui:make-color 1.0 0.0 0.0 1.0)) ; RGBA

;; Predefined colors
cl-dear-imgui:*color-red*
cl-dear-imgui:*color-green*
cl-dear-imgui:*color-blue*

;; Create colors from RGB (0-255)
(cl-dear-imgui:rgb 255 0 0) ; Red

;; Create colors from hex
(cl-dear-imgui:hex-color #xFF0000) ; Red
```

### Convenience Macros

```lisp
;; Automatic window management
(cl-dear-imgui:with-window ("My Window" :flags :no-resize)
  (cl-dear-imgui:text "Content here"))

;; Style customization
(cl-dear-imgui:with-style-color (:button cl-dear-imgui:*color-red*)
  (cl-dear-imgui:button "Red Button" 0 0))

;; Menu bars
(cl-dear-imgui:with-main-menu-bar ()
  (cl-dear-imgui:with-menu ("File")
    (when (cl-dear-imgui:menu-item "Open" "" nil t)
      (format t "Open clicked~%"))))

;; Tree nodes
(cl-dear-imgui:with-tree-node ("Node" :flags :default-open)
  (cl-dear-imgui:text "Child content"))
```

### Simplified Input Widgets

The wrapper provides simplified versions that return values directly:

```lisp
;; Instead of managing foreign memory manually:
(setf my-value (cl-dear-imgui:slider-float-simple "Volume" my-value 0.0 1.0))
(setf my-int (cl-dear-imgui:input-int-simple "Count" my-int))
(setf checked (cl-dear-imgui:checkbox-simple "Enable" checked))
(setf my-color (cl-dear-imgui:color-edit-simple "Color" my-color))
```

### Context Management

```lisp
;; Automatic context lifecycle
(cl-dear-imgui:with-context ()
  ;; Your ImGui code here
  (cl-dear-imgui:new-frame)
  ;; ...
  )

;; Or manual management
(cl-dear-imgui:initialize)
;; ... use ImGui ...
(cl-dear-imgui:shutdown)
```

### Complete Example

See `example.lisp` for complete working examples including:
- Basic widgets (buttons, sliders, checkboxes, text inputs)
- Menu bars and popups
- Tree nodes and tables
- Custom styling and colors
- Vector and color utilities

Load and run with:
```lisp
(load "example.lisp")
(cl-dear-imgui-example:run-all-examples)
```

## Project Structure

```
cl-dear-imgui/
├── README.md                   # This file
├── cl-dear-imgui.asd               # ASDF system definition
├── generator.lisp             # Standalone bindings generator
├── package.lisp               # Generated package definition
├── bindings.lisp              # Generated CFFI bindings
├── wrapper.lisp               # CLOS wrapper and utilities
├── example.lisp               # Usage examples
├── cl-dear-imgui.lisp              # Your code here
├── dcimgui.json               # Generated by dear_bindings
├── dcimgui.h                  # Generated C header
├── dcimgui.cpp                # Generated C implementation
├── libdcimgui.dylib           # Compiled shared library (platform-specific)
└── dear_bindings/             # Submodule (Python generator)
    ├── dear_bindings.py
    └── docs/
        └── MetadataFormat.md  # JSON format documentation
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

### Examples

| C API | Common Lisp |
|-------|-------------|
| `ImGui_Begin()` | `(cl-dear-imgui:begin ...)` |
| `ImGui_GetIO()` | `(cl-dear-imgui:get-io)` |
| `ImGuiWindowFlags` | `cl-dear-imgui:window-flags` |
| `ImGuiWindowFlags_None` | `:none` |
| `ImGuiCol_Text` | `:text` |
| `ImVec2` | `cl-dear-imgui:vec2` |
| `IMGUI_VERSION` | `cl-dear-imgui:+version+` |

This makes the API feel natural in Common Lisp:
```lisp
(when (cl-dear-imgui:begin "Window" nil :none)
  (cl-dear-imgui:text "Hello!")
  (cl-dear-imgui:end))
```

Instead of the verbose:
```lisp
(when (cl-dear-imgui:imgui-begin "Window" nil :imgui-window-flags-none)
  (cl-dear-imgui:imgui-text "Hello!")
  (cl-dear-imgui:imgui-end))
```

## Generator Details

The `generator.lisp` file is a standalone Common Lisp program that:

1. **Parses dcimgui.json** using the jzon library
2. **Maps C types to CFFI types**:
   - `int`, `float`, etc. → `:int`, `:float`
   - `char*` → `:string`
   - Other pointers → `:pointer`
   - Arrays → `(:array type size)` or `:pointer`
   - User types → keyword symbols
3. **Generates package.lisp** with package definition and exports
4. **Generates bindings.lisp** with:
   - Library definition (`define-foreign-library`)
   - Constants from `#define` values
   - Enumerations (`defcenum`)
   - Type definitions (`defctype`)
   - Structures (`defcstruct`/`defcunion`)
   - Functions (`defcfun`)

### Type Mapping Examples

| C Type | CFFI Type |
|--------|-----------|
| `void` | `:void` |
| `int` | `:int` |
| `float` | `:float` |
| `char*` | `:string` |
| `ImGuiContext*` | `:pointer` |
| `float[4]` | `(:array :float 4)` |
| Function pointers | `:pointer` |

### Special Cases

- **Default argument helpers** - Skipped (CL has keyword arguments)
- **Anonymous structs** - Generated with synthetic names
- **Flags enums** - Marked with comment (combine with `logior`)
- **Comments** - Preserved from original ImGui source
- **Preprocessor conditionals** - Documented in comments

## Regenerating Bindings

To regenerate bindings after updating Dear ImGui:

1. Pull latest Dear ImGui: `cd ../imgui && git pull`
2. Regenerate dcimgui files: `python dear_bindings/dear_bindings.py -o dcimgui ../imgui/imgui.h`
3. Recompile shared library
4. Regenerate Lisp bindings: `(cl-dear-imgui/generator:generate-bindings ...)`
5. Reload: `(ql:quickload :cl-dear-imgui :force t)`

## Advanced Usage

### Including imgui_internal.h

To generate bindings for internal functions:

```bash
python dear_bindings/dear_bindings.py \
    -o dcimgui_internal \
    --include ../imgui/imgui.h \
    ../imgui/imgui_internal.h
```

Then generate separate bindings or extend the current ones.

### Custom Library Path

If your dcimgui library is in a different location, you can modify the `define-foreign-library` form in `bindings.lisp`:

```lisp
(define-foreign-library dcimgui
  (:darwin "/custom/path/libdcimgui.dylib")
  (:unix "/custom/path/libdcimgui.so")
  (:windows "C:\\custom\\path\\dcimgui.dll")
  (t (:default "libdcimgui")))
```

## Troubleshooting

### Library Not Found

If you get "Unable to load foreign library (DCIMGUI)", ensure:
1. The shared library is compiled and in the correct location
2. Library search paths are correct (use `cffi:*foreign-library-directories*`)
3. Library filename matches your platform

### Type Mismatches

If you encounter type errors:
1. Check the type mapping in `generator.lisp`
2. Regenerate bindings with updated mappings
3. File an issue if a specific type is incorrectly mapped

### Missing Functions

Some functions may be filtered:
- Functions with `is_default_argument_helper: true` are skipped
- Check `dcimgui.json` to verify the function exists
- Ensure the function is not in `imgui_internal.h` (use separate generation)

## Contributing

Contributions are welcome! Please:
1. Test your changes
2. Update documentation
3. Submit a pull request

## License

MIT License (same as Dear ImGui)

## Resources

- [Dear ImGui](https://github.com/ocornut/imgui) - The underlying C++ library
- [dear_bindings](https://github.com/dearimgui/dear_bindings) - C bindings generator
- [CFFI User Manual](https://cffi.common-lisp.dev/manual/cffi-manual.html) - Common Foreign Function Interface
- [Metadata Format](dear_bindings/docs/MetadataFormat.md) - JSON format documentation

## Credits

- Dear ImGui by Omar Cornut and contributors
- dear_bindings by Ben Carter
- cl-dear-imgui CFFI bindings generator

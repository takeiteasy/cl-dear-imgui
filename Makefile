# Makefile for cl-dear-imgui
# Builds imgui + dcimgui + abi_shim into a shared library.
#
# Targets:
#   make                  – build for the native host
#   make linux            – cross-build Linux x86_64 .so
#   make windows          – cross-build Windows x86_64 .dll  (requires mingw-w64)
#   make macos-universal  – fat arm64+x86_64 .dylib          (macOS host only)
#   make all              – all of the above
#   make clean
#
#   Cross-compiler requirements:
#   - Linux: brew install FiloSottile/musl-cross/musl-cross (or apt install g++-x86-64-linux-gnu). Override with LINUX_CXX=...
#   - Windows: brew install mingw-w64 (or apt install g++-mingw-w64-x86-64). Override with WIN_CXX=...
#   - macOS universal: uses clang++ -target + lipo, no extra tools needed

IMGUI_DIR  := imgui
IMGUI_SRCS := $(IMGUI_DIR)/imgui.cpp \
              $(IMGUI_DIR)/imgui_draw.cpp \
              $(IMGUI_DIR)/imgui_tables.cpp \
              $(IMGUI_DIR)/imgui_widgets.cpp \
              $(IMGUI_DIR)/imgui_demo.cpp
LOCAL_SRCS := dcimgui.cpp abi_shim.cpp abi_shim_generated.cpp
SRCS       := $(IMGUI_SRCS) $(LOCAL_SRCS)

CXXFLAGS   := -std=c++17 -O2 -fPIC -I$(IMGUI_DIR)

# ── Native ─────────────────────────────────────────────────────────────────────

UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
  NATIVE_CXX     := clang++
  NATIVE_OUT     := libdcimgui.dylib
  NATIVE_LDFLAGS := -dynamiclib
else
  NATIVE_CXX     := g++
  NATIVE_OUT     := libdcimgui.so
  NATIVE_LDFLAGS := -shared
endif

# ── Linux x86_64 cross ────────────────────────────────────────────────────────
# Install toolchain:  brew install FiloSottile/musl-cross/musl-cross
#                 or: apt install g++-x86-64-linux-gnu

LINUX_CXX      ?= x86_64-linux-musl-g++
LINUX_OUT      := libdcimgui-linux-x86_64.so
LINUX_LDFLAGS  := -shared

# ── Windows x86_64 cross ──────────────────────────────────────────────────────
# Install toolchain:  brew install mingw-w64
#                 or: apt install g++-mingw-w64-x86-64

WIN_CXX        ?= x86_64-w64-mingw32-g++
WIN_OUT        := dcimgui-windows-x86_64.dll
WIN_LDFLAGS    := -shared -static-libgcc -static-libstdc++

# ── macOS universal (arm64 + x86_64) ─────────────────────────────────────────
# -isysroot is required when using -target so clang can find system headers.

MACOS_SDK           := $(shell xcrun --sdk macosx --show-sdk-path)
MACOS_UNIVERSAL_OUT := libdcimgui-universal.dylib

# ── Object file lists ─────────────────────────────────────────────────────────

native_objs  := $(patsubst %.cpp, build/native/%.o,  $(SRCS))
linux_objs   := $(patsubst %.cpp, build/linux/%.o,   $(SRCS))
windows_objs := $(patsubst %.cpp, build/windows/%.o, $(SRCS))
arm64_objs   := $(patsubst %.cpp, build/arm64/%.o,   $(SRCS))
x86_64_objs  := $(patsubst %.cpp, build/x86_64/%.o,  $(SRCS))

# ── Top-level targets ─────────────────────────────────────────────────────────

.PHONY: all native linux windows macos-universal clean

all: native linux windows macos-universal

native: $(NATIVE_OUT)

linux: $(LINUX_OUT)

windows: $(WIN_OUT)

macos-universal: $(MACOS_UNIVERSAL_OUT)

# ── Link rules ────────────────────────────────────────────────────────────────

$(NATIVE_OUT): $(native_objs)
	$(NATIVE_CXX) $(NATIVE_LDFLAGS) -o $@ $^

$(LINUX_OUT): $(linux_objs)
	$(LINUX_CXX) $(LINUX_LDFLAGS) -o $@ $^

$(WIN_OUT): $(windows_objs)
	$(WIN_CXX) $(WIN_LDFLAGS) -o $@ $^

$(MACOS_UNIVERSAL_OUT): \
    build/arm64/libdcimgui.dylib \
    build/x86_64/libdcimgui.dylib
	lipo -create -output $@ $^

build/arm64/libdcimgui.dylib: $(arm64_objs)
	clang++ -dynamiclib -target arm64-apple-macos11 -isysroot $(MACOS_SDK) -o $@ $^

build/x86_64/libdcimgui.dylib: $(x86_64_objs)
	clang++ -dynamiclib -target x86_64-apple-macos10.14 -isysroot $(MACOS_SDK) -o $@ $^

# ── Compile rules ─────────────────────────────────────────────────────────────

build/native/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(NATIVE_CXX) $(CXXFLAGS) -c -o $@ $<

build/linux/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(LINUX_CXX) $(CXXFLAGS) -c -o $@ $<

build/windows/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(WIN_CXX) $(CXXFLAGS) -c -o $@ $<

build/arm64/%.o: %.cpp
	@mkdir -p $(dir $@)
	clang++ $(CXXFLAGS) -target arm64-apple-macos11 -isysroot $(MACOS_SDK) -c -o $@ $<

build/x86_64/%.o: %.cpp
	@mkdir -p $(dir $@)
	clang++ $(CXXFLAGS) -target x86_64-apple-macos10.14 -isysroot $(MACOS_SDK) -c -o $@ $<

# ── Clean ─────────────────────────────────────────────────────────────────────

clean:
	rm -rf build \
	       $(NATIVE_OUT) \
	       $(LINUX_OUT) \
	       $(WIN_OUT) \
	       $(MACOS_UNIVERSAL_OUT)

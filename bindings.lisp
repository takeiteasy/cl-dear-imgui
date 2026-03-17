;;;; bindings.lisp
;;;; Auto-generated CFFI bindings for Dear ImGui
;;;; Generated from dcimgui.json

(in-package #:cl-dear-imgui)

#-ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew (asdf:system-relative-pathname :cl-dear-imgui "./")
           cffi:*foreign-library-directories*
           :test #'equal))

#-ecl
(define-foreign-library dcimgui
  (:darwin "libdcimgui.dylib")
  (:unix "libdcimgui.so")
  (:windows "dcimgui.dll")
  (t (:default "libdcimgui")))

#-ecl
(use-foreign-library dcimgui)

#+ecl
(ffi:clines "#include \"dcimgui.h\"")

#+ecl
(progn
  #+darwin (ffi:load-foreign-object "libdcimgui.dylib")
  #+(and unix (not darwin)) (ffi:load-foreign-object "libdcimgui.so")
  #+windows (ffi:load-foreign-object "dcimgui.dll"))

;;; ============================================================================
;;; Constants from #defines
;;; ============================================================================

(defparameter +version+ "1.92.6 WIP")

(defparameter +version-num+ 19257)

(defparameter +payload-type-color-3f+ "_COL3F")

(defparameter +payload-type-color-4f+ "_COL4F")

(defparameter +im-unicode-codepoint-invalid+ #xFFFD)

(defparameter +im-unicode-codepoint-max+ #x10FFFF)

(defparameter +im-unicode-codepoint-max+ #xFFFF)

(defparameter +im-col32-r-shift+ 16)

(defparameter +im-col32-g-shift+ 8)

(defparameter +im-col32-b-shift+ 0)

(defparameter +im-col32-a-shift+ 24)

(defparameter +im-col32-a-mask+ #xFF000000)

(defparameter +im-col32-r-shift+ 0)

(defparameter +im-col32-g-shift+ 8)

(defparameter +im-col32-b-shift+ 16)

(defparameter +im-col32-a-shift+ 24)

(defparameter +im-col32-a-mask+ #xFF000000)

(defparameter +im-drawlist-tex-lines-width-max+ 32)

(defparameter +font-atlas-rect-id-invalid+ -1)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-window-flags
  (:window-flags-none 0)
  (:window-flags-no-title-bar 1)
  (:window-flags-no-resize 2)
  (:window-flags-no-move 4)
  (:window-flags-no-scrollbar 8)
  (:window-flags-no-scroll-with-mouse 16)
  (:window-flags-no-collapse 32)
  (:window-flags-always-auto-resize 64)
  (:window-flags-no-background 128)
  (:window-flags-no-saved-settings 256)
  (:window-flags-no-mouse-inputs 512)
  (:window-flags-menu-bar 1024)
  (:window-flags-horizontal-scrollbar 2048)
  (:window-flags-no-focus-on-appearing 4096)
  (:window-flags-no-bring-to-front-on-focus 8192)
  (:window-flags-always-vertical-scrollbar 16384)
  (:window-flags-always-horizontal-scrollbar 32768)
  (:window-flags-no-nav-inputs 65536)
  (:window-flags-no-nav-focus 131072)
  (:window-flags-unsaved-document 262144)
  (:window-flags-no-nav 196608)
  (:window-flags-no-decoration 43)
  (:window-flags-no-inputs 197120)
  (:window-flags-child-window 16777216)
  (:window-flags-tooltip 33554432)
  (:window-flags-popup 67108864)
  (:window-flags-modal 134217728)
  (:window-flags-child-menu 268435456)
)

#+ecl
(progn
  (defconstant +im-window-flags-window-flags-none+ 0)
  (defconstant +im-window-flags-window-flags-no-title-bar+ 1)
  (defconstant +im-window-flags-window-flags-no-resize+ 2)
  (defconstant +im-window-flags-window-flags-no-move+ 4)
  (defconstant +im-window-flags-window-flags-no-scrollbar+ 8)
  (defconstant +im-window-flags-window-flags-no-scroll-with-mouse+ 16)
  (defconstant +im-window-flags-window-flags-no-collapse+ 32)
  (defconstant +im-window-flags-window-flags-always-auto-resize+ 64)
  (defconstant +im-window-flags-window-flags-no-background+ 128)
  (defconstant +im-window-flags-window-flags-no-saved-settings+ 256)
  (defconstant +im-window-flags-window-flags-no-mouse-inputs+ 512)
  (defconstant +im-window-flags-window-flags-menu-bar+ 1024)
  (defconstant +im-window-flags-window-flags-horizontal-scrollbar+ 2048)
  (defconstant +im-window-flags-window-flags-no-focus-on-appearing+ 4096)
  (defconstant +im-window-flags-window-flags-no-bring-to-front-on-focus+ 8192)
  (defconstant +im-window-flags-window-flags-always-vertical-scrollbar+ 16384)
  (defconstant +im-window-flags-window-flags-always-horizontal-scrollbar+ 32768)
  (defconstant +im-window-flags-window-flags-no-nav-inputs+ 65536)
  (defconstant +im-window-flags-window-flags-no-nav-focus+ 131072)
  (defconstant +im-window-flags-window-flags-unsaved-document+ 262144)
  (defconstant +im-window-flags-window-flags-no-nav+ 196608)
  (defconstant +im-window-flags-window-flags-no-decoration+ 43)
  (defconstant +im-window-flags-window-flags-no-inputs+ 197120)
  (defconstant +im-window-flags-window-flags-child-window+ 16777216)
  (defconstant +im-window-flags-window-flags-tooltip+ 33554432)
  (defconstant +im-window-flags-window-flags-popup+ 67108864)
  (defconstant +im-window-flags-window-flags-modal+ 134217728)
  (defconstant +im-window-flags-window-flags-child-menu+ 268435456)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-child-flags
  (:child-flags-none 0)
  (:child-flags-borders 1)
  (:child-flags-always-use-window-padding 2)
  (:child-flags-resize-x 4)
  (:child-flags-resize-y 8)
  (:child-flags-auto-resize-x 16)
  (:child-flags-auto-resize-y 32)
  (:child-flags-always-auto-resize 64)
  (:child-flags-frame-style 128)
  (:child-flags-nav-flattened 256)
)

#+ecl
(progn
  (defconstant +im-child-flags-child-flags-none+ 0)
  (defconstant +im-child-flags-child-flags-borders+ 1)
  (defconstant +im-child-flags-child-flags-always-use-window-padding+ 2)
  (defconstant +im-child-flags-child-flags-resize-x+ 4)
  (defconstant +im-child-flags-child-flags-resize-y+ 8)
  (defconstant +im-child-flags-child-flags-auto-resize-x+ 16)
  (defconstant +im-child-flags-child-flags-auto-resize-y+ 32)
  (defconstant +im-child-flags-child-flags-always-auto-resize+ 64)
  (defconstant +im-child-flags-child-flags-frame-style+ 128)
  (defconstant +im-child-flags-child-flags-nav-flattened+ 256)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-item-flags
  (:item-flags-none 0)
  (:item-flags-no-tab-stop 1)
  (:item-flags-no-nav 2)
  (:item-flags-no-nav-default-focus 4)
  (:item-flags-button-repeat 8)
  (:item-flags-auto-close-popups 16)
  (:item-flags-allow-duplicate-id 32)
)

#+ecl
(progn
  (defconstant +im-item-flags-item-flags-none+ 0)
  (defconstant +im-item-flags-item-flags-no-tab-stop+ 1)
  (defconstant +im-item-flags-item-flags-no-nav+ 2)
  (defconstant +im-item-flags-item-flags-no-nav-default-focus+ 4)
  (defconstant +im-item-flags-item-flags-button-repeat+ 8)
  (defconstant +im-item-flags-item-flags-auto-close-popups+ 16)
  (defconstant +im-item-flags-item-flags-allow-duplicate-id+ 32)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-input-text-flags
  (:input-text-flags-none 0)
  (:input-text-flags-chars-decimal 1)
  (:input-text-flags-chars-hexadecimal 2)
  (:input-text-flags-chars-scientific 4)
  (:input-text-flags-chars-uppercase 8)
  (:input-text-flags-chars-no-blank 16)
  (:input-text-flags-allow-tab-input 32)
  (:input-text-flags-enter-returns-true 64)
  (:input-text-flags-escape-clears-all 128)
  (:input-text-flags-ctrl-enter-for-new-line 256)
  (:input-text-flags-read-only 512)
  (:input-text-flags-password 1024)
  (:input-text-flags-always-overwrite 2048)
  (:input-text-flags-auto-select-all 4096)
  (:input-text-flags-parse-empty-ref-val 8192)
  (:input-text-flags-display-empty-ref-val 16384)
  (:input-text-flags-no-horizontal-scroll 32768)
  (:input-text-flags-no-undo-redo 65536)
  (:input-text-flags-elide-left 131072)
  (:input-text-flags-callback-completion 262144)
  (:input-text-flags-callback-history 524288)
  (:input-text-flags-callback-always 1048576)
  (:input-text-flags-callback-char-filter 2097152)
  (:input-text-flags-callback-resize 4194304)
  (:input-text-flags-callback-edit 8388608)
  (:input-text-flags-word-wrap 16777216)
)

#+ecl
(progn
  (defconstant +im-input-text-flags-input-text-flags-none+ 0)
  (defconstant +im-input-text-flags-input-text-flags-chars-decimal+ 1)
  (defconstant +im-input-text-flags-input-text-flags-chars-hexadecimal+ 2)
  (defconstant +im-input-text-flags-input-text-flags-chars-scientific+ 4)
  (defconstant +im-input-text-flags-input-text-flags-chars-uppercase+ 8)
  (defconstant +im-input-text-flags-input-text-flags-chars-no-blank+ 16)
  (defconstant +im-input-text-flags-input-text-flags-allow-tab-input+ 32)
  (defconstant +im-input-text-flags-input-text-flags-enter-returns-true+ 64)
  (defconstant +im-input-text-flags-input-text-flags-escape-clears-all+ 128)
  (defconstant +im-input-text-flags-input-text-flags-ctrl-enter-for-new-line+ 256)
  (defconstant +im-input-text-flags-input-text-flags-read-only+ 512)
  (defconstant +im-input-text-flags-input-text-flags-password+ 1024)
  (defconstant +im-input-text-flags-input-text-flags-always-overwrite+ 2048)
  (defconstant +im-input-text-flags-input-text-flags-auto-select-all+ 4096)
  (defconstant +im-input-text-flags-input-text-flags-parse-empty-ref-val+ 8192)
  (defconstant +im-input-text-flags-input-text-flags-display-empty-ref-val+ 16384)
  (defconstant +im-input-text-flags-input-text-flags-no-horizontal-scroll+ 32768)
  (defconstant +im-input-text-flags-input-text-flags-no-undo-redo+ 65536)
  (defconstant +im-input-text-flags-input-text-flags-elide-left+ 131072)
  (defconstant +im-input-text-flags-input-text-flags-callback-completion+ 262144)
  (defconstant +im-input-text-flags-input-text-flags-callback-history+ 524288)
  (defconstant +im-input-text-flags-input-text-flags-callback-always+ 1048576)
  (defconstant +im-input-text-flags-input-text-flags-callback-char-filter+ 2097152)
  (defconstant +im-input-text-flags-input-text-flags-callback-resize+ 4194304)
  (defconstant +im-input-text-flags-input-text-flags-callback-edit+ 8388608)
  (defconstant +im-input-text-flags-input-text-flags-word-wrap+ 16777216)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-tree-node-flags
  (:tree-node-flags-none 0)
  (:tree-node-flags-selected 1)
  (:tree-node-flags-framed 2)
  (:tree-node-flags-allow-overlap 4)
  (:tree-node-flags-no-tree-push-on-open 8)
  (:tree-node-flags-no-auto-open-on-log 16)
  (:tree-node-flags-default-open 32)
  (:tree-node-flags-open-on-double-click 64)
  (:tree-node-flags-open-on-arrow 128)
  (:tree-node-flags-leaf 256)
  (:tree-node-flags-bullet 512)
  (:tree-node-flags-frame-padding 1024)
  (:tree-node-flags-span-avail-width 2048)
  (:tree-node-flags-span-full-width 4096)
  (:tree-node-flags-span-label-width 8192)
  (:tree-node-flags-span-all-columns 16384)
  (:tree-node-flags-label-span-all-columns 32768)
  (:tree-node-flags-nav-left-jumps-to-parent 131072)
  (:tree-node-flags-collapsing-header 26)
  (:tree-node-flags-draw-lines-none 262144)
  (:tree-node-flags-draw-lines-full 524288)
  (:tree-node-flags-draw-lines-to-nodes 1048576)
  (:tree-node-flags-nav-left-jumps-back-here 131072)
  (:tree-node-flags-span-text-width 8192)
)

#+ecl
(progn
  (defconstant +im-tree-node-flags-tree-node-flags-none+ 0)
  (defconstant +im-tree-node-flags-tree-node-flags-selected+ 1)
  (defconstant +im-tree-node-flags-tree-node-flags-framed+ 2)
  (defconstant +im-tree-node-flags-tree-node-flags-allow-overlap+ 4)
  (defconstant +im-tree-node-flags-tree-node-flags-no-tree-push-on-open+ 8)
  (defconstant +im-tree-node-flags-tree-node-flags-no-auto-open-on-log+ 16)
  (defconstant +im-tree-node-flags-tree-node-flags-default-open+ 32)
  (defconstant +im-tree-node-flags-tree-node-flags-open-on-double-click+ 64)
  (defconstant +im-tree-node-flags-tree-node-flags-open-on-arrow+ 128)
  (defconstant +im-tree-node-flags-tree-node-flags-leaf+ 256)
  (defconstant +im-tree-node-flags-tree-node-flags-bullet+ 512)
  (defconstant +im-tree-node-flags-tree-node-flags-frame-padding+ 1024)
  (defconstant +im-tree-node-flags-tree-node-flags-span-avail-width+ 2048)
  (defconstant +im-tree-node-flags-tree-node-flags-span-full-width+ 4096)
  (defconstant +im-tree-node-flags-tree-node-flags-span-label-width+ 8192)
  (defconstant +im-tree-node-flags-tree-node-flags-span-all-columns+ 16384)
  (defconstant +im-tree-node-flags-tree-node-flags-label-span-all-columns+ 32768)
  (defconstant +im-tree-node-flags-tree-node-flags-nav-left-jumps-to-parent+ 131072)
  (defconstant +im-tree-node-flags-tree-node-flags-collapsing-header+ 26)
  (defconstant +im-tree-node-flags-tree-node-flags-draw-lines-none+ 262144)
  (defconstant +im-tree-node-flags-tree-node-flags-draw-lines-full+ 524288)
  (defconstant +im-tree-node-flags-tree-node-flags-draw-lines-to-nodes+ 1048576)
  (defconstant +im-tree-node-flags-tree-node-flags-nav-left-jumps-back-here+ 131072)
  (defconstant +im-tree-node-flags-tree-node-flags-span-text-width+ 8192)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-popup-flags
  (:popup-flags-none 0)
  (:popup-flags-mouse-button-left 0)
  (:popup-flags-mouse-button-right 1)
  (:popup-flags-mouse-button-middle 2)
  (:popup-flags-mouse-button-mask- 31)
  (:popup-flags-mouse-button-default- 1)
  (:popup-flags-no-reopen 32)
  (:popup-flags-no-open-over-existing-popup 128)
  (:popup-flags-no-open-over-items 256)
  (:popup-flags-any-popup-id 1024)
  (:popup-flags-any-popup-level 2048)
  (:popup-flags-any-popup 3072)
)

#+ecl
(progn
  (defconstant +im-popup-flags-popup-flags-none+ 0)
  (defconstant +im-popup-flags-popup-flags-mouse-button-left+ 0)
  (defconstant +im-popup-flags-popup-flags-mouse-button-right+ 1)
  (defconstant +im-popup-flags-popup-flags-mouse-button-middle+ 2)
  (defconstant +im-popup-flags-popup-flags-mouse-button-mask-+ 31)
  (defconstant +im-popup-flags-popup-flags-mouse-button-default-+ 1)
  (defconstant +im-popup-flags-popup-flags-no-reopen+ 32)
  (defconstant +im-popup-flags-popup-flags-no-open-over-existing-popup+ 128)
  (defconstant +im-popup-flags-popup-flags-no-open-over-items+ 256)
  (defconstant +im-popup-flags-popup-flags-any-popup-id+ 1024)
  (defconstant +im-popup-flags-popup-flags-any-popup-level+ 2048)
  (defconstant +im-popup-flags-popup-flags-any-popup+ 3072)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-selectable-flags
  (:selectable-flags-none 0)
  (:selectable-flags-no-auto-close-popups 1)
  (:selectable-flags-span-all-columns 2)
  (:selectable-flags-allow-double-click 4)
  (:selectable-flags-disabled 8)
  (:selectable-flags-allow-overlap 16)
  (:selectable-flags-highlight 32)
  (:selectable-flags-select-on-nav 64)
  (:selectable-flags-dont-close-popups 1)
)

#+ecl
(progn
  (defconstant +im-selectable-flags-selectable-flags-none+ 0)
  (defconstant +im-selectable-flags-selectable-flags-no-auto-close-popups+ 1)
  (defconstant +im-selectable-flags-selectable-flags-span-all-columns+ 2)
  (defconstant +im-selectable-flags-selectable-flags-allow-double-click+ 4)
  (defconstant +im-selectable-flags-selectable-flags-disabled+ 8)
  (defconstant +im-selectable-flags-selectable-flags-allow-overlap+ 16)
  (defconstant +im-selectable-flags-selectable-flags-highlight+ 32)
  (defconstant +im-selectable-flags-selectable-flags-select-on-nav+ 64)
  (defconstant +im-selectable-flags-selectable-flags-dont-close-popups+ 1)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-combo-flags
  (:combo-flags-none 0)
  (:combo-flags-popup-align-left 1)
  (:combo-flags-height-small 2)
  (:combo-flags-height-regular 4)
  (:combo-flags-height-large 8)
  (:combo-flags-height-largest 16)
  (:combo-flags-no-arrow-button 32)
  (:combo-flags-no-preview 64)
  (:combo-flags-width-fit-preview 128)
  (:combo-flags-height-mask- 30)
)

#+ecl
(progn
  (defconstant +im-combo-flags-combo-flags-none+ 0)
  (defconstant +im-combo-flags-combo-flags-popup-align-left+ 1)
  (defconstant +im-combo-flags-combo-flags-height-small+ 2)
  (defconstant +im-combo-flags-combo-flags-height-regular+ 4)
  (defconstant +im-combo-flags-combo-flags-height-large+ 8)
  (defconstant +im-combo-flags-combo-flags-height-largest+ 16)
  (defconstant +im-combo-flags-combo-flags-no-arrow-button+ 32)
  (defconstant +im-combo-flags-combo-flags-no-preview+ 64)
  (defconstant +im-combo-flags-combo-flags-width-fit-preview+ 128)
  (defconstant +im-combo-flags-combo-flags-height-mask-+ 30)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-tab-bar-flags
  (:tab-bar-flags-none 0)
  (:tab-bar-flags-reorderable 1)
  (:tab-bar-flags-auto-select-new-tabs 2)
  (:tab-bar-flags-tab-list-popup-button 4)
  (:tab-bar-flags-no-close-with-middle-mouse-button 8)
  (:tab-bar-flags-no-tab-list-scrolling-buttons 16)
  (:tab-bar-flags-no-tooltip 32)
  (:tab-bar-flags-draw-selected-overline 64)
  (:tab-bar-flags-fitting-policy-mixed 128)
  (:tab-bar-flags-fitting-policy-shrink 256)
  (:tab-bar-flags-fitting-policy-scroll 512)
  (:tab-bar-flags-fitting-policy-mask- 896)
  (:tab-bar-flags-fitting-policy-default- 128)
  (:tab-bar-flags-fitting-policy-resize-down 256)
)

#+ecl
(progn
  (defconstant +im-tab-bar-flags-tab-bar-flags-none+ 0)
  (defconstant +im-tab-bar-flags-tab-bar-flags-reorderable+ 1)
  (defconstant +im-tab-bar-flags-tab-bar-flags-auto-select-new-tabs+ 2)
  (defconstant +im-tab-bar-flags-tab-bar-flags-tab-list-popup-button+ 4)
  (defconstant +im-tab-bar-flags-tab-bar-flags-no-close-with-middle-mouse-button+ 8)
  (defconstant +im-tab-bar-flags-tab-bar-flags-no-tab-list-scrolling-buttons+ 16)
  (defconstant +im-tab-bar-flags-tab-bar-flags-no-tooltip+ 32)
  (defconstant +im-tab-bar-flags-tab-bar-flags-draw-selected-overline+ 64)
  (defconstant +im-tab-bar-flags-tab-bar-flags-fitting-policy-mixed+ 128)
  (defconstant +im-tab-bar-flags-tab-bar-flags-fitting-policy-shrink+ 256)
  (defconstant +im-tab-bar-flags-tab-bar-flags-fitting-policy-scroll+ 512)
  (defconstant +im-tab-bar-flags-tab-bar-flags-fitting-policy-mask-+ 896)
  (defconstant +im-tab-bar-flags-tab-bar-flags-fitting-policy-default-+ 128)
  (defconstant +im-tab-bar-flags-tab-bar-flags-fitting-policy-resize-down+ 256)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-tab-item-flags
  (:tab-item-flags-none 0)
  (:tab-item-flags-unsaved-document 1)
  (:tab-item-flags-set-selected 2)
  (:tab-item-flags-no-close-with-middle-mouse-button 4)
  (:tab-item-flags-no-push-id 8)
  (:tab-item-flags-no-tooltip 16)
  (:tab-item-flags-no-reorder 32)
  (:tab-item-flags-leading 64)
  (:tab-item-flags-trailing 128)
  (:tab-item-flags-no-assumed-closure 256)
)

#+ecl
(progn
  (defconstant +im-tab-item-flags-tab-item-flags-none+ 0)
  (defconstant +im-tab-item-flags-tab-item-flags-unsaved-document+ 1)
  (defconstant +im-tab-item-flags-tab-item-flags-set-selected+ 2)
  (defconstant +im-tab-item-flags-tab-item-flags-no-close-with-middle-mouse-button+ 4)
  (defconstant +im-tab-item-flags-tab-item-flags-no-push-id+ 8)
  (defconstant +im-tab-item-flags-tab-item-flags-no-tooltip+ 16)
  (defconstant +im-tab-item-flags-tab-item-flags-no-reorder+ 32)
  (defconstant +im-tab-item-flags-tab-item-flags-leading+ 64)
  (defconstant +im-tab-item-flags-tab-item-flags-trailing+ 128)
  (defconstant +im-tab-item-flags-tab-item-flags-no-assumed-closure+ 256)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-focused-flags
  (:focused-flags-none 0)
  (:focused-flags-child-windows 1)
  (:focused-flags-root-window 2)
  (:focused-flags-any-window 4)
  (:focused-flags-no-popup-hierarchy 8)
  (:focused-flags-root-and-child-windows 3)
)

#+ecl
(progn
  (defconstant +im-focused-flags-focused-flags-none+ 0)
  (defconstant +im-focused-flags-focused-flags-child-windows+ 1)
  (defconstant +im-focused-flags-focused-flags-root-window+ 2)
  (defconstant +im-focused-flags-focused-flags-any-window+ 4)
  (defconstant +im-focused-flags-focused-flags-no-popup-hierarchy+ 8)
  (defconstant +im-focused-flags-focused-flags-root-and-child-windows+ 3)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-hovered-flags
  (:hovered-flags-none 0)
  (:hovered-flags-child-windows 1)
  (:hovered-flags-root-window 2)
  (:hovered-flags-any-window 4)
  (:hovered-flags-no-popup-hierarchy 8)
  (:hovered-flags-allow-when-blocked-by-popup 32)
  (:hovered-flags-allow-when-blocked-by-active-item 128)
  (:hovered-flags-allow-when-overlapped-by-item 256)
  (:hovered-flags-allow-when-overlapped-by-window 512)
  (:hovered-flags-allow-when-disabled 1024)
  (:hovered-flags-no-nav-override 2048)
  (:hovered-flags-allow-when-overlapped 768)
  (:hovered-flags-rect-only 928)
  (:hovered-flags-root-and-child-windows 3)
  (:hovered-flags-for-tooltip 4096)
  (:hovered-flags-stationary 8192)
  (:hovered-flags-delay-none 16384)
  (:hovered-flags-delay-short 32768)
  (:hovered-flags-delay-normal 65536)
  (:hovered-flags-no-shared-delay 131072)
)

#+ecl
(progn
  (defconstant +im-hovered-flags-hovered-flags-none+ 0)
  (defconstant +im-hovered-flags-hovered-flags-child-windows+ 1)
  (defconstant +im-hovered-flags-hovered-flags-root-window+ 2)
  (defconstant +im-hovered-flags-hovered-flags-any-window+ 4)
  (defconstant +im-hovered-flags-hovered-flags-no-popup-hierarchy+ 8)
  (defconstant +im-hovered-flags-hovered-flags-allow-when-blocked-by-popup+ 32)
  (defconstant +im-hovered-flags-hovered-flags-allow-when-blocked-by-active-item+ 128)
  (defconstant +im-hovered-flags-hovered-flags-allow-when-overlapped-by-item+ 256)
  (defconstant +im-hovered-flags-hovered-flags-allow-when-overlapped-by-window+ 512)
  (defconstant +im-hovered-flags-hovered-flags-allow-when-disabled+ 1024)
  (defconstant +im-hovered-flags-hovered-flags-no-nav-override+ 2048)
  (defconstant +im-hovered-flags-hovered-flags-allow-when-overlapped+ 768)
  (defconstant +im-hovered-flags-hovered-flags-rect-only+ 928)
  (defconstant +im-hovered-flags-hovered-flags-root-and-child-windows+ 3)
  (defconstant +im-hovered-flags-hovered-flags-for-tooltip+ 4096)
  (defconstant +im-hovered-flags-hovered-flags-stationary+ 8192)
  (defconstant +im-hovered-flags-hovered-flags-delay-none+ 16384)
  (defconstant +im-hovered-flags-hovered-flags-delay-short+ 32768)
  (defconstant +im-hovered-flags-hovered-flags-delay-normal+ 65536)
  (defconstant +im-hovered-flags-hovered-flags-no-shared-delay+ 131072)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-drag-drop-flags
  (:drag-drop-flags-none 0)
  (:drag-drop-flags-source-no-preview-tooltip 1)
  (:drag-drop-flags-source-no-disable-hover 2)
  (:drag-drop-flags-source-no-hold-to-open-others 4)
  (:drag-drop-flags-source-allow-null-id 8)
  (:drag-drop-flags-source-extern 16)
  (:drag-drop-flags-payload-auto-expire 32)
  (:drag-drop-flags-payload-no-cross-context 64)
  (:drag-drop-flags-payload-no-cross-process 128)
  (:drag-drop-flags-accept-before-delivery 1024)
  (:drag-drop-flags-accept-no-draw-default-rect 2048)
  (:drag-drop-flags-accept-no-preview-tooltip 4096)
  (:drag-drop-flags-accept-draw-as-hovered 8192)
  (:drag-drop-flags-accept-peek-only 3072)
  (:drag-drop-flags-source-auto-expire-payload 32)
)

#+ecl
(progn
  (defconstant +im-drag-drop-flags-drag-drop-flags-none+ 0)
  (defconstant +im-drag-drop-flags-drag-drop-flags-source-no-preview-tooltip+ 1)
  (defconstant +im-drag-drop-flags-drag-drop-flags-source-no-disable-hover+ 2)
  (defconstant +im-drag-drop-flags-drag-drop-flags-source-no-hold-to-open-others+ 4)
  (defconstant +im-drag-drop-flags-drag-drop-flags-source-allow-null-id+ 8)
  (defconstant +im-drag-drop-flags-drag-drop-flags-source-extern+ 16)
  (defconstant +im-drag-drop-flags-drag-drop-flags-payload-auto-expire+ 32)
  (defconstant +im-drag-drop-flags-drag-drop-flags-payload-no-cross-context+ 64)
  (defconstant +im-drag-drop-flags-drag-drop-flags-payload-no-cross-process+ 128)
  (defconstant +im-drag-drop-flags-drag-drop-flags-accept-before-delivery+ 1024)
  (defconstant +im-drag-drop-flags-drag-drop-flags-accept-no-draw-default-rect+ 2048)
  (defconstant +im-drag-drop-flags-drag-drop-flags-accept-no-preview-tooltip+ 4096)
  (defconstant +im-drag-drop-flags-drag-drop-flags-accept-draw-as-hovered+ 8192)
  (defconstant +im-drag-drop-flags-drag-drop-flags-accept-peek-only+ 3072)
  (defconstant +im-drag-drop-flags-drag-drop-flags-source-auto-expire-payload+ 32)
)

#-ecl
(defcenum im-data-type
  (:data-type-s8 0)
  (:data-type-u8 1)
  (:data-type-s16 2)
  (:data-type-u16 3)
  (:data-type-s32 4)
  (:data-type-u32 5)
  (:data-type-s64 6)
  (:data-type-u64 7)
  (:data-type-float 8)
  (:data-type-double 9)
  (:data-type-bool 10)
  (:data-type-string 11)
)

#+ecl
(progn
  (defconstant +im-data-type-data-type-s8+ 0)
  (defconstant +im-data-type-data-type-u8+ 1)
  (defconstant +im-data-type-data-type-s16+ 2)
  (defconstant +im-data-type-data-type-u16+ 3)
  (defconstant +im-data-type-data-type-s32+ 4)
  (defconstant +im-data-type-data-type-u32+ 5)
  (defconstant +im-data-type-data-type-s64+ 6)
  (defconstant +im-data-type-data-type-u64+ 7)
  (defconstant +im-data-type-data-type-float+ 8)
  (defconstant +im-data-type-data-type-double+ 9)
  (defconstant +im-data-type-data-type-bool+ 10)
  (defconstant +im-data-type-data-type-string+ 11)
)

#-ecl
(defcenum im-dir
  (:dir-none -1)
  (:dir-left 0)
  (:dir-right 1)
  (:dir-up 2)
  (:dir-down 3)
)

#+ecl
(progn
  (defconstant +im-dir-dir-none+ -1)
  (defconstant +im-dir-dir-left+ 0)
  (defconstant +im-dir-dir-right+ 1)
  (defconstant +im-dir-dir-up+ 2)
  (defconstant +im-dir-dir-down+ 3)
)

#-ecl
(defcenum im-sort-direction
  (:sort-direction-none 0)
  (:sort-direction-ascending 1)
  (:sort-direction-descending 2)
)

#+ecl
(progn
  (defconstant +im-sort-direction-sort-direction-none+ 0)
  (defconstant +im-sort-direction-sort-direction-ascending+ 1)
  (defconstant +im-sort-direction-sort-direction-descending+ 2)
)

#-ecl
(defcenum im-key
  (:key-none 0)
  (:key-named-key-begin 512)
  (:key-tab 512)
  (:key-left-arrow 513)
  (:key-right-arrow 514)
  (:key-up-arrow 515)
  (:key-down-arrow 516)
  (:key-page-up 517)
  (:key-page-down 518)
  (:key-home 519)
  (:key-end 520)
  (:key-insert 521)
  (:key-delete 522)
  (:key-backspace 523)
  (:key-space 524)
  (:key-enter 525)
  (:key-escape 526)
  (:key-left-ctrl 527)
  (:key-left-shift 528)
  (:key-left-alt 529)
  (:key-left-super 530)
  (:key-right-ctrl 531)
  (:key-right-shift 532)
  (:key-right-alt 533)
  (:key-right-super 534)
  (:key-menu 535)
  (:key-0 536)
  (:key-1 537)
  (:key-2 538)
  (:key-3 539)
  (:key-4 540)
  (:key-5 541)
  (:key-6 542)
  (:key-7 543)
  (:key-8 544)
  (:key-9 545)
  (:key-a 546)
  (:key-b 547)
  (:key-c 548)
  (:key-d 549)
  (:key-e 550)
  (:key-f 551)
  (:key-g 552)
  (:key-h 553)
  (:key-i 554)
  (:key-j 555)
  (:key-k 556)
  (:key-l 557)
  (:key-m 558)
  (:key-n 559)
  (:key-o 560)
  (:key-p 561)
  (:key-q 562)
  (:key-r 563)
  (:key-s 564)
  (:key-t 565)
  (:key-u 566)
  (:key-v 567)
  (:key-w 568)
  (:key-x 569)
  (:key-y 570)
  (:key-z 571)
  (:key-f1 572)
  (:key-f2 573)
  (:key-f3 574)
  (:key-f4 575)
  (:key-f5 576)
  (:key-f6 577)
  (:key-f7 578)
  (:key-f8 579)
  (:key-f9 580)
  (:key-f10 581)
  (:key-f11 582)
  (:key-f12 583)
  (:key-f13 584)
  (:key-f14 585)
  (:key-f15 586)
  (:key-f16 587)
  (:key-f17 588)
  (:key-f18 589)
  (:key-f19 590)
  (:key-f20 591)
  (:key-f21 592)
  (:key-f22 593)
  (:key-f23 594)
  (:key-f24 595)
  (:key-apostrophe 596)
  (:key-comma 597)
  (:key-minus 598)
  (:key-period 599)
  (:key-slash 600)
  (:key-semicolon 601)
  (:key-equal 602)
  (:key-left-bracket 603)
  (:key-backslash 604)
  (:key-right-bracket 605)
  (:key-grave-accent 606)
  (:key-caps-lock 607)
  (:key-scroll-lock 608)
  (:key-num-lock 609)
  (:key-print-screen 610)
  (:key-pause 611)
  (:key-keypad0 612)
  (:key-keypad1 613)
  (:key-keypad2 614)
  (:key-keypad3 615)
  (:key-keypad4 616)
  (:key-keypad5 617)
  (:key-keypad6 618)
  (:key-keypad7 619)
  (:key-keypad8 620)
  (:key-keypad9 621)
  (:key-keypad-decimal 622)
  (:key-keypad-divide 623)
  (:key-keypad-multiply 624)
  (:key-keypad-subtract 625)
  (:key-keypad-add 626)
  (:key-keypad-enter 627)
  (:key-keypad-equal 628)
  (:key-app-back 629)
  (:key-app-forward 630)
  (:key-oem102 631)
  (:key-gamepad-start 632)
  (:key-gamepad-back 633)
  (:key-gamepad-face-left 634)
  (:key-gamepad-face-right 635)
  (:key-gamepad-face-up 636)
  (:key-gamepad-face-down 637)
  (:key-gamepad-dpad-left 638)
  (:key-gamepad-dpad-right 639)
  (:key-gamepad-dpad-up 640)
  (:key-gamepad-dpad-down 641)
  (:key-gamepad-l1 642)
  (:key-gamepad-r1 643)
  (:key-gamepad-l2 644)
  (:key-gamepad-r2 645)
  (:key-gamepad-l3 646)
  (:key-gamepad-r3 647)
  (:key-gamepad-lstick-left 648)
  (:key-gamepad-lstick-right 649)
  (:key-gamepad-lstick-up 650)
  (:key-gamepad-lstick-down 651)
  (:key-gamepad-rstick-left 652)
  (:key-gamepad-rstick-right 653)
  (:key-gamepad-rstick-up 654)
  (:key-gamepad-rstick-down 655)
  (:key-mouse-left 656)
  (:key-mouse-right 657)
  (:key-mouse-middle 658)
  (:key-mouse-x1 659)
  (:key-mouse-x2 660)
  (:key-mouse-wheel-x 661)
  (:key-mouse-wheel-y 662)
  (:key-reserved-for-mod-ctrl 663)
  (:key-reserved-for-mod-shift 664)
  (:key-reserved-for-mod-alt 665)
  (:key-reserved-for-mod-super 666)
  (:key-named-key-end 667)
  (:mod-none 0)
  (:mod-ctrl 4096)
  (:mod-shift 8192)
  (:mod-alt 16384)
  (:mod-super 32768)
  (:mod-mask- 61440)
  (:mod-shortcut 4096)
)

#+ecl
(progn
  (defconstant +im-key-key-none+ 0)
  (defconstant +im-key-key-named-key-begin+ 512)
  (defconstant +im-key-key-tab+ 512)
  (defconstant +im-key-key-left-arrow+ 513)
  (defconstant +im-key-key-right-arrow+ 514)
  (defconstant +im-key-key-up-arrow+ 515)
  (defconstant +im-key-key-down-arrow+ 516)
  (defconstant +im-key-key-page-up+ 517)
  (defconstant +im-key-key-page-down+ 518)
  (defconstant +im-key-key-home+ 519)
  (defconstant +im-key-key-end+ 520)
  (defconstant +im-key-key-insert+ 521)
  (defconstant +im-key-key-delete+ 522)
  (defconstant +im-key-key-backspace+ 523)
  (defconstant +im-key-key-space+ 524)
  (defconstant +im-key-key-enter+ 525)
  (defconstant +im-key-key-escape+ 526)
  (defconstant +im-key-key-left-ctrl+ 527)
  (defconstant +im-key-key-left-shift+ 528)
  (defconstant +im-key-key-left-alt+ 529)
  (defconstant +im-key-key-left-super+ 530)
  (defconstant +im-key-key-right-ctrl+ 531)
  (defconstant +im-key-key-right-shift+ 532)
  (defconstant +im-key-key-right-alt+ 533)
  (defconstant +im-key-key-right-super+ 534)
  (defconstant +im-key-key-menu+ 535)
  (defconstant +im-key-key-0+ 536)
  (defconstant +im-key-key-1+ 537)
  (defconstant +im-key-key-2+ 538)
  (defconstant +im-key-key-3+ 539)
  (defconstant +im-key-key-4+ 540)
  (defconstant +im-key-key-5+ 541)
  (defconstant +im-key-key-6+ 542)
  (defconstant +im-key-key-7+ 543)
  (defconstant +im-key-key-8+ 544)
  (defconstant +im-key-key-9+ 545)
  (defconstant +im-key-key-a+ 546)
  (defconstant +im-key-key-b+ 547)
  (defconstant +im-key-key-c+ 548)
  (defconstant +im-key-key-d+ 549)
  (defconstant +im-key-key-e+ 550)
  (defconstant +im-key-key-f+ 551)
  (defconstant +im-key-key-g+ 552)
  (defconstant +im-key-key-h+ 553)
  (defconstant +im-key-key-i+ 554)
  (defconstant +im-key-key-j+ 555)
  (defconstant +im-key-key-k+ 556)
  (defconstant +im-key-key-l+ 557)
  (defconstant +im-key-key-m+ 558)
  (defconstant +im-key-key-n+ 559)
  (defconstant +im-key-key-o+ 560)
  (defconstant +im-key-key-p+ 561)
  (defconstant +im-key-key-q+ 562)
  (defconstant +im-key-key-r+ 563)
  (defconstant +im-key-key-s+ 564)
  (defconstant +im-key-key-t+ 565)
  (defconstant +im-key-key-u+ 566)
  (defconstant +im-key-key-v+ 567)
  (defconstant +im-key-key-w+ 568)
  (defconstant +im-key-key-x+ 569)
  (defconstant +im-key-key-y+ 570)
  (defconstant +im-key-key-z+ 571)
  (defconstant +im-key-key-f1+ 572)
  (defconstant +im-key-key-f2+ 573)
  (defconstant +im-key-key-f3+ 574)
  (defconstant +im-key-key-f4+ 575)
  (defconstant +im-key-key-f5+ 576)
  (defconstant +im-key-key-f6+ 577)
  (defconstant +im-key-key-f7+ 578)
  (defconstant +im-key-key-f8+ 579)
  (defconstant +im-key-key-f9+ 580)
  (defconstant +im-key-key-f10+ 581)
  (defconstant +im-key-key-f11+ 582)
  (defconstant +im-key-key-f12+ 583)
  (defconstant +im-key-key-f13+ 584)
  (defconstant +im-key-key-f14+ 585)
  (defconstant +im-key-key-f15+ 586)
  (defconstant +im-key-key-f16+ 587)
  (defconstant +im-key-key-f17+ 588)
  (defconstant +im-key-key-f18+ 589)
  (defconstant +im-key-key-f19+ 590)
  (defconstant +im-key-key-f20+ 591)
  (defconstant +im-key-key-f21+ 592)
  (defconstant +im-key-key-f22+ 593)
  (defconstant +im-key-key-f23+ 594)
  (defconstant +im-key-key-f24+ 595)
  (defconstant +im-key-key-apostrophe+ 596)
  (defconstant +im-key-key-comma+ 597)
  (defconstant +im-key-key-minus+ 598)
  (defconstant +im-key-key-period+ 599)
  (defconstant +im-key-key-slash+ 600)
  (defconstant +im-key-key-semicolon+ 601)
  (defconstant +im-key-key-equal+ 602)
  (defconstant +im-key-key-left-bracket+ 603)
  (defconstant +im-key-key-backslash+ 604)
  (defconstant +im-key-key-right-bracket+ 605)
  (defconstant +im-key-key-grave-accent+ 606)
  (defconstant +im-key-key-caps-lock+ 607)
  (defconstant +im-key-key-scroll-lock+ 608)
  (defconstant +im-key-key-num-lock+ 609)
  (defconstant +im-key-key-print-screen+ 610)
  (defconstant +im-key-key-pause+ 611)
  (defconstant +im-key-key-keypad0+ 612)
  (defconstant +im-key-key-keypad1+ 613)
  (defconstant +im-key-key-keypad2+ 614)
  (defconstant +im-key-key-keypad3+ 615)
  (defconstant +im-key-key-keypad4+ 616)
  (defconstant +im-key-key-keypad5+ 617)
  (defconstant +im-key-key-keypad6+ 618)
  (defconstant +im-key-key-keypad7+ 619)
  (defconstant +im-key-key-keypad8+ 620)
  (defconstant +im-key-key-keypad9+ 621)
  (defconstant +im-key-key-keypad-decimal+ 622)
  (defconstant +im-key-key-keypad-divide+ 623)
  (defconstant +im-key-key-keypad-multiply+ 624)
  (defconstant +im-key-key-keypad-subtract+ 625)
  (defconstant +im-key-key-keypad-add+ 626)
  (defconstant +im-key-key-keypad-enter+ 627)
  (defconstant +im-key-key-keypad-equal+ 628)
  (defconstant +im-key-key-app-back+ 629)
  (defconstant +im-key-key-app-forward+ 630)
  (defconstant +im-key-key-oem102+ 631)
  (defconstant +im-key-key-gamepad-start+ 632)
  (defconstant +im-key-key-gamepad-back+ 633)
  (defconstant +im-key-key-gamepad-face-left+ 634)
  (defconstant +im-key-key-gamepad-face-right+ 635)
  (defconstant +im-key-key-gamepad-face-up+ 636)
  (defconstant +im-key-key-gamepad-face-down+ 637)
  (defconstant +im-key-key-gamepad-dpad-left+ 638)
  (defconstant +im-key-key-gamepad-dpad-right+ 639)
  (defconstant +im-key-key-gamepad-dpad-up+ 640)
  (defconstant +im-key-key-gamepad-dpad-down+ 641)
  (defconstant +im-key-key-gamepad-l1+ 642)
  (defconstant +im-key-key-gamepad-r1+ 643)
  (defconstant +im-key-key-gamepad-l2+ 644)
  (defconstant +im-key-key-gamepad-r2+ 645)
  (defconstant +im-key-key-gamepad-l3+ 646)
  (defconstant +im-key-key-gamepad-r3+ 647)
  (defconstant +im-key-key-gamepad-lstick-left+ 648)
  (defconstant +im-key-key-gamepad-lstick-right+ 649)
  (defconstant +im-key-key-gamepad-lstick-up+ 650)
  (defconstant +im-key-key-gamepad-lstick-down+ 651)
  (defconstant +im-key-key-gamepad-rstick-left+ 652)
  (defconstant +im-key-key-gamepad-rstick-right+ 653)
  (defconstant +im-key-key-gamepad-rstick-up+ 654)
  (defconstant +im-key-key-gamepad-rstick-down+ 655)
  (defconstant +im-key-key-mouse-left+ 656)
  (defconstant +im-key-key-mouse-right+ 657)
  (defconstant +im-key-key-mouse-middle+ 658)
  (defconstant +im-key-key-mouse-x1+ 659)
  (defconstant +im-key-key-mouse-x2+ 660)
  (defconstant +im-key-key-mouse-wheel-x+ 661)
  (defconstant +im-key-key-mouse-wheel-y+ 662)
  (defconstant +im-key-key-reserved-for-mod-ctrl+ 663)
  (defconstant +im-key-key-reserved-for-mod-shift+ 664)
  (defconstant +im-key-key-reserved-for-mod-alt+ 665)
  (defconstant +im-key-key-reserved-for-mod-super+ 666)
  (defconstant +im-key-key-named-key-end+ 667)
  (defconstant +im-key-mod-none+ 0)
  (defconstant +im-key-mod-ctrl+ 4096)
  (defconstant +im-key-mod-shift+ 8192)
  (defconstant +im-key-mod-alt+ 16384)
  (defconstant +im-key-mod-super+ 32768)
  (defconstant +im-key-mod-mask-+ 61440)
  (defconstant +im-key-mod-shortcut+ 4096)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-input-flags
  (:input-flags-none 0)
  (:input-flags-repeat 1)
  (:input-flags-route-active 1024)
  (:input-flags-route-focused 2048)
  (:input-flags-route-global 4096)
  (:input-flags-route-always 8192)
  (:input-flags-route-over-focused 16384)
  (:input-flags-route-over-active 32768)
  (:input-flags-route-unless-bg-focused 65536)
  (:input-flags-route-from-root-window 131072)
  (:input-flags-tooltip 262144)
)

#+ecl
(progn
  (defconstant +im-input-flags-input-flags-none+ 0)
  (defconstant +im-input-flags-input-flags-repeat+ 1)
  (defconstant +im-input-flags-input-flags-route-active+ 1024)
  (defconstant +im-input-flags-input-flags-route-focused+ 2048)
  (defconstant +im-input-flags-input-flags-route-global+ 4096)
  (defconstant +im-input-flags-input-flags-route-always+ 8192)
  (defconstant +im-input-flags-input-flags-route-over-focused+ 16384)
  (defconstant +im-input-flags-input-flags-route-over-active+ 32768)
  (defconstant +im-input-flags-input-flags-route-unless-bg-focused+ 65536)
  (defconstant +im-input-flags-input-flags-route-from-root-window+ 131072)
  (defconstant +im-input-flags-input-flags-tooltip+ 262144)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-config-flags
  (:config-flags-none 0)
  (:config-flags-nav-enable-keyboard 1)
  (:config-flags-nav-enable-gamepad 2)
  (:config-flags-no-mouse 16)
  (:config-flags-no-mouse-cursor-change 32)
  (:config-flags-no-keyboard 64)
  (:config-flags-is-srgb 1048576)
  (:config-flags-is-touch-screen 2097152)
  (:config-flags-nav-enable-set-mouse-pos 4)
  (:config-flags-nav-no-capture-keyboard 8)
)

#+ecl
(progn
  (defconstant +im-config-flags-config-flags-none+ 0)
  (defconstant +im-config-flags-config-flags-nav-enable-keyboard+ 1)
  (defconstant +im-config-flags-config-flags-nav-enable-gamepad+ 2)
  (defconstant +im-config-flags-config-flags-no-mouse+ 16)
  (defconstant +im-config-flags-config-flags-no-mouse-cursor-change+ 32)
  (defconstant +im-config-flags-config-flags-no-keyboard+ 64)
  (defconstant +im-config-flags-config-flags-is-srgb+ 1048576)
  (defconstant +im-config-flags-config-flags-is-touch-screen+ 2097152)
  (defconstant +im-config-flags-config-flags-nav-enable-set-mouse-pos+ 4)
  (defconstant +im-config-flags-config-flags-nav-no-capture-keyboard+ 8)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-backend-flags
  (:backend-flags-none 0)
  (:backend-flags-has-gamepad 1)
  (:backend-flags-has-mouse-cursors 2)
  (:backend-flags-has-set-mouse-pos 4)
  (:backend-flags-renderer-has-vtx-offset 8)
  (:backend-flags-renderer-has-textures 16)
)

#+ecl
(progn
  (defconstant +im-backend-flags-backend-flags-none+ 0)
  (defconstant +im-backend-flags-backend-flags-has-gamepad+ 1)
  (defconstant +im-backend-flags-backend-flags-has-mouse-cursors+ 2)
  (defconstant +im-backend-flags-backend-flags-has-set-mouse-pos+ 4)
  (defconstant +im-backend-flags-backend-flags-renderer-has-vtx-offset+ 8)
  (defconstant +im-backend-flags-backend-flags-renderer-has-textures+ 16)
)

#-ecl
(defcenum im-col
  (:col-text 0)
  (:col-text-disabled 1)
  (:col-window-bg 2)
  (:col-child-bg 3)
  (:col-popup-bg 4)
  (:col-border 5)
  (:col-border-shadow 6)
  (:col-frame-bg 7)
  (:col-frame-bg-hovered 8)
  (:col-frame-bg-active 9)
  (:col-title-bg 10)
  (:col-title-bg-active 11)
  (:col-title-bg-collapsed 12)
  (:col-menu-bar-bg 13)
  (:col-scrollbar-bg 14)
  (:col-scrollbar-grab 15)
  (:col-scrollbar-grab-hovered 16)
  (:col-scrollbar-grab-active 17)
  (:col-check-mark 18)
  (:col-slider-grab 19)
  (:col-slider-grab-active 20)
  (:col-button 21)
  (:col-button-hovered 22)
  (:col-button-active 23)
  (:col-header 24)
  (:col-header-hovered 25)
  (:col-header-active 26)
  (:col-separator 27)
  (:col-separator-hovered 28)
  (:col-separator-active 29)
  (:col-resize-grip 30)
  (:col-resize-grip-hovered 31)
  (:col-resize-grip-active 32)
  (:col-input-text-cursor 33)
  (:col-tab-hovered 34)
  (:col-tab 35)
  (:col-tab-selected 36)
  (:col-tab-selected-overline 37)
  (:col-tab-dimmed 38)
  (:col-tab-dimmed-selected 39)
  (:col-tab-dimmed-selected-overline 40)
  (:col-plot-lines 41)
  (:col-plot-lines-hovered 42)
  (:col-plot-histogram 43)
  (:col-plot-histogram-hovered 44)
  (:col-table-header-bg 45)
  (:col-table-border-strong 46)
  (:col-table-border-light 47)
  (:col-table-row-bg 48)
  (:col-table-row-bg-alt 49)
  (:col-text-link 50)
  (:col-text-selected-bg 51)
  (:col-tree-lines 52)
  (:col-drag-drop-target 53)
  (:col-drag-drop-target-bg 54)
  (:col-unsaved-marker 55)
  (:col-nav-cursor 56)
  (:col-nav-windowing-highlight 57)
  (:col-nav-windowing-dim-bg 58)
  (:col-modal-window-dim-bg 59)
  (:col-tab-active 36)
  (:col-tab-unfocused 38)
  (:col-tab-unfocused-active 39)
  (:col-nav-highlight 56)
)

#+ecl
(progn
  (defconstant +im-col-col-text+ 0)
  (defconstant +im-col-col-text-disabled+ 1)
  (defconstant +im-col-col-window-bg+ 2)
  (defconstant +im-col-col-child-bg+ 3)
  (defconstant +im-col-col-popup-bg+ 4)
  (defconstant +im-col-col-border+ 5)
  (defconstant +im-col-col-border-shadow+ 6)
  (defconstant +im-col-col-frame-bg+ 7)
  (defconstant +im-col-col-frame-bg-hovered+ 8)
  (defconstant +im-col-col-frame-bg-active+ 9)
  (defconstant +im-col-col-title-bg+ 10)
  (defconstant +im-col-col-title-bg-active+ 11)
  (defconstant +im-col-col-title-bg-collapsed+ 12)
  (defconstant +im-col-col-menu-bar-bg+ 13)
  (defconstant +im-col-col-scrollbar-bg+ 14)
  (defconstant +im-col-col-scrollbar-grab+ 15)
  (defconstant +im-col-col-scrollbar-grab-hovered+ 16)
  (defconstant +im-col-col-scrollbar-grab-active+ 17)
  (defconstant +im-col-col-check-mark+ 18)
  (defconstant +im-col-col-slider-grab+ 19)
  (defconstant +im-col-col-slider-grab-active+ 20)
  (defconstant +im-col-col-button+ 21)
  (defconstant +im-col-col-button-hovered+ 22)
  (defconstant +im-col-col-button-active+ 23)
  (defconstant +im-col-col-header+ 24)
  (defconstant +im-col-col-header-hovered+ 25)
  (defconstant +im-col-col-header-active+ 26)
  (defconstant +im-col-col-separator+ 27)
  (defconstant +im-col-col-separator-hovered+ 28)
  (defconstant +im-col-col-separator-active+ 29)
  (defconstant +im-col-col-resize-grip+ 30)
  (defconstant +im-col-col-resize-grip-hovered+ 31)
  (defconstant +im-col-col-resize-grip-active+ 32)
  (defconstant +im-col-col-input-text-cursor+ 33)
  (defconstant +im-col-col-tab-hovered+ 34)
  (defconstant +im-col-col-tab+ 35)
  (defconstant +im-col-col-tab-selected+ 36)
  (defconstant +im-col-col-tab-selected-overline+ 37)
  (defconstant +im-col-col-tab-dimmed+ 38)
  (defconstant +im-col-col-tab-dimmed-selected+ 39)
  (defconstant +im-col-col-tab-dimmed-selected-overline+ 40)
  (defconstant +im-col-col-plot-lines+ 41)
  (defconstant +im-col-col-plot-lines-hovered+ 42)
  (defconstant +im-col-col-plot-histogram+ 43)
  (defconstant +im-col-col-plot-histogram-hovered+ 44)
  (defconstant +im-col-col-table-header-bg+ 45)
  (defconstant +im-col-col-table-border-strong+ 46)
  (defconstant +im-col-col-table-border-light+ 47)
  (defconstant +im-col-col-table-row-bg+ 48)
  (defconstant +im-col-col-table-row-bg-alt+ 49)
  (defconstant +im-col-col-text-link+ 50)
  (defconstant +im-col-col-text-selected-bg+ 51)
  (defconstant +im-col-col-tree-lines+ 52)
  (defconstant +im-col-col-drag-drop-target+ 53)
  (defconstant +im-col-col-drag-drop-target-bg+ 54)
  (defconstant +im-col-col-unsaved-marker+ 55)
  (defconstant +im-col-col-nav-cursor+ 56)
  (defconstant +im-col-col-nav-windowing-highlight+ 57)
  (defconstant +im-col-col-nav-windowing-dim-bg+ 58)
  (defconstant +im-col-col-modal-window-dim-bg+ 59)
  (defconstant +im-col-col-tab-active+ 36)
  (defconstant +im-col-col-tab-unfocused+ 38)
  (defconstant +im-col-col-tab-unfocused-active+ 39)
  (defconstant +im-col-col-nav-highlight+ 56)
)

#-ecl
(defcenum im-style-var
  (:style-var-alpha 0)
  (:style-var-disabled-alpha 1)
  (:style-var-window-padding 2)
  (:style-var-window-rounding 3)
  (:style-var-window-border-size 4)
  (:style-var-window-min-size 5)
  (:style-var-window-title-align 6)
  (:style-var-child-rounding 7)
  (:style-var-child-border-size 8)
  (:style-var-popup-rounding 9)
  (:style-var-popup-border-size 10)
  (:style-var-frame-padding 11)
  (:style-var-frame-rounding 12)
  (:style-var-frame-border-size 13)
  (:style-var-item-spacing 14)
  (:style-var-item-inner-spacing 15)
  (:style-var-indent-spacing 16)
  (:style-var-cell-padding 17)
  (:style-var-scrollbar-size 18)
  (:style-var-scrollbar-rounding 19)
  (:style-var-scrollbar-padding 20)
  (:style-var-grab-min-size 21)
  (:style-var-grab-rounding 22)
  (:style-var-image-border-size 23)
  (:style-var-tab-rounding 24)
  (:style-var-tab-border-size 25)
  (:style-var-tab-min-width-base 26)
  (:style-var-tab-min-width-shrink 27)
  (:style-var-tab-bar-border-size 28)
  (:style-var-tab-bar-overline-size 29)
  (:style-var-table-angled-headers-angle 30)
  (:style-var-table-angled-headers-text-align 31)
  (:style-var-tree-lines-size 32)
  (:style-var-tree-lines-rounding 33)
  (:style-var-button-text-align 34)
  (:style-var-selectable-text-align 35)
  (:style-var-separator-text-border-size 36)
  (:style-var-separator-text-align 37)
  (:style-var-separator-text-padding 38)
)

#+ecl
(progn
  (defconstant +im-style-var-style-var-alpha+ 0)
  (defconstant +im-style-var-style-var-disabled-alpha+ 1)
  (defconstant +im-style-var-style-var-window-padding+ 2)
  (defconstant +im-style-var-style-var-window-rounding+ 3)
  (defconstant +im-style-var-style-var-window-border-size+ 4)
  (defconstant +im-style-var-style-var-window-min-size+ 5)
  (defconstant +im-style-var-style-var-window-title-align+ 6)
  (defconstant +im-style-var-style-var-child-rounding+ 7)
  (defconstant +im-style-var-style-var-child-border-size+ 8)
  (defconstant +im-style-var-style-var-popup-rounding+ 9)
  (defconstant +im-style-var-style-var-popup-border-size+ 10)
  (defconstant +im-style-var-style-var-frame-padding+ 11)
  (defconstant +im-style-var-style-var-frame-rounding+ 12)
  (defconstant +im-style-var-style-var-frame-border-size+ 13)
  (defconstant +im-style-var-style-var-item-spacing+ 14)
  (defconstant +im-style-var-style-var-item-inner-spacing+ 15)
  (defconstant +im-style-var-style-var-indent-spacing+ 16)
  (defconstant +im-style-var-style-var-cell-padding+ 17)
  (defconstant +im-style-var-style-var-scrollbar-size+ 18)
  (defconstant +im-style-var-style-var-scrollbar-rounding+ 19)
  (defconstant +im-style-var-style-var-scrollbar-padding+ 20)
  (defconstant +im-style-var-style-var-grab-min-size+ 21)
  (defconstant +im-style-var-style-var-grab-rounding+ 22)
  (defconstant +im-style-var-style-var-image-border-size+ 23)
  (defconstant +im-style-var-style-var-tab-rounding+ 24)
  (defconstant +im-style-var-style-var-tab-border-size+ 25)
  (defconstant +im-style-var-style-var-tab-min-width-base+ 26)
  (defconstant +im-style-var-style-var-tab-min-width-shrink+ 27)
  (defconstant +im-style-var-style-var-tab-bar-border-size+ 28)
  (defconstant +im-style-var-style-var-tab-bar-overline-size+ 29)
  (defconstant +im-style-var-style-var-table-angled-headers-angle+ 30)
  (defconstant +im-style-var-style-var-table-angled-headers-text-align+ 31)
  (defconstant +im-style-var-style-var-tree-lines-size+ 32)
  (defconstant +im-style-var-style-var-tree-lines-rounding+ 33)
  (defconstant +im-style-var-style-var-button-text-align+ 34)
  (defconstant +im-style-var-style-var-selectable-text-align+ 35)
  (defconstant +im-style-var-style-var-separator-text-border-size+ 36)
  (defconstant +im-style-var-style-var-separator-text-align+ 37)
  (defconstant +im-style-var-style-var-separator-text-padding+ 38)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-button-flags
  (:button-flags-none 0)
  (:button-flags-mouse-button-left 1)
  (:button-flags-mouse-button-right 2)
  (:button-flags-mouse-button-middle 4)
  (:button-flags-mouse-button-mask- 7)
  (:button-flags-enable-nav 8)
)

#+ecl
(progn
  (defconstant +im-button-flags-button-flags-none+ 0)
  (defconstant +im-button-flags-button-flags-mouse-button-left+ 1)
  (defconstant +im-button-flags-button-flags-mouse-button-right+ 2)
  (defconstant +im-button-flags-button-flags-mouse-button-middle+ 4)
  (defconstant +im-button-flags-button-flags-mouse-button-mask-+ 7)
  (defconstant +im-button-flags-button-flags-enable-nav+ 8)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-color-edit-flags
  (:color-edit-flags-none 0)
  (:color-edit-flags-no-alpha 2)
  (:color-edit-flags-no-picker 4)
  (:color-edit-flags-no-options 8)
  (:color-edit-flags-no-small-preview 16)
  (:color-edit-flags-no-inputs 32)
  (:color-edit-flags-no-tooltip 64)
  (:color-edit-flags-no-label 128)
  (:color-edit-flags-no-side-preview 256)
  (:color-edit-flags-no-drag-drop 512)
  (:color-edit-flags-no-border 1024)
  (:color-edit-flags-no-color-markers 2048)
  (:color-edit-flags-alpha-opaque 4096)
  (:color-edit-flags-alpha-no-bg 8192)
  (:color-edit-flags-alpha-preview-half 16384)
  (:color-edit-flags-alpha-bar 262144)
  (:color-edit-flags-hdr 524288)
  (:color-edit-flags-display-rgb 1048576)
  (:color-edit-flags-display-hsv 2097152)
  (:color-edit-flags-display-hex 4194304)
  (:color-edit-flags-uint8 8388608)
  (:color-edit-flags-float 16777216)
  (:color-edit-flags-picker-hue-bar 33554432)
  (:color-edit-flags-picker-hue-wheel 67108864)
  (:color-edit-flags-input-rgb 134217728)
  (:color-edit-flags-input-hsv 268435456)
  (:color-edit-flags-default-options- 177209344)
  (:color-edit-flags-alpha-mask- 28674)
  (:color-edit-flags-display-mask- 7340032)
  (:color-edit-flags-data-type-mask- 25165824)
  (:color-edit-flags-picker-mask- 100663296)
  (:color-edit-flags-input-mask- 402653184)
  (:color-edit-flags-alpha-preview 0)
)

#+ecl
(progn
  (defconstant +im-color-edit-flags-color-edit-flags-none+ 0)
  (defconstant +im-color-edit-flags-color-edit-flags-no-alpha+ 2)
  (defconstant +im-color-edit-flags-color-edit-flags-no-picker+ 4)
  (defconstant +im-color-edit-flags-color-edit-flags-no-options+ 8)
  (defconstant +im-color-edit-flags-color-edit-flags-no-small-preview+ 16)
  (defconstant +im-color-edit-flags-color-edit-flags-no-inputs+ 32)
  (defconstant +im-color-edit-flags-color-edit-flags-no-tooltip+ 64)
  (defconstant +im-color-edit-flags-color-edit-flags-no-label+ 128)
  (defconstant +im-color-edit-flags-color-edit-flags-no-side-preview+ 256)
  (defconstant +im-color-edit-flags-color-edit-flags-no-drag-drop+ 512)
  (defconstant +im-color-edit-flags-color-edit-flags-no-border+ 1024)
  (defconstant +im-color-edit-flags-color-edit-flags-no-color-markers+ 2048)
  (defconstant +im-color-edit-flags-color-edit-flags-alpha-opaque+ 4096)
  (defconstant +im-color-edit-flags-color-edit-flags-alpha-no-bg+ 8192)
  (defconstant +im-color-edit-flags-color-edit-flags-alpha-preview-half+ 16384)
  (defconstant +im-color-edit-flags-color-edit-flags-alpha-bar+ 262144)
  (defconstant +im-color-edit-flags-color-edit-flags-hdr+ 524288)
  (defconstant +im-color-edit-flags-color-edit-flags-display-rgb+ 1048576)
  (defconstant +im-color-edit-flags-color-edit-flags-display-hsv+ 2097152)
  (defconstant +im-color-edit-flags-color-edit-flags-display-hex+ 4194304)
  (defconstant +im-color-edit-flags-color-edit-flags-uint8+ 8388608)
  (defconstant +im-color-edit-flags-color-edit-flags-float+ 16777216)
  (defconstant +im-color-edit-flags-color-edit-flags-picker-hue-bar+ 33554432)
  (defconstant +im-color-edit-flags-color-edit-flags-picker-hue-wheel+ 67108864)
  (defconstant +im-color-edit-flags-color-edit-flags-input-rgb+ 134217728)
  (defconstant +im-color-edit-flags-color-edit-flags-input-hsv+ 268435456)
  (defconstant +im-color-edit-flags-color-edit-flags-default-options-+ 177209344)
  (defconstant +im-color-edit-flags-color-edit-flags-alpha-mask-+ 28674)
  (defconstant +im-color-edit-flags-color-edit-flags-display-mask-+ 7340032)
  (defconstant +im-color-edit-flags-color-edit-flags-data-type-mask-+ 25165824)
  (defconstant +im-color-edit-flags-color-edit-flags-picker-mask-+ 100663296)
  (defconstant +im-color-edit-flags-color-edit-flags-input-mask-+ 402653184)
  (defconstant +im-color-edit-flags-color-edit-flags-alpha-preview+ 0)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-slider-flags
  (:slider-flags-none 0)
  (:slider-flags-logarithmic 32)
  (:slider-flags-no-round-to-format 64)
  (:slider-flags-no-input 128)
  (:slider-flags-wrap-around 256)
  (:slider-flags-clamp-on-input 512)
  (:slider-flags-clamp-zero-range 1024)
  (:slider-flags-no-speed-tweaks 2048)
  (:slider-flags-color-markers 4096)
  (:slider-flags-always-clamp 1536)
  (:slider-flags-invalid-mask- 1879048207)
)

#+ecl
(progn
  (defconstant +im-slider-flags-slider-flags-none+ 0)
  (defconstant +im-slider-flags-slider-flags-logarithmic+ 32)
  (defconstant +im-slider-flags-slider-flags-no-round-to-format+ 64)
  (defconstant +im-slider-flags-slider-flags-no-input+ 128)
  (defconstant +im-slider-flags-slider-flags-wrap-around+ 256)
  (defconstant +im-slider-flags-slider-flags-clamp-on-input+ 512)
  (defconstant +im-slider-flags-slider-flags-clamp-zero-range+ 1024)
  (defconstant +im-slider-flags-slider-flags-no-speed-tweaks+ 2048)
  (defconstant +im-slider-flags-slider-flags-color-markers+ 4096)
  (defconstant +im-slider-flags-slider-flags-always-clamp+ 1536)
  (defconstant +im-slider-flags-slider-flags-invalid-mask-+ 1879048207)
)

#-ecl
(defcenum im-mouse-button
  (:mouse-button-left 0)
  (:mouse-button-right 1)
  (:mouse-button-middle 2)
)

#+ecl
(progn
  (defconstant +im-mouse-button-mouse-button-left+ 0)
  (defconstant +im-mouse-button-mouse-button-right+ 1)
  (defconstant +im-mouse-button-mouse-button-middle+ 2)
)

#-ecl
(defcenum im-mouse-cursor
  (:mouse-cursor-none -1)
  (:mouse-cursor-arrow 0)
  (:mouse-cursor-text-input 1)
  (:mouse-cursor-resize-all 2)
  (:mouse-cursor-resize-ns 3)
  (:mouse-cursor-resize-ew 4)
  (:mouse-cursor-resize-nesw 5)
  (:mouse-cursor-resize-nwse 6)
  (:mouse-cursor-hand 7)
  (:mouse-cursor-wait 8)
  (:mouse-cursor-progress 9)
  (:mouse-cursor-not-allowed 10)
)

#+ecl
(progn
  (defconstant +im-mouse-cursor-mouse-cursor-none+ -1)
  (defconstant +im-mouse-cursor-mouse-cursor-arrow+ 0)
  (defconstant +im-mouse-cursor-mouse-cursor-text-input+ 1)
  (defconstant +im-mouse-cursor-mouse-cursor-resize-all+ 2)
  (defconstant +im-mouse-cursor-mouse-cursor-resize-ns+ 3)
  (defconstant +im-mouse-cursor-mouse-cursor-resize-ew+ 4)
  (defconstant +im-mouse-cursor-mouse-cursor-resize-nesw+ 5)
  (defconstant +im-mouse-cursor-mouse-cursor-resize-nwse+ 6)
  (defconstant +im-mouse-cursor-mouse-cursor-hand+ 7)
  (defconstant +im-mouse-cursor-mouse-cursor-wait+ 8)
  (defconstant +im-mouse-cursor-mouse-cursor-progress+ 9)
  (defconstant +im-mouse-cursor-mouse-cursor-not-allowed+ 10)
)

#-ecl
(defcenum im-mouse-source
  (:mouse-source-mouse 0)
  (:mouse-source-touch-screen 1)
  (:mouse-source-pen 2)
)

#+ecl
(progn
  (defconstant +im-mouse-source-mouse-source-mouse+ 0)
  (defconstant +im-mouse-source-mouse-source-touch-screen+ 1)
  (defconstant +im-mouse-source-mouse-source-pen+ 2)
)

#-ecl
(defcenum im-cond
  (:cond-none 0)
  (:cond-always 1)
  (:cond-once 2)
  (:cond-first-use-ever 4)
  (:cond-appearing 8)
)

#+ecl
(progn
  (defconstant +im-cond-cond-none+ 0)
  (defconstant +im-cond-cond-always+ 1)
  (defconstant +im-cond-cond-once+ 2)
  (defconstant +im-cond-cond-first-use-ever+ 4)
  (defconstant +im-cond-cond-appearing+ 8)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-table-flags
  (:table-flags-none 0)
  (:table-flags-resizable 1)
  (:table-flags-reorderable 2)
  (:table-flags-hideable 4)
  (:table-flags-sortable 8)
  (:table-flags-no-saved-settings 16)
  (:table-flags-context-menu-in-body 32)
  (:table-flags-row-bg 64)
  (:table-flags-borders-inner-h 128)
  (:table-flags-borders-outer-h 256)
  (:table-flags-borders-inner-v 512)
  (:table-flags-borders-outer-v 1024)
  (:table-flags-borders-h 384)
  (:table-flags-borders-v 1536)
  (:table-flags-borders-inner 640)
  (:table-flags-borders-outer 1280)
  (:table-flags-borders 1920)
  (:table-flags-no-borders-in-body 2048)
  (:table-flags-no-borders-in-body-until-resize 4096)
  (:table-flags-sizing-fixed-fit 8192)
  (:table-flags-sizing-fixed-same 16384)
  (:table-flags-sizing-stretch-prop 24576)
  (:table-flags-sizing-stretch-same 32768)
  (:table-flags-no-host-extend-x 65536)
  (:table-flags-no-host-extend-y 131072)
  (:table-flags-no-keep-columns-visible 262144)
  (:table-flags-precise-widths 524288)
  (:table-flags-no-clip 1048576)
  (:table-flags-pad-outer-x 2097152)
  (:table-flags-no-pad-outer-x 4194304)
  (:table-flags-no-pad-inner-x 8388608)
  (:table-flags-scroll-x 16777216)
  (:table-flags-scroll-y 33554432)
  (:table-flags-sort-multi 67108864)
  (:table-flags-sort-tristate 134217728)
  (:table-flags-highlight-hovered-column 268435456)
  (:table-flags-sizing-mask- 57344)
)

#+ecl
(progn
  (defconstant +im-table-flags-table-flags-none+ 0)
  (defconstant +im-table-flags-table-flags-resizable+ 1)
  (defconstant +im-table-flags-table-flags-reorderable+ 2)
  (defconstant +im-table-flags-table-flags-hideable+ 4)
  (defconstant +im-table-flags-table-flags-sortable+ 8)
  (defconstant +im-table-flags-table-flags-no-saved-settings+ 16)
  (defconstant +im-table-flags-table-flags-context-menu-in-body+ 32)
  (defconstant +im-table-flags-table-flags-row-bg+ 64)
  (defconstant +im-table-flags-table-flags-borders-inner-h+ 128)
  (defconstant +im-table-flags-table-flags-borders-outer-h+ 256)
  (defconstant +im-table-flags-table-flags-borders-inner-v+ 512)
  (defconstant +im-table-flags-table-flags-borders-outer-v+ 1024)
  (defconstant +im-table-flags-table-flags-borders-h+ 384)
  (defconstant +im-table-flags-table-flags-borders-v+ 1536)
  (defconstant +im-table-flags-table-flags-borders-inner+ 640)
  (defconstant +im-table-flags-table-flags-borders-outer+ 1280)
  (defconstant +im-table-flags-table-flags-borders+ 1920)
  (defconstant +im-table-flags-table-flags-no-borders-in-body+ 2048)
  (defconstant +im-table-flags-table-flags-no-borders-in-body-until-resize+ 4096)
  (defconstant +im-table-flags-table-flags-sizing-fixed-fit+ 8192)
  (defconstant +im-table-flags-table-flags-sizing-fixed-same+ 16384)
  (defconstant +im-table-flags-table-flags-sizing-stretch-prop+ 24576)
  (defconstant +im-table-flags-table-flags-sizing-stretch-same+ 32768)
  (defconstant +im-table-flags-table-flags-no-host-extend-x+ 65536)
  (defconstant +im-table-flags-table-flags-no-host-extend-y+ 131072)
  (defconstant +im-table-flags-table-flags-no-keep-columns-visible+ 262144)
  (defconstant +im-table-flags-table-flags-precise-widths+ 524288)
  (defconstant +im-table-flags-table-flags-no-clip+ 1048576)
  (defconstant +im-table-flags-table-flags-pad-outer-x+ 2097152)
  (defconstant +im-table-flags-table-flags-no-pad-outer-x+ 4194304)
  (defconstant +im-table-flags-table-flags-no-pad-inner-x+ 8388608)
  (defconstant +im-table-flags-table-flags-scroll-x+ 16777216)
  (defconstant +im-table-flags-table-flags-scroll-y+ 33554432)
  (defconstant +im-table-flags-table-flags-sort-multi+ 67108864)
  (defconstant +im-table-flags-table-flags-sort-tristate+ 134217728)
  (defconstant +im-table-flags-table-flags-highlight-hovered-column+ 268435456)
  (defconstant +im-table-flags-table-flags-sizing-mask-+ 57344)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-table-column-flags
  (:table-column-flags-none 0)
  (:table-column-flags-disabled 1)
  (:table-column-flags-default-hide 2)
  (:table-column-flags-default-sort 4)
  (:table-column-flags-width-stretch 8)
  (:table-column-flags-width-fixed 16)
  (:table-column-flags-no-resize 32)
  (:table-column-flags-no-reorder 64)
  (:table-column-flags-no-hide 128)
  (:table-column-flags-no-clip 256)
  (:table-column-flags-no-sort 512)
  (:table-column-flags-no-sort-ascending 1024)
  (:table-column-flags-no-sort-descending 2048)
  (:table-column-flags-no-header-label 4096)
  (:table-column-flags-no-header-width 8192)
  (:table-column-flags-prefer-sort-ascending 16384)
  (:table-column-flags-prefer-sort-descending 32768)
  (:table-column-flags-indent-enable 65536)
  (:table-column-flags-indent-disable 131072)
  (:table-column-flags-angled-header 262144)
  (:table-column-flags-is-enabled 16777216)
  (:table-column-flags-is-visible 33554432)
  (:table-column-flags-is-sorted 67108864)
  (:table-column-flags-is-hovered 134217728)
  (:table-column-flags-width-mask- 24)
  (:table-column-flags-indent-mask- 196608)
  (:table-column-flags-status-mask- 251658240)
  (:table-column-flags-no-direct-resize- 1073741824)
)

#+ecl
(progn
  (defconstant +im-table-column-flags-table-column-flags-none+ 0)
  (defconstant +im-table-column-flags-table-column-flags-disabled+ 1)
  (defconstant +im-table-column-flags-table-column-flags-default-hide+ 2)
  (defconstant +im-table-column-flags-table-column-flags-default-sort+ 4)
  (defconstant +im-table-column-flags-table-column-flags-width-stretch+ 8)
  (defconstant +im-table-column-flags-table-column-flags-width-fixed+ 16)
  (defconstant +im-table-column-flags-table-column-flags-no-resize+ 32)
  (defconstant +im-table-column-flags-table-column-flags-no-reorder+ 64)
  (defconstant +im-table-column-flags-table-column-flags-no-hide+ 128)
  (defconstant +im-table-column-flags-table-column-flags-no-clip+ 256)
  (defconstant +im-table-column-flags-table-column-flags-no-sort+ 512)
  (defconstant +im-table-column-flags-table-column-flags-no-sort-ascending+ 1024)
  (defconstant +im-table-column-flags-table-column-flags-no-sort-descending+ 2048)
  (defconstant +im-table-column-flags-table-column-flags-no-header-label+ 4096)
  (defconstant +im-table-column-flags-table-column-flags-no-header-width+ 8192)
  (defconstant +im-table-column-flags-table-column-flags-prefer-sort-ascending+ 16384)
  (defconstant +im-table-column-flags-table-column-flags-prefer-sort-descending+ 32768)
  (defconstant +im-table-column-flags-table-column-flags-indent-enable+ 65536)
  (defconstant +im-table-column-flags-table-column-flags-indent-disable+ 131072)
  (defconstant +im-table-column-flags-table-column-flags-angled-header+ 262144)
  (defconstant +im-table-column-flags-table-column-flags-is-enabled+ 16777216)
  (defconstant +im-table-column-flags-table-column-flags-is-visible+ 33554432)
  (defconstant +im-table-column-flags-table-column-flags-is-sorted+ 67108864)
  (defconstant +im-table-column-flags-table-column-flags-is-hovered+ 134217728)
  (defconstant +im-table-column-flags-table-column-flags-width-mask-+ 24)
  (defconstant +im-table-column-flags-table-column-flags-indent-mask-+ 196608)
  (defconstant +im-table-column-flags-table-column-flags-status-mask-+ 251658240)
  (defconstant +im-table-column-flags-table-column-flags-no-direct-resize-+ 1073741824)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-table-row-flags
  (:table-row-flags-none 0)
  (:table-row-flags-headers 1)
)

#+ecl
(progn
  (defconstant +im-table-row-flags-table-row-flags-none+ 0)
  (defconstant +im-table-row-flags-table-row-flags-headers+ 1)
)

#-ecl
(defcenum im-table-bg-target
  (:table-bg-target-none 0)
  (:table-bg-target-row-bg0 1)
  (:table-bg-target-row-bg1 2)
  (:table-bg-target-cell-bg 3)
)

#+ecl
(progn
  (defconstant +im-table-bg-target-table-bg-target-none+ 0)
  (defconstant +im-table-bg-target-table-bg-target-row-bg0+ 1)
  (defconstant +im-table-bg-target-table-bg-target-row-bg1+ 2)
  (defconstant +im-table-bg-target-table-bg-target-cell-bg+ 3)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-list-clipper-flags
  (:list-clipper-flags-none 0)
  (:list-clipper-flags-no-set-table-row-counters 1)
)

#+ecl
(progn
  (defconstant +im-list-clipper-flags-list-clipper-flags-none+ 0)
  (defconstant +im-list-clipper-flags-list-clipper-flags-no-set-table-row-counters+ 1)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-multi-select-flags
  (:multi-select-flags-none 0)
  (:multi-select-flags-single-select 1)
  (:multi-select-flags-no-select-all 2)
  (:multi-select-flags-no-range-select 4)
  (:multi-select-flags-no-auto-select 8)
  (:multi-select-flags-no-auto-clear 16)
  (:multi-select-flags-no-auto-clear-on-reselect 32)
  (:multi-select-flags-box-select1d 64)
  (:multi-select-flags-box-select2d 128)
  (:multi-select-flags-box-select-no-scroll 256)
  (:multi-select-flags-clear-on-escape 512)
  (:multi-select-flags-clear-on-click-void 1024)
  (:multi-select-flags-scope-window 2048)
  (:multi-select-flags-scope-rect 4096)
  (:multi-select-flags-select-on-click 8192)
  (:multi-select-flags-select-on-click-release 16384)
  (:multi-select-flags-nav-wrap-x 65536)
  (:multi-select-flags-no-select-on-right-click 131072)
)

#+ecl
(progn
  (defconstant +im-multi-select-flags-multi-select-flags-none+ 0)
  (defconstant +im-multi-select-flags-multi-select-flags-single-select+ 1)
  (defconstant +im-multi-select-flags-multi-select-flags-no-select-all+ 2)
  (defconstant +im-multi-select-flags-multi-select-flags-no-range-select+ 4)
  (defconstant +im-multi-select-flags-multi-select-flags-no-auto-select+ 8)
  (defconstant +im-multi-select-flags-multi-select-flags-no-auto-clear+ 16)
  (defconstant +im-multi-select-flags-multi-select-flags-no-auto-clear-on-reselect+ 32)
  (defconstant +im-multi-select-flags-multi-select-flags-box-select1d+ 64)
  (defconstant +im-multi-select-flags-multi-select-flags-box-select2d+ 128)
  (defconstant +im-multi-select-flags-multi-select-flags-box-select-no-scroll+ 256)
  (defconstant +im-multi-select-flags-multi-select-flags-clear-on-escape+ 512)
  (defconstant +im-multi-select-flags-multi-select-flags-clear-on-click-void+ 1024)
  (defconstant +im-multi-select-flags-multi-select-flags-scope-window+ 2048)
  (defconstant +im-multi-select-flags-multi-select-flags-scope-rect+ 4096)
  (defconstant +im-multi-select-flags-multi-select-flags-select-on-click+ 8192)
  (defconstant +im-multi-select-flags-multi-select-flags-select-on-click-release+ 16384)
  (defconstant +im-multi-select-flags-multi-select-flags-nav-wrap-x+ 65536)
  (defconstant +im-multi-select-flags-multi-select-flags-no-select-on-right-click+ 131072)
)

#-ecl
(defcenum im-selection-request-type
  (:selection-request-type-none 0)
  (:selection-request-type-set-all 1)
  (:selection-request-type-set-range 2)
)

#+ecl
(progn
  (defconstant +im-selection-request-type-selection-request-type-none+ 0)
  (defconstant +im-selection-request-type-selection-request-type-set-all+ 1)
  (defconstant +im-selection-request-type-selection-request-type-set-range+ 2)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-draw-flags
  (:draw-flags-none 0)
  (:draw-flags-closed 1)
  (:draw-flags-round-corners-top-left 16)
  (:draw-flags-round-corners-top-right 32)
  (:draw-flags-round-corners-bottom-left 64)
  (:draw-flags-round-corners-bottom-right 128)
  (:draw-flags-round-corners-none 256)
  (:draw-flags-round-corners-top 48)
  (:draw-flags-round-corners-bottom 192)
  (:draw-flags-round-corners-left 80)
  (:draw-flags-round-corners-right 160)
  (:draw-flags-round-corners-all 240)
  (:draw-flags-round-corners-default- 240)
  (:draw-flags-round-corners-mask- 496)
)

#+ecl
(progn
  (defconstant +im-draw-flags-draw-flags-none+ 0)
  (defconstant +im-draw-flags-draw-flags-closed+ 1)
  (defconstant +im-draw-flags-draw-flags-round-corners-top-left+ 16)
  (defconstant +im-draw-flags-draw-flags-round-corners-top-right+ 32)
  (defconstant +im-draw-flags-draw-flags-round-corners-bottom-left+ 64)
  (defconstant +im-draw-flags-draw-flags-round-corners-bottom-right+ 128)
  (defconstant +im-draw-flags-draw-flags-round-corners-none+ 256)
  (defconstant +im-draw-flags-draw-flags-round-corners-top+ 48)
  (defconstant +im-draw-flags-draw-flags-round-corners-bottom+ 192)
  (defconstant +im-draw-flags-draw-flags-round-corners-left+ 80)
  (defconstant +im-draw-flags-draw-flags-round-corners-right+ 160)
  (defconstant +im-draw-flags-draw-flags-round-corners-all+ 240)
  (defconstant +im-draw-flags-draw-flags-round-corners-default-+ 240)
  (defconstant +im-draw-flags-draw-flags-round-corners-mask-+ 496)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-draw-list-flags
  (:draw-list-flags-none 0)
  (:draw-list-flags-anti-aliased-lines 1)
  (:draw-list-flags-anti-aliased-lines-use-tex 2)
  (:draw-list-flags-anti-aliased-fill 4)
  (:draw-list-flags-allow-vtx-offset 8)
)

#+ecl
(progn
  (defconstant +im-draw-list-flags-draw-list-flags-none+ 0)
  (defconstant +im-draw-list-flags-draw-list-flags-anti-aliased-lines+ 1)
  (defconstant +im-draw-list-flags-draw-list-flags-anti-aliased-lines-use-tex+ 2)
  (defconstant +im-draw-list-flags-draw-list-flags-anti-aliased-fill+ 4)
  (defconstant +im-draw-list-flags-draw-list-flags-allow-vtx-offset+ 8)
)

#-ecl
(defcenum im-texture-format
  (:texture-format-rgba32 0)
  (:texture-format-alpha8 1)
)

#+ecl
(progn
  (defconstant +im-texture-format-texture-format-rgba32+ 0)
  (defconstant +im-texture-format-texture-format-alpha8+ 1)
)

#-ecl
(defcenum im-texture-status
  (:texture-status-ok 0)
  (:texture-status-destroyed 1)
  (:texture-status-want-create 2)
  (:texture-status-want-updates 3)
  (:texture-status-want-destroy 4)
)

#+ecl
(progn
  (defconstant +im-texture-status-texture-status-ok+ 0)
  (defconstant +im-texture-status-texture-status-destroyed+ 1)
  (defconstant +im-texture-status-texture-status-want-create+ 2)
  (defconstant +im-texture-status-texture-status-want-updates+ 3)
  (defconstant +im-texture-status-texture-status-want-destroy+ 4)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-font-atlas-flags
  (:font-atlas-flags-none 0)
  (:font-atlas-flags-no-power-of-two-height 1)
  (:font-atlas-flags-no-mouse-cursors 2)
  (:font-atlas-flags-no-baked-lines 4)
)

#+ecl
(progn
  (defconstant +im-font-atlas-flags-font-atlas-flags-none+ 0)
  (defconstant +im-font-atlas-flags-font-atlas-flags-no-power-of-two-height+ 1)
  (defconstant +im-font-atlas-flags-font-atlas-flags-no-mouse-cursors+ 2)
  (defconstant +im-font-atlas-flags-font-atlas-flags-no-baked-lines+ 4)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-font-flags
  (:font-flags-none 0)
  (:font-flags-no-load-error 2)
  (:font-flags-no-load-glyphs 4)
  (:font-flags-lock-baked-sizes 8)
)

#+ecl
(progn
  (defconstant +im-font-flags-font-flags-none+ 0)
  (defconstant +im-font-flags-font-flags-no-load-error+ 2)
  (defconstant +im-font-flags-font-flags-no-load-glyphs+ 4)
  (defconstant +im-font-flags-font-flags-lock-baked-sizes+ 8)
)

;; Flags enum (bitfield) - combine with LOGIOR
#-ecl
(defcenum im-viewport-flags
  (:viewport-flags-none 0)
  (:viewport-flags-is-platform-window 1)
  (:viewport-flags-is-platform-monitor 2)
  (:viewport-flags-owned-by-app 4)
)

#+ecl
(progn
  (defconstant +im-viewport-flags-viewport-flags-none+ 0)
  (defconstant +im-viewport-flags-viewport-flags-is-platform-window+ 1)
  (defconstant +im-viewport-flags-viewport-flags-is-platform-monitor+ 2)
  (defconstant +im-viewport-flags-viewport-flags-owned-by-app+ 4)
)

#-ecl
(defctype id :UNSIGNED-INT)

#-ecl
(defcstruct vec2
  (x :FLOAT)
  (y :FLOAT)
)

#-ecl
(defcstruct platform-ime-data
  (want-visible :BOOL)
  (want-text-input :BOOL)
  (input-pos VEC2)
  (input-line-height :FLOAT)
  (viewport-id ID)
)

#-ecl
(defcstruct texture-rect
  (x :UNSIGNED-SHORT)
  (y :UNSIGNED-SHORT)
  (w :UNSIGNED-SHORT)
  (h :UNSIGNED-SHORT)
)

#-ecl
(defcstruct vector-im-texture-rect
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defctype u64 :UNSIGNED-LONG-LONG)

#-ecl
(defctype texture-id U64)

#-ecl
(defcstruct texture-data
  (unique-id :INT)
  (status IM-TEXTURE-STATUS)
  (backend-user-data :POINTER)
  (tex-id TEXTURE-ID)
  (format IM-TEXTURE-FORMAT)
  (width :INT)
  (height :INT)
  (bytes-per-pixel :INT)
  (pixels :POINTER)
  (used-rect TEXTURE-RECT)
  (update-rect TEXTURE-RECT)
  (updates VECTOR-IM-TEXTURE-RECT)
  (unused-frames :INT)
  (ref-count :UNSIGNED-SHORT)
  (use-colors :BOOL)
  (want-destroy-next-frame :BOOL)
)

#-ecl
(defcstruct vector-im-texture-data-ptr
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defctype wchar16 :UNSIGNED-SHORT)

#-ecl
(defctype wchar WCHAR16)

#-ecl
(defcstruct platform-io
  (platform-get-clipboard-text-fn :POINTER)
  (platform-set-clipboard-text-fn :POINTER)
  (platform-clipboard-user-data :POINTER)
  (platform-open-in-shell-fn :POINTER)
  (platform-open-in-shell-user-data :POINTER)
  (platform-set-ime-data-fn :POINTER)
  (platform-ime-user-data :POINTER)
  (platform-locale-decimal-point WCHAR)
  (renderer-texture-max-width :INT)
  (renderer-texture-max-height :INT)
  (renderer-render-state :POINTER)
  (textures VECTOR-IM-TEXTURE-DATA-PTR)
)

#-ecl
(defctype viewport-flags :INT)

#-ecl
(defcstruct viewport
  (id ID)
  (flags VIEWPORT-FLAGS)
  (pos VEC2)
  (size VEC2)
  (framebuffer-scale VEC2)
  (work-pos VEC2)
  (work-size VEC2)
  (platform-handle :POINTER)
  (platform-handle-raw :POINTER)
)

#-ecl
(defcstruct storage-pair
  (key ID)
  (--anonymous-type0 :POINTER)
)

#-ecl
(defcstruct vector-im-gui-storage-pair
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct storage
  (data VECTOR-IM-GUI-STORAGE-PAIR)
)

#-ecl
(defctype u8 :UNSIGNED-CHAR)

#-ecl
(defctype font-flags :INT)

#-ecl
(defctype u32 :UNSIGNED-INT)

#-ecl
(defctype s8 :CHAR)

#-ecl
(defcstruct font-config
  (name :CHAR :count 40)
  (font-data :POINTER)
  (font-data-size :INT)
  (font-data-owned-by-atlas :BOOL)
  (merge-mode :BOOL)
  (pixel-snap-h :BOOL)
  (pixel-snap-v :BOOL)
  (oversample-h S8)
  (oversample-v S8)
  (ellipsis-char WCHAR)
  (size-pixels :FLOAT)
  (glyph-ranges :POINTER)
  (glyph-exclude-ranges :POINTER)
  (glyph-offset VEC2)
  (glyph-min-advance-x :FLOAT)
  (glyph-max-advance-x :FLOAT)
  (glyph-extra-advance-x :FLOAT)
  (font-no U32)
  (font-loader-flags :UNSIGNED-INT)
  (rasterizer-multiply :FLOAT)
  (rasterizer-density :FLOAT)
  (flags FONT-FLAGS)
  (dst-font :POINTER)
  (font-loader :POINTER)
  (font-loader-data :POINTER)
)

#-ecl
(defcstruct vector-im-font-config-ptr
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct font-atlas-rect
  (x :UNSIGNED-SHORT)
  (y :UNSIGNED-SHORT)
  (w :UNSIGNED-SHORT)
  (h :UNSIGNED-SHORT)
  (uv0 VEC2)
  (uv1 VEC2)
)

#-ecl
(defcstruct vector-im-draw-list-shared-data-ptr
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct vec4
  (x :FLOAT)
  (y :FLOAT)
  (z :FLOAT)
  (w :FLOAT)
)

#-ecl
(defcstruct vector-im-font-config
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct vector-im-font-ptr
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct texture-ref
  (-tex-data :POINTER)
  (-tex-id TEXTURE-ID)
)

#-ecl
(defctype font-atlas-flags :INT)

#-ecl
(defcstruct font-atlas
  (flags FONT-ATLAS-FLAGS)
  (tex-desired-format IM-TEXTURE-FORMAT)
  (tex-glyph-padding :INT)
  (tex-min-width :INT)
  (tex-min-height :INT)
  (tex-max-width :INT)
  (tex-max-height :INT)
  (user-data :POINTER)
  (tex-ref TEXTURE-REF)
  (--anonymous-type1 :POINTER)
  (tex-data :POINTER)
  (tex-list VECTOR-IM-TEXTURE-DATA-PTR)
  (locked :BOOL)
  (renderer-has-textures :BOOL)
  (tex-is-built :BOOL)
  (tex-pixels-use-colors :BOOL)
  (tex-uv-scale VEC2)
  (tex-uv-white-pixel VEC2)
  (fonts VECTOR-IM-FONT-PTR)
  (sources VECTOR-IM-FONT-CONFIG)
  (tex-uv-lines :pointer) ; Array with complex bounds: IM_DRAWLIST_TEX_LINES_WIDTH_MAX+1
  (tex-next-unique-id :INT)
  (font-next-unique-id :INT)
  (draw-list-shared-datas VECTOR-IM-DRAW-LIST-SHARED-DATA-PTR)
  (builder :POINTER)
  (font-loader :POINTER)
  (font-loader-name :STRING)
  (font-loader-data :POINTER)
  (font-loader-flags :UNSIGNED-INT)
  (ref-count :INT)
  (owner-context :POINTER)
  (temp-rect FONT-ATLAS-RECT)
)

#-ecl
(defcstruct font-glyph
  (colored :UNSIGNED-INT)
  (visible :UNSIGNED-INT)
  (source-idx :UNSIGNED-INT)
  (codepoint :UNSIGNED-INT)
  (advance-x :FLOAT)
  (x0 :FLOAT)
  (y0 :FLOAT)
  (x1 :FLOAT)
  (y1 :FLOAT)
  (u0 :FLOAT)
  (v0 :FLOAT)
  (u1 :FLOAT)
  (v1 :FLOAT)
  (pack-id :INT)
)

#-ecl
(defcstruct vector-im-font-glyph
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defctype u16 :UNSIGNED-SHORT)

#-ecl
(defcstruct vector-im-u16
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct vector-float
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct font-baked
  (index-advance-x VECTOR-FLOAT)
  (fallback-advance-x :FLOAT)
  (size :FLOAT)
  (rasterizer-density :FLOAT)
  (index-lookup VECTOR-IM-U16)
  (glyphs VECTOR-IM-FONT-GLYPH)
  (fallback-glyph-index :INT)
  (ascent :FLOAT)
  (descent :FLOAT)
  (metrics-total-surface :UNSIGNED-INT)
  (want-destroy :UNSIGNED-INT)
  (load-no-fallback :UNSIGNED-INT)
  (load-no-render-on-layout :UNSIGNED-INT)
  (last-used-frame :INT)
  (baked-id ID)
  (owner-font :POINTER)
  (font-loader-datas :POINTER)
)

#-ecl
(defcstruct font
  (last-baked :POINTER)
  (owner-atlas :POINTER)
  (flags FONT-FLAGS)
  (current-rasterizer-density :FLOAT)
  (font-id ID)
  (legacy-size :FLOAT)
  (sources VECTOR-IM-FONT-CONFIG-PTR)
  (ellipsis-char WCHAR)
  (fallback-char WCHAR)
  (used8k-pages-map :pointer) ; Array with complex bounds: (IM_UNICODE_CODEPOINT_MAX +1)/8192/8
  (ellipsis-auto-bake :BOOL)
  (remap-pairs STORAGE)
  (scale :FLOAT)
)

#-ecl
(defcstruct vector-im-u32
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct font-glyph-ranges-builder
  (used-chars VECTOR-IM-U32)
)

#-ecl
(defcstruct vector-im-u8
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct vector-im-texture-ref
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct vector-im-vec4
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defctype draw-idx :UNSIGNED-SHORT)

#-ecl
(defcstruct vector-im-draw-idx
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defctype draw-callback :POINTER)

#-ecl
(defcstruct draw-cmd
  (clip-rect VEC4)
  (tex-ref TEXTURE-REF)
  (vtx-offset :UNSIGNED-INT)
  (idx-offset :UNSIGNED-INT)
  (elem-count :UNSIGNED-INT)
  (user-callback DRAW-CALLBACK)
  (user-callback-data :POINTER)
  (user-callback-data-size :INT)
  (user-callback-data-offset :INT)
)

#-ecl
(defcstruct vector-im-draw-cmd
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct draw-channel
  (-cmd-buffer VECTOR-IM-DRAW-CMD)
  (-idx-buffer VECTOR-IM-DRAW-IDX)
)

#-ecl
(defcstruct vector-im-draw-channel
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct draw-list-splitter
  (-current :INT)
  (-count :INT)
  (-channels VECTOR-IM-DRAW-CHANNEL)
)

#-ecl
(defcstruct draw-cmd-header
  (clip-rect VEC4)
  (tex-ref TEXTURE-REF)
  (vtx-offset :UNSIGNED-INT)
)

#-ecl
(defcstruct vector-im-vec2
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct draw-vert
  (pos VEC2)
  (uv VEC2)
  (col U32)
)

#-ecl
(defctype draw-list-flags :INT)

#-ecl
(defcstruct vector-im-draw-vert
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct draw-list
  (cmd-buffer VECTOR-IM-DRAW-CMD)
  (idx-buffer VECTOR-IM-DRAW-IDX)
  (vtx-buffer VECTOR-IM-DRAW-VERT)
  (flags DRAW-LIST-FLAGS)
  (-vtx-current-idx :UNSIGNED-INT)
  (-data :POINTER)
  (-vtx-write-ptr :POINTER)
  (-idx-write-ptr :POINTER)
  (-path VECTOR-IM-VEC2)
  (-cmd-header DRAW-CMD-HEADER)
  (-splitter DRAW-LIST-SPLITTER)
  (-clip-rect-stack VECTOR-IM-VEC4)
  (-texture-stack VECTOR-IM-TEXTURE-REF)
  (-callbacks-data-buf VECTOR-IM-U8)
  (-fringe-scale :FLOAT)
  (-owner-name :STRING)
)

#-ecl
(defcstruct vector-im-draw-list-ptr
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct draw-data
  (valid :BOOL)
  (cmd-lists-count :INT)
  (total-idx-count :INT)
  (total-vtx-count :INT)
  (cmd-lists VECTOR-IM-DRAW-LIST-PTR)
  (display-pos VEC2)
  (display-size VEC2)
  (framebuffer-scale VEC2)
  (owner-viewport :POINTER)
  (textures :POINTER)
)

#-ecl
(defcstruct selection-external-storage
  (user-data :POINTER)
  (adapter-set-item-selected :POINTER)
)

#-ecl
(defcstruct selection-basic-storage
  (size :INT)
  (preserve-order :BOOL)
  (user-data :POINTER)
  (adapter-index-to-storage-id :POINTER)
  (-selection-order :INT)
  (-storage STORAGE)
)

#-ecl
(defctype s64 :LONG-LONG)

#-ecl
(defctype selection-user-data S64)

#-ecl
(defcstruct selection-request
  (type IM-SELECTION-REQUEST-TYPE)
  (selected :BOOL)
  (range-direction S8)
  (range-first-item SELECTION-USER-DATA)
  (range-last-item SELECTION-USER-DATA)
)

#-ecl
(defcstruct vector-im-gui-selection-request
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct multi-select-io
  (requests VECTOR-IM-GUI-SELECTION-REQUEST)
  (range-src-item SELECTION-USER-DATA)
  (nav-id-item SELECTION-USER-DATA)
  (nav-id-selected :BOOL)
  (range-src-reset :BOOL)
  (items-count :INT)
)

#-ecl
(defcstruct color
  (value VEC4)
)

#-ecl
(defctype list-clipper-flags :INT)

#-ecl
(defcstruct list-clipper
  (ctx :POINTER)
  (display-start :INT)
  (display-end :INT)
  (items-count :INT)
  (items-height :FLOAT)
  (start-pos-y :DOUBLE)
  (start-seek-offset-y :DOUBLE)
  (temp-data :POINTER)
  (flags LIST-CLIPPER-FLAGS)
)

#-ecl
(defcstruct vector-char
  (size :INT)
  (capacity :INT)
  (data :STRING)
)

#-ecl
(defcstruct text-buffer
  (buf VECTOR-CHAR)
)

#-ecl
(defcstruct text-filter-im-gui-text-range
  (b :STRING)
  (e :STRING)
)

#-ecl
(defcstruct vector-im-gui-text-range
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct text-filter
  (input-buf :CHAR :count 256)
  (filters VECTOR-IM-GUI-TEXT-RANGE)
  (count-grep :INT)
)

#-ecl
(defcstruct payload
  (data :POINTER)
  (data-size :INT)
  (source-id ID)
  (source-parent-id ID)
  (data-frame-count :INT)
  (data-type :CHAR :count 32)
  (preview :BOOL)
  (delivery :BOOL)
)

#-ecl
(defcstruct size-callback-data
  (user-data :POINTER)
  (pos VEC2)
  (current-size VEC2)
  (desired-size VEC2)
)

#-ecl
(defctype key :INT)

#-ecl
(defctype input-text-flags :INT)

#-ecl
(defcstruct input-text-callback-data
  (ctx :POINTER)
  (event-flag INPUT-TEXT-FLAGS)
  (flags INPUT-TEXT-FLAGS)
  (user-data :POINTER)
  (event-char WCHAR)
  (event-key IM-KEY)
  (buf :STRING)
  (buf-text-len :INT)
  (buf-size :INT)
  (buf-dirty :BOOL)
  (cursor-pos :INT)
  (selection-start :INT)
  (selection-end :INT)
)

#-ecl
(defcstruct vector-im-wchar
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

#-ecl
(defcstruct key-data
  (down :BOOL)
  (down-duration :FLOAT)
  (down-duration-prev :FLOAT)
  (analog-value :FLOAT)
)

#-ecl
(defctype key-chord :INT)

#-ecl
(defctype mouse-source :INT)

#-ecl
(defctype backend-flags :INT)

#-ecl
(defctype config-flags :INT)

#-ecl
(defcstruct io
  (config-flags CONFIG-FLAGS)
  (backend-flags BACKEND-FLAGS)
  (display-size VEC2)
  (display-framebuffer-scale VEC2)
  (delta-time :FLOAT)
  (ini-saving-rate :FLOAT)
  (ini-filename :STRING)
  (log-filename :STRING)
  (user-data :POINTER)
  (fonts :POINTER)
  (font-default :POINTER)
  (font-allow-user-scaling :BOOL)
  (config-nav-swap-gamepad-buttons :BOOL)
  (config-nav-move-set-mouse-pos :BOOL)
  (config-nav-capture-keyboard :BOOL)
  (config-nav-escape-clear-focus-item :BOOL)
  (config-nav-escape-clear-focus-window :BOOL)
  (config-nav-cursor-visible-auto :BOOL)
  (config-nav-cursor-visible-always :BOOL)
  (mouse-draw-cursor :BOOL)
  (config-mac-osxbehaviors :BOOL)
  (config-input-trickle-event-queue :BOOL)
  (config-input-text-cursor-blink :BOOL)
  (config-input-text-enter-keep-active :BOOL)
  (config-drag-click-to-input-text :BOOL)
  (config-windows-resize-from-edges :BOOL)
  (config-windows-move-from-title-bar-only :BOOL)
  (config-windows-copy-contents-with-ctrl-c :BOOL)
  (config-scrollbar-scroll-by-page :BOOL)
  (config-memory-compact-timer :FLOAT)
  (mouse-double-click-time :FLOAT)
  (mouse-double-click-max-dist :FLOAT)
  (mouse-drag-threshold :FLOAT)
  (key-repeat-delay :FLOAT)
  (key-repeat-rate :FLOAT)
  (config-error-recovery :BOOL)
  (config-error-recovery-enable-assert :BOOL)
  (config-error-recovery-enable-debug-log :BOOL)
  (config-error-recovery-enable-tooltip :BOOL)
  (config-debug-is-debugger-present :BOOL)
  (config-debug-highlight-id-conflicts :BOOL)
  (config-debug-highlight-id-conflicts-show-item-picker :BOOL)
  (config-debug-begin-return-value-once :BOOL)
  (config-debug-begin-return-value-loop :BOOL)
  (config-debug-ignore-focus-loss :BOOL)
  (config-debug-ini-settings :BOOL)
  (backend-platform-name :STRING)
  (backend-renderer-name :STRING)
  (backend-platform-user-data :POINTER)
  (backend-renderer-user-data :POINTER)
  (backend-language-user-data :POINTER)
  (want-capture-mouse :BOOL)
  (want-capture-keyboard :BOOL)
  (want-text-input :BOOL)
  (want-set-mouse-pos :BOOL)
  (want-save-ini-settings :BOOL)
  (nav-active :BOOL)
  (nav-visible :BOOL)
  (framerate :FLOAT)
  (metrics-render-vertices :INT)
  (metrics-render-indices :INT)
  (metrics-render-windows :INT)
  (metrics-active-windows :INT)
  (mouse-delta VEC2)
  (ctx :POINTER)
  (mouse-pos VEC2)
  (mouse-down :BOOL :count 5)
  (mouse-wheel :FLOAT)
  (mouse-wheel-h :FLOAT)
  (mouse-source IM-MOUSE-SOURCE)
  (key-ctrl :BOOL)
  (key-shift :BOOL)
  (key-alt :BOOL)
  (key-super :BOOL)
  (key-mods KEY-CHORD)
  (keys-data :pointer) ; Array with complex bounds: ImGuiKey_NamedKey_COUNT
  (want-capture-mouse-unless-popup-close :BOOL)
  (mouse-pos-prev VEC2)
  (mouse-clicked-pos VEC2 :count 5)
  (mouse-clicked-time :DOUBLE :count 5)
  (mouse-clicked :BOOL :count 5)
  (mouse-double-clicked :BOOL :count 5)
  (mouse-clicked-count U16 :count 5)
  (mouse-clicked-last-count U16 :count 5)
  (mouse-released :BOOL :count 5)
  (mouse-released-time :DOUBLE :count 5)
  (mouse-down-owned :BOOL :count 5)
  (mouse-down-owned-unless-popup-close :BOOL :count 5)
  (mouse-wheel-request-axis-swap :BOOL)
  (mouse-ctrl-left-as-right-click :BOOL)
  (mouse-down-duration :FLOAT :count 5)
  (mouse-down-duration-prev :FLOAT :count 5)
  (mouse-drag-max-distance-sqr :FLOAT :count 5)
  (pen-pressure :FLOAT)
  (app-focus-lost :BOOL)
  (app-accepting-events :BOOL)
  (input-queue-surrogate WCHAR16)
  (input-queue-characters VECTOR-IM-WCHAR)
  (font-global-scale :FLOAT)
  (get-clipboard-text-fn :POINTER)
  (set-clipboard-text-fn :POINTER)
  (clipboard-user-data :POINTER)
)

#-ecl
(defctype hovered-flags :INT)

#-ecl
(defctype tree-node-flags :INT)

#-ecl
(defctype dir :INT)

#-ecl
(defcstruct style
  (font-size-base :FLOAT)
  (font-scale-main :FLOAT)
  (font-scale-dpi :FLOAT)
  (alpha :FLOAT)
  (disabled-alpha :FLOAT)
  (window-padding VEC2)
  (window-rounding :FLOAT)
  (window-border-size :FLOAT)
  (window-border-hover-padding :FLOAT)
  (window-min-size VEC2)
  (window-title-align VEC2)
  (window-menu-button-position IM-DIR)
  (child-rounding :FLOAT)
  (child-border-size :FLOAT)
  (popup-rounding :FLOAT)
  (popup-border-size :FLOAT)
  (frame-padding VEC2)
  (frame-rounding :FLOAT)
  (frame-border-size :FLOAT)
  (item-spacing VEC2)
  (item-inner-spacing VEC2)
  (cell-padding VEC2)
  (touch-extra-padding VEC2)
  (indent-spacing :FLOAT)
  (columns-min-spacing :FLOAT)
  (scrollbar-size :FLOAT)
  (scrollbar-rounding :FLOAT)
  (scrollbar-padding :FLOAT)
  (grab-min-size :FLOAT)
  (grab-rounding :FLOAT)
  (log-slider-deadzone :FLOAT)
  (image-border-size :FLOAT)
  (tab-rounding :FLOAT)
  (tab-border-size :FLOAT)
  (tab-min-width-base :FLOAT)
  (tab-min-width-shrink :FLOAT)
  (tab-close-button-min-width-selected :FLOAT)
  (tab-close-button-min-width-unselected :FLOAT)
  (tab-bar-border-size :FLOAT)
  (tab-bar-overline-size :FLOAT)
  (table-angled-headers-angle :FLOAT)
  (table-angled-headers-text-align VEC2)
  (tree-lines-flags TREE-NODE-FLAGS)
  (tree-lines-size :FLOAT)
  (tree-lines-rounding :FLOAT)
  (drag-drop-target-rounding :FLOAT)
  (drag-drop-target-border-size :FLOAT)
  (drag-drop-target-padding :FLOAT)
  (color-marker-size :FLOAT)
  (color-button-position IM-DIR)
  (button-text-align VEC2)
  (selectable-text-align VEC2)
  (separator-text-border-size :FLOAT)
  (separator-text-align VEC2)
  (separator-text-padding VEC2)
  (display-window-padding VEC2)
  (display-safe-area-padding VEC2)
  (mouse-cursor-scale :FLOAT)
  (anti-aliased-lines :BOOL)
  (anti-aliased-lines-use-tex :BOOL)
  (anti-aliased-fill :BOOL)
  (curve-tessellation-tol :FLOAT)
  (circle-tessellation-max-error :FLOAT)
  (colors :pointer) ; Array with complex bounds: ImGuiCol_COUNT
  (hover-stationary-delay :FLOAT)
  (hover-delay-short :FLOAT)
  (hover-delay-normal :FLOAT)
  (hover-flags-for-tooltip-mouse HOVERED-FLAGS)
  (hover-flags-for-tooltip-nav HOVERED-FLAGS)
  (-main-scale :FLOAT)
  (-next-frame-font-size-base :FLOAT)
)

#-ecl
(defctype sort-direction U8)

#-ecl
(defctype s16 :SHORT)

#-ecl
(defcstruct table-column-sort-specs
  (column-user-id ID)
  (column-index S16)
  (sort-order S16)
  (sort-direction IM-SORT-DIRECTION)
)

#-ecl
(defcstruct table-sort-specs
  (specs :POINTER)
  (specs-count :INT)
  (specs-dirty :BOOL)
)

#-ecl
(defctype font-atlas-custom-rect FONT-ATLAS-RECT)

#-ecl
(defctype font-atlas-rect-id :INT)

#-ecl
(defctype mem-free-func :POINTER)

#-ecl
(defctype mem-alloc-func :POINTER)

#-ecl
(defctype size-callback :POINTER)

#-ecl
(defctype input-text-callback :POINTER)

#-ecl
(defctype wchar32 :UNSIGNED-INT)

#-ecl
(defctype window-flags :INT)

#-ecl
(defctype table-row-flags :INT)

#-ecl
(defctype table-column-flags :INT)

#-ecl
(defctype table-flags :INT)

#-ecl
(defctype tab-item-flags :INT)

#-ecl
(defctype tab-bar-flags :INT)

#-ecl
(defctype slider-flags :INT)

#-ecl
(defctype selectable-flags :INT)

#-ecl
(defctype multi-select-flags :INT)

#-ecl
(defctype popup-flags :INT)

#-ecl
(defctype item-flags :INT)

#-ecl
(defctype input-flags :INT)

#-ecl
(defctype focused-flags :INT)

#-ecl
(defctype drag-drop-flags :INT)

#-ecl
(defctype combo-flags :INT)

#-ecl
(defctype color-edit-flags :INT)

#-ecl
(defctype child-flags :INT)

#-ecl
(defctype button-flags :INT)

#-ecl
(defctype draw-text-flags :INT)

#-ecl
(defctype draw-flags :INT)

#-ecl
(defctype table-bg-target :INT)

#-ecl
(defctype style-var :INT)

#-ecl
(defctype mouse-cursor :INT)

#-ecl
(defctype mouse-button :INT)

#-ecl
(defctype data-type :INT)

#-ecl
(defctype cond :INT)

#-ecl
(defctype col :INT)

#-ecl
(defctype s32 :INT)

#-ecl
(defcfun ("ImTextureRef_GetTexID" texture-ref-get-tex-id) TEXTURE-ID
  (self :POINTER)
)

#+ecl
(defun texture-ref-get-tex-id (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImTextureRef_GetTexID(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_CreateContext" create-context) :POINTER
  (shared-font-atlas :POINTER)
)

#+ecl
(defun create-context (shared-font-atlas)
  (ffi:c-inline (shared-font-atlas) (:POINTER-VOID) :POINTER-VOID
    "ImGui_CreateContext(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DestroyContext" destroy-context) :VOID
  (ctx :POINTER)
)

#+ecl
(defun destroy-context (ctx)
  (ffi:c-inline (ctx) (:POINTER-VOID) :VOID
    "ImGui_DestroyContext(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetCurrentContext" get-current-context) :POINTER)

#+ecl
(defun get-current-context ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetCurrentContext()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetCurrentContext" set-current-context) :VOID
  (ctx :POINTER)
)

#+ecl
(defun set-current-context (ctx)
  (ffi:c-inline (ctx) (:POINTER-VOID) :VOID
    "ImGui_SetCurrentContext(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetIO" get-io) :POINTER)

#+ecl
(defun get-io ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetIO()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetPlatformIO" get-platform-io) :POINTER)

#+ecl
(defun get-platform-io ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetPlatformIO()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetStyle" get-style) :POINTER)

#+ecl
(defun get-style ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetStyle()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_NewFrame" new-frame) :VOID)

#+ecl
(defun new-frame ()
  (ffi:c-inline () () :VOID
    "ImGui_NewFrame()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndFrame" end-frame) :VOID)

#+ecl
(defun end-frame ()
  (ffi:c-inline () () :VOID
    "ImGui_EndFrame()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Render" render) :VOID)

#+ecl
(defun render ()
  (ffi:c-inline () () :VOID
    "ImGui_Render()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetDrawData" get-draw-data) :POINTER)

#+ecl
(defun get-draw-data ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetDrawData()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowDemoWindow" show-demo-window) :VOID
  (p-open :POINTER)
)

#+ecl
(defun show-demo-window (p-open)
  (ffi:c-inline (p-open) (:POINTER-VOID) :VOID
    "ImGui_ShowDemoWindow(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowMetricsWindow" show-metrics-window) :VOID
  (p-open :POINTER)
)

#+ecl
(defun show-metrics-window (p-open)
  (ffi:c-inline (p-open) (:POINTER-VOID) :VOID
    "ImGui_ShowMetricsWindow(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowDebugLogWindow" show-debug-log-window) :VOID
  (p-open :POINTER)
)

#+ecl
(defun show-debug-log-window (p-open)
  (ffi:c-inline (p-open) (:POINTER-VOID) :VOID
    "ImGui_ShowDebugLogWindow(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowIDStackToolWindow" show-idstack-tool-window) :VOID)

#+ecl
(defun show-idstack-tool-window ()
  (ffi:c-inline () () :VOID
    "ImGui_ShowIDStackToolWindow()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowIDStackToolWindowEx" show-idstack-tool-window-ex) :VOID
  (p-open :POINTER)
)

#+ecl
(defun show-idstack-tool-window-ex (p-open)
  (ffi:c-inline (p-open) (:POINTER-VOID) :VOID
    "ImGui_ShowIDStackToolWindowEx(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowAboutWindow" show-about-window) :VOID
  (p-open :POINTER)
)

#+ecl
(defun show-about-window (p-open)
  (ffi:c-inline (p-open) (:POINTER-VOID) :VOID
    "ImGui_ShowAboutWindow(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowStyleEditor" show-style-editor) :VOID
  (ref :POINTER)
)

#+ecl
(defun show-style-editor (ref)
  (ffi:c-inline (ref) (:POINTER-VOID) :VOID
    "ImGui_ShowStyleEditor(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowStyleSelector" show-style-selector) :BOOL
  (label :STRING)
)

#+ecl
(defun show-style-selector (label)
  (ffi:c-inline (label) (:CSTRING) :BOOL
    "ImGui_ShowStyleSelector(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowFontSelector" show-font-selector) :VOID
  (label :STRING)
)

#+ecl
(defun show-font-selector (label)
  (ffi:c-inline (label) (:CSTRING) :VOID
    "ImGui_ShowFontSelector(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowUserGuide" show-user-guide) :VOID)

#+ecl
(defun show-user-guide ()
  (ffi:c-inline () () :VOID
    "ImGui_ShowUserGuide()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetVersion" get-version) :STRING)

#+ecl
(defun get-version ()
  (ffi:c-inline () () :CSTRING
    "ImGui_GetVersion()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_StyleColorsDark" style-colors-dark) :VOID
  (dst :POINTER)
)

#+ecl
(defun style-colors-dark (dst)
  (ffi:c-inline (dst) (:POINTER-VOID) :VOID
    "ImGui_StyleColorsDark(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_StyleColorsLight" style-colors-light) :VOID
  (dst :POINTER)
)

#+ecl
(defun style-colors-light (dst)
  (ffi:c-inline (dst) (:POINTER-VOID) :VOID
    "ImGui_StyleColorsLight(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_StyleColorsClassic" style-colors-classic) :VOID
  (dst :POINTER)
)

#+ecl
(defun style-colors-classic (dst)
  (ffi:c-inline (dst) (:POINTER-VOID) :VOID
    "ImGui_StyleColorsClassic(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Begin" begin) :BOOL
  (name :STRING)
  (p-open :POINTER)
  (flags WINDOW-FLAGS)
)

#+ecl
(defun begin (name p-open flags)
  (ffi:c-inline (name p-open flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_Begin(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_End" end) :VOID)

#+ecl
(defun end ()
  (ffi:c-inline () () :VOID
    "ImGui_End()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndChild" end-child) :VOID)

#+ecl
(defun end-child ()
  (ffi:c-inline () () :VOID
    "ImGui_EndChild()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsWindowAppearing" is-window-appearing) :BOOL)

#+ecl
(defun is-window-appearing ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsWindowAppearing()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsWindowCollapsed" is-window-collapsed) :BOOL)

#+ecl
(defun is-window-collapsed ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsWindowCollapsed()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsWindowFocused" is-window-focused) :BOOL
  (flags FOCUSED-FLAGS)
)

#+ecl
(defun is-window-focused (flags)
  (ffi:c-inline (flags) (:INT) :BOOL
    "ImGui_IsWindowFocused(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsWindowHovered" is-window-hovered) :BOOL
  (flags HOVERED-FLAGS)
)

#+ecl
(defun is-window-hovered (flags)
  (ffi:c-inline (flags) (:INT) :BOOL
    "ImGui_IsWindowHovered(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetWindowDrawList" get-window-draw-list) :POINTER)

#+ecl
(defun get-window-draw-list ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetWindowDrawList()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetWindowPos" get-window-pos) VEC2)

#+ecl
(defun get-window-pos ()
  (ffi:c-inline () () :INT
    "ImGui_GetWindowPos()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetWindowSize" get-window-size) VEC2)

#+ecl
(defun get-window-size ()
  (ffi:c-inline () () :INT
    "ImGui_GetWindowSize()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetWindowWidth" get-window-width) :FLOAT)

#+ecl
(defun get-window-width ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetWindowWidth()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetWindowHeight" get-window-height) :FLOAT)

#+ecl
(defun get-window-height ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetWindowHeight()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextWindowCollapsed" set-next-window-collapsed) :VOID
  (collapsed :BOOL)
  (cond COND)
)

#+ecl
(defun set-next-window-collapsed (collapsed cond)
  (ffi:c-inline (collapsed cond) (:BOOL :INT) :VOID
    "ImGui_SetNextWindowCollapsed(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextWindowFocus" set-next-window-focus) :VOID)

#+ecl
(defun set-next-window-focus ()
  (ffi:c-inline () () :VOID
    "ImGui_SetNextWindowFocus()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextWindowBgAlpha" set-next-window-bg-alpha) :VOID
  (alpha :FLOAT)
)

#+ecl
(defun set-next-window-bg-alpha (alpha)
  (ffi:c-inline (alpha) (:FLOAT) :VOID
    "ImGui_SetNextWindowBgAlpha(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetWindowCollapsed" set-window-collapsed) :VOID
  (collapsed :BOOL)
  (cond COND)
)

#+ecl
(defun set-window-collapsed (collapsed cond)
  (ffi:c-inline (collapsed cond) (:BOOL :INT) :VOID
    "ImGui_SetWindowCollapsed(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetWindowFocus" set-window-focus) :VOID)

#+ecl
(defun set-window-focus ()
  (ffi:c-inline () () :VOID
    "ImGui_SetWindowFocus()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetWindowCollapsedStr" set-window-collapsed-str) :VOID
  (name :STRING)
  (collapsed :BOOL)
  (cond COND)
)

#+ecl
(defun set-window-collapsed-str (name collapsed cond)
  (ffi:c-inline (name collapsed cond) (:CSTRING :BOOL :INT) :VOID
    "ImGui_SetWindowCollapsedStr(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetWindowFocusStr" set-window-focus-str) :VOID
  (name :STRING)
)

#+ecl
(defun set-window-focus-str (name)
  (ffi:c-inline (name) (:CSTRING) :VOID
    "ImGui_SetWindowFocusStr(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetScrollX" get-scroll-x) :FLOAT)

#+ecl
(defun get-scroll-x ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetScrollX()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetScrollY" get-scroll-y) :FLOAT)

#+ecl
(defun get-scroll-y ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetScrollY()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetScrollX" set-scroll-x) :VOID
  (scroll-x :FLOAT)
)

#+ecl
(defun set-scroll-x (scroll-x)
  (ffi:c-inline (scroll-x) (:FLOAT) :VOID
    "ImGui_SetScrollX(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetScrollY" set-scroll-y) :VOID
  (scroll-y :FLOAT)
)

#+ecl
(defun set-scroll-y (scroll-y)
  (ffi:c-inline (scroll-y) (:FLOAT) :VOID
    "ImGui_SetScrollY(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetScrollMaxX" get-scroll-max-x) :FLOAT)

#+ecl
(defun get-scroll-max-x ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetScrollMaxX()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetScrollMaxY" get-scroll-max-y) :FLOAT)

#+ecl
(defun get-scroll-max-y ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetScrollMaxY()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetScrollHereX" set-scroll-here-x) :VOID
  (center-x-ratio :FLOAT)
)

#+ecl
(defun set-scroll-here-x (center-x-ratio)
  (ffi:c-inline (center-x-ratio) (:FLOAT) :VOID
    "ImGui_SetScrollHereX(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetScrollHereY" set-scroll-here-y) :VOID
  (center-y-ratio :FLOAT)
)

#+ecl
(defun set-scroll-here-y (center-y-ratio)
  (ffi:c-inline (center-y-ratio) (:FLOAT) :VOID
    "ImGui_SetScrollHereY(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetScrollFromPosX" set-scroll-from-pos-x) :VOID
  (local-x :FLOAT)
  (center-x-ratio :FLOAT)
)

#+ecl
(defun set-scroll-from-pos-x (local-x center-x-ratio)
  (ffi:c-inline (local-x center-x-ratio) (:FLOAT :FLOAT) :VOID
    "ImGui_SetScrollFromPosX(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetScrollFromPosY" set-scroll-from-pos-y) :VOID
  (local-y :FLOAT)
  (center-y-ratio :FLOAT)
)

#+ecl
(defun set-scroll-from-pos-y (local-y center-y-ratio)
  (ffi:c-inline (local-y center-y-ratio) (:FLOAT :FLOAT) :VOID
    "ImGui_SetScrollFromPosY(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushFontFloat" push-font-float) :VOID
  (font :POINTER)
  (font-size-base-unscaled :FLOAT)
)

#+ecl
(defun push-font-float (font font-size-base-unscaled)
  (ffi:c-inline (font font-size-base-unscaled) (:POINTER-VOID :FLOAT) :VOID
    "ImGui_PushFontFloat(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopFont" pop-font) :VOID)

#+ecl
(defun pop-font ()
  (ffi:c-inline () () :VOID
    "ImGui_PopFont()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetFont" get-font) :POINTER)

#+ecl
(defun get-font ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetFont()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetFontSize" get-font-size) :FLOAT)

#+ecl
(defun get-font-size ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetFontSize()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetFontBaked" get-font-baked) :POINTER)

#+ecl
(defun get-font-baked ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetFontBaked()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushStyleColor" push-style-color) :VOID
  (idx COL)
  (col U32)
)

#+ecl
(defun push-style-color (idx col)
  (ffi:c-inline (idx col) (:INT :INT) :VOID
    "ImGui_PushStyleColor(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopStyleColor" pop-style-color) :VOID)

#+ecl
(defun pop-style-color ()
  (ffi:c-inline () () :VOID
    "ImGui_PopStyleColor()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopStyleColorEx" pop-style-color-ex) :VOID
  (count :INT)
)

#+ecl
(defun pop-style-color-ex (count)
  (ffi:c-inline (count) (:INT) :VOID
    "ImGui_PopStyleColorEx(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushStyleVar" push-style-var) :VOID
  (idx STYLE-VAR)
  (val :FLOAT)
)

#+ecl
(defun push-style-var (idx val)
  (ffi:c-inline (idx val) (:INT :FLOAT) :VOID
    "ImGui_PushStyleVar(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushStyleVarX" push-style-var-x) :VOID
  (idx STYLE-VAR)
  (val-x :FLOAT)
)

#+ecl
(defun push-style-var-x (idx val-x)
  (ffi:c-inline (idx val-x) (:INT :FLOAT) :VOID
    "ImGui_PushStyleVarX(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushStyleVarY" push-style-var-y) :VOID
  (idx STYLE-VAR)
  (val-y :FLOAT)
)

#+ecl
(defun push-style-var-y (idx val-y)
  (ffi:c-inline (idx val-y) (:INT :FLOAT) :VOID
    "ImGui_PushStyleVarY(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopStyleVar" pop-style-var) :VOID)

#+ecl
(defun pop-style-var ()
  (ffi:c-inline () () :VOID
    "ImGui_PopStyleVar()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopStyleVarEx" pop-style-var-ex) :VOID
  (count :INT)
)

#+ecl
(defun pop-style-var-ex (count)
  (ffi:c-inline (count) (:INT) :VOID
    "ImGui_PopStyleVarEx(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushItemFlag" push-item-flag) :VOID
  (option ITEM-FLAGS)
  (enabled :BOOL)
)

#+ecl
(defun push-item-flag (option enabled)
  (ffi:c-inline (option enabled) (:INT :BOOL) :VOID
    "ImGui_PushItemFlag(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopItemFlag" pop-item-flag) :VOID)

#+ecl
(defun pop-item-flag ()
  (ffi:c-inline () () :VOID
    "ImGui_PopItemFlag()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushItemWidth" push-item-width) :VOID
  (item-width :FLOAT)
)

#+ecl
(defun push-item-width (item-width)
  (ffi:c-inline (item-width) (:FLOAT) :VOID
    "ImGui_PushItemWidth(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopItemWidth" pop-item-width) :VOID)

#+ecl
(defun pop-item-width ()
  (ffi:c-inline () () :VOID
    "ImGui_PopItemWidth()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextItemWidth" set-next-item-width) :VOID
  (item-width :FLOAT)
)

#+ecl
(defun set-next-item-width (item-width)
  (ffi:c-inline (item-width) (:FLOAT) :VOID
    "ImGui_SetNextItemWidth(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_CalcItemWidth" calc-item-width) :FLOAT)

#+ecl
(defun calc-item-width ()
  (ffi:c-inline () () :FLOAT
    "ImGui_CalcItemWidth()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushTextWrapPos" push-text-wrap-pos) :VOID
  (wrap-local-pos-x :FLOAT)
)

#+ecl
(defun push-text-wrap-pos (wrap-local-pos-x)
  (ffi:c-inline (wrap-local-pos-x) (:FLOAT) :VOID
    "ImGui_PushTextWrapPos(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopTextWrapPos" pop-text-wrap-pos) :VOID)

#+ecl
(defun pop-text-wrap-pos ()
  (ffi:c-inline () () :VOID
    "ImGui_PopTextWrapPos()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetFontTexUvWhitePixel" get-font-tex-uv-white-pixel) VEC2)

#+ecl
(defun get-font-tex-uv-white-pixel ()
  (ffi:c-inline () () :INT
    "ImGui_GetFontTexUvWhitePixel()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetColorU32" get-color-u32) U32
  (idx COL)
)

#+ecl
(defun get-color-u32 (idx)
  (ffi:c-inline (idx) (:INT) :INT
    "ImGui_GetColorU32(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetColorU32Ex" get-color-u32ex) U32
  (idx COL)
  (alpha-mul :FLOAT)
)

#+ecl
(defun get-color-u32ex (idx alpha-mul)
  (ffi:c-inline (idx alpha-mul) (:INT :FLOAT) :INT
    "ImGui_GetColorU32Ex(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetColorU32ImU32" get-color-u32im-u32) U32
  (col U32)
)

#+ecl
(defun get-color-u32im-u32 (col)
  (ffi:c-inline (col) (:INT) :INT
    "ImGui_GetColorU32ImU32(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetColorU32ImU32Ex" get-color-u32im-u32ex) U32
  (col U32)
  (alpha-mul :FLOAT)
)

#+ecl
(defun get-color-u32im-u32ex (col alpha-mul)
  (ffi:c-inline (col alpha-mul) (:INT :FLOAT) :INT
    "ImGui_GetColorU32ImU32Ex(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetStyleColorVec4" get-style-color-vec4) :POINTER
  (idx COL)
)

#+ecl
(defun get-style-color-vec4 (idx)
  (ffi:c-inline (idx) (:INT) :POINTER-VOID
    "ImGui_GetStyleColorVec4(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetCursorScreenPos" get-cursor-screen-pos) VEC2)

#+ecl
(defun get-cursor-screen-pos ()
  (ffi:c-inline () () :INT
    "ImGui_GetCursorScreenPos()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetContentRegionAvail" get-content-region-avail) VEC2)

#+ecl
(defun get-content-region-avail ()
  (ffi:c-inline () () :INT
    "ImGui_GetContentRegionAvail()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetCursorPos" get-cursor-pos) VEC2)

#+ecl
(defun get-cursor-pos ()
  (ffi:c-inline () () :INT
    "ImGui_GetCursorPos()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetCursorPosX" get-cursor-pos-x) :FLOAT)

#+ecl
(defun get-cursor-pos-x ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetCursorPosX()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetCursorPosY" get-cursor-pos-y) :FLOAT)

#+ecl
(defun get-cursor-pos-y ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetCursorPosY()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetCursorPosX" set-cursor-pos-x) :VOID
  (local-x :FLOAT)
)

#+ecl
(defun set-cursor-pos-x (local-x)
  (ffi:c-inline (local-x) (:FLOAT) :VOID
    "ImGui_SetCursorPosX(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetCursorPosY" set-cursor-pos-y) :VOID
  (local-y :FLOAT)
)

#+ecl
(defun set-cursor-pos-y (local-y)
  (ffi:c-inline (local-y) (:FLOAT) :VOID
    "ImGui_SetCursorPosY(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetCursorStartPos" get-cursor-start-pos) VEC2)

#+ecl
(defun get-cursor-start-pos ()
  (ffi:c-inline () () :INT
    "ImGui_GetCursorStartPos()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Separator" separator) :VOID)

#+ecl
(defun separator ()
  (ffi:c-inline () () :VOID
    "ImGui_Separator()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SameLine" same-line) :VOID)

#+ecl
(defun same-line ()
  (ffi:c-inline () () :VOID
    "ImGui_SameLine()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SameLineEx" same-line-ex) :VOID
  (offset-from-start-x :FLOAT)
  (spacing :FLOAT)
)

#+ecl
(defun same-line-ex (offset-from-start-x spacing)
  (ffi:c-inline (offset-from-start-x spacing) (:FLOAT :FLOAT) :VOID
    "ImGui_SameLineEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_NewLine" new-line) :VOID)

#+ecl
(defun new-line ()
  (ffi:c-inline () () :VOID
    "ImGui_NewLine()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Spacing" spacing) :VOID)

#+ecl
(defun spacing ()
  (ffi:c-inline () () :VOID
    "ImGui_Spacing()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Indent" indent) :VOID)

#+ecl
(defun indent ()
  (ffi:c-inline () () :VOID
    "ImGui_Indent()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IndentEx" indent-ex) :VOID
  (indent-w :FLOAT)
)

#+ecl
(defun indent-ex (indent-w)
  (ffi:c-inline (indent-w) (:FLOAT) :VOID
    "ImGui_IndentEx(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Unindent" unindent) :VOID)

#+ecl
(defun unindent ()
  (ffi:c-inline () () :VOID
    "ImGui_Unindent()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_UnindentEx" unindent-ex) :VOID
  (indent-w :FLOAT)
)

#+ecl
(defun unindent-ex (indent-w)
  (ffi:c-inline (indent-w) (:FLOAT) :VOID
    "ImGui_UnindentEx(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginGroup" begin-group) :VOID)

#+ecl
(defun begin-group ()
  (ffi:c-inline () () :VOID
    "ImGui_BeginGroup()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndGroup" end-group) :VOID)

#+ecl
(defun end-group ()
  (ffi:c-inline () () :VOID
    "ImGui_EndGroup()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_AlignTextToFramePadding" align-text-to-frame-padding) :VOID)

#+ecl
(defun align-text-to-frame-padding ()
  (ffi:c-inline () () :VOID
    "ImGui_AlignTextToFramePadding()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetTextLineHeight" get-text-line-height) :FLOAT)

#+ecl
(defun get-text-line-height ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetTextLineHeight()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetTextLineHeightWithSpacing" get-text-line-height-with-spacing) :FLOAT)

#+ecl
(defun get-text-line-height-with-spacing ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetTextLineHeightWithSpacing()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetFrameHeight" get-frame-height) :FLOAT)

#+ecl
(defun get-frame-height ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetFrameHeight()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetFrameHeightWithSpacing" get-frame-height-with-spacing) :FLOAT)

#+ecl
(defun get-frame-height-with-spacing ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetFrameHeightWithSpacing()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushID" push-id) :VOID
  (str-id :STRING)
)

#+ecl
(defun push-id (str-id)
  (ffi:c-inline (str-id) (:CSTRING) :VOID
    "ImGui_PushID(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushIDStr" push-idstr) :VOID
  (str-id-begin :STRING)
  (str-id-end :STRING)
)

#+ecl
(defun push-idstr (str-id-begin str-id-end)
  (ffi:c-inline (str-id-begin str-id-end) (:CSTRING :CSTRING) :VOID
    "ImGui_PushIDStr(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushIDPtr" push-idptr) :VOID
  (ptr-id :POINTER)
)

#+ecl
(defun push-idptr (ptr-id)
  (ffi:c-inline (ptr-id) (:POINTER-VOID) :VOID
    "ImGui_PushIDPtr(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushIDInt" push-idint) :VOID
  (int-id :INT)
)

#+ecl
(defun push-idint (int-id)
  (ffi:c-inline (int-id) (:INT) :VOID
    "ImGui_PushIDInt(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopID" pop-id) :VOID)

#+ecl
(defun pop-id ()
  (ffi:c-inline () () :VOID
    "ImGui_PopID()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetID" get-id) ID
  (str-id :STRING)
)

#+ecl
(defun get-id (str-id)
  (ffi:c-inline (str-id) (:CSTRING) :INT
    "ImGui_GetID(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetIDStr" get-idstr) ID
  (str-id-begin :STRING)
  (str-id-end :STRING)
)

#+ecl
(defun get-idstr (str-id-begin str-id-end)
  (ffi:c-inline (str-id-begin str-id-end) (:CSTRING :CSTRING) :INT
    "ImGui_GetIDStr(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetIDPtr" get-idptr) ID
  (ptr-id :POINTER)
)

#+ecl
(defun get-idptr (ptr-id)
  (ffi:c-inline (ptr-id) (:POINTER-VOID) :INT
    "ImGui_GetIDPtr(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetIDInt" get-idint) ID
  (int-id :INT)
)

#+ecl
(defun get-idint (int-id)
  (ffi:c-inline (int-id) (:INT) :INT
    "ImGui_GetIDInt(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TextUnformatted" text-unformatted) :VOID
  (text :STRING)
)

#+ecl
(defun text-unformatted (text)
  (ffi:c-inline (text) (:CSTRING) :VOID
    "ImGui_TextUnformatted(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TextUnformattedEx" text-unformatted-ex) :VOID
  (text :STRING)
  (text-end :pointer) ; pointer override
)

#+ecl
(defun text-unformatted-ex (text text-end)
  (ffi:c-inline (text text-end) (:CSTRING :POINTER-VOID) :VOID
    "ImGui_TextUnformattedEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Text" text) :VOID
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_TextV" text-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun text-v (fmt args)
  (ffi:c-inline (fmt args) (:CSTRING :POINTER-VOID) :VOID
    "ImGui_TextV(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TextDisabled" text-disabled) :VOID
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_TextDisabledV" text-disabled-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun text-disabled-v (fmt args)
  (ffi:c-inline (fmt args) (:CSTRING :POINTER-VOID) :VOID
    "ImGui_TextDisabledV(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TextWrapped" text-wrapped) :VOID
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_TextWrappedV" text-wrapped-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun text-wrapped-v (fmt args)
  (ffi:c-inline (fmt args) (:CSTRING :POINTER-VOID) :VOID
    "ImGui_TextWrappedV(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_LabelText" label-text) :VOID
  (label :STRING)
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_LabelTextV" label-text-v) :VOID
  (label :STRING)
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun label-text-v (label fmt args)
  (ffi:c-inline (label fmt args) (:CSTRING :CSTRING :POINTER-VOID) :VOID
    "ImGui_LabelTextV(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BulletText" bullet-text) :VOID
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_BulletTextV" bullet-text-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun bullet-text-v (fmt args)
  (ffi:c-inline (fmt args) (:CSTRING :POINTER-VOID) :VOID
    "ImGui_BulletTextV(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SeparatorText" separator-text) :VOID
  (label :STRING)
)

#+ecl
(defun separator-text (label)
  (ffi:c-inline (label) (:CSTRING) :VOID
    "ImGui_SeparatorText(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Button" button) :BOOL
  (label :STRING)
)

#+ecl
(defun button (label)
  (ffi:c-inline (label) (:CSTRING) :BOOL
    "ImGui_Button(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SmallButton" small-button) :BOOL
  (label :STRING)
)

#+ecl
(defun small-button (label)
  (ffi:c-inline (label) (:CSTRING) :BOOL
    "ImGui_SmallButton(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ArrowButton" arrow-button) :BOOL
  (str-id :STRING)
  (dir IM-DIR)
)

#+ecl
(defun arrow-button (str-id dir)
  (ffi:c-inline (str-id dir) (:CSTRING :INT) :BOOL
    "ImGui_ArrowButton(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Checkbox" checkbox) :BOOL
  (label :STRING)
  (v :POINTER)
)

#+ecl
(defun checkbox (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_Checkbox(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_CheckboxFlagsIntPtr" checkbox-flags-int-ptr) :BOOL
  (label :STRING)
  (flags :POINTER)
  (flags-value :INT)
)

#+ecl
(defun checkbox-flags-int-ptr (label flags flags-value)
  (ffi:c-inline (label flags flags-value) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_CheckboxFlagsIntPtr(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_CheckboxFlagsUintPtr" checkbox-flags-uint-ptr) :BOOL
  (label :STRING)
  (flags :POINTER)
  (flags-value :UNSIGNED-INT)
)

#+ecl
(defun checkbox-flags-uint-ptr (label flags flags-value)
  (ffi:c-inline (label flags flags-value) (:CSTRING :POINTER-VOID :UNSIGNED-INT) :BOOL
    "ImGui_CheckboxFlagsUintPtr(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_RadioButton" radio-button) :BOOL
  (label :STRING)
  (active :BOOL)
)

#+ecl
(defun radio-button (label active)
  (ffi:c-inline (label active) (:CSTRING :BOOL) :BOOL
    "ImGui_RadioButton(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_RadioButtonIntPtr" radio-button-int-ptr) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-button :INT)
)

#+ecl
(defun radio-button-int-ptr (label v v-button)
  (ffi:c-inline (label v v-button) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_RadioButtonIntPtr(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Bullet" bullet) :VOID)

#+ecl
(defun bullet ()
  (ffi:c-inline () () :VOID
    "ImGui_Bullet()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TextLink" text-link) :BOOL
  (label :STRING)
)

#+ecl
(defun text-link (label)
  (ffi:c-inline (label) (:CSTRING) :BOOL
    "ImGui_TextLink(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TextLinkOpenURL" text-link-open-url) :BOOL
  (label :STRING)
)

#+ecl
(defun text-link-open-url (label)
  (ffi:c-inline (label) (:CSTRING) :BOOL
    "ImGui_TextLinkOpenURL(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TextLinkOpenURLEx" text-link-open-urlex) :BOOL
  (label :STRING)
  (url :STRING)
)

#+ecl
(defun text-link-open-urlex (label url)
  (ffi:c-inline (label url) (:CSTRING :CSTRING) :BOOL
    "ImGui_TextLinkOpenURLEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginCombo" begin-combo) :BOOL
  (label :STRING)
  (preview-value :STRING)
  (flags COMBO-FLAGS)
)

#+ecl
(defun begin-combo (label preview-value flags)
  (ffi:c-inline (label preview-value flags) (:CSTRING :CSTRING :INT) :BOOL
    "ImGui_BeginCombo(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndCombo" end-combo) :VOID)

#+ecl
(defun end-combo ()
  (ffi:c-inline () () :VOID
    "ImGui_EndCombo()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ComboChar" combo-char) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (items :pointer)
  (items-count :INT)
)

#+ecl
(defun combo-char (label current-item items items-count)
  (ffi:c-inline (label current-item items items-count) (:CSTRING :POINTER-VOID :POINTER-VOID :INT) :BOOL
    "ImGui_ComboChar(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ComboCharEx" combo-char-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (items :pointer)
  (items-count :INT)
  (popup-max-height-in-items :INT)
)

#+ecl
(defun combo-char-ex (label current-item items items-count popup-max-height-in-items)
  (ffi:c-inline (label current-item items items-count popup-max-height-in-items) (:CSTRING :POINTER-VOID :POINTER-VOID :INT :INT) :BOOL
    "ImGui_ComboCharEx(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Combo" combo) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (items-separated-by-zeros :STRING)
)

#+ecl
(defun combo (label current-item items-separated-by-zeros)
  (ffi:c-inline (label current-item items-separated-by-zeros) (:CSTRING :POINTER-VOID :CSTRING) :BOOL
    "ImGui_Combo(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ComboEx" combo-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (items-separated-by-zeros :STRING)
  (popup-max-height-in-items :INT)
)

#+ecl
(defun combo-ex (label current-item items-separated-by-zeros popup-max-height-in-items)
  (ffi:c-inline (label current-item items-separated-by-zeros popup-max-height-in-items) (:CSTRING :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_ComboEx(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ComboCallback" combo-callback) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (getter :POINTER)
  (user-data :POINTER)
  (items-count :INT)
)

#+ecl
(defun combo-callback (label current-item getter user-data items-count)
  (ffi:c-inline (label current-item getter user-data items-count) (:CSTRING :POINTER-VOID :POINTER-VOID :POINTER-VOID :INT) :BOOL
    "ImGui_ComboCallback(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ComboCallbackEx" combo-callback-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (getter :POINTER)
  (user-data :POINTER)
  (items-count :INT)
  (popup-max-height-in-items :INT)
)

#+ecl
(defun combo-callback-ex (label current-item getter user-data items-count popup-max-height-in-items)
  (ffi:c-inline (label current-item getter user-data items-count popup-max-height-in-items) (:CSTRING :POINTER-VOID :POINTER-VOID :POINTER-VOID :INT :INT) :BOOL
    "ImGui_ComboCallbackEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloat" drag-float) :BOOL
  (label :STRING)
  (v :POINTER)
)

#+ecl
(defun drag-float (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_DragFloat(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloatEx" drag-float-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-float-ex (label v v-speed v-min v-max format flags)
  (ffi:c-inline (label v v-speed v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_DragFloatEx(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloat2" drag-float2) :BOOL
  (label :STRING)
  (v :pointer)
)

#+ecl
(defun drag-float2 (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_DragFloat2(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloat2Ex" drag-float2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-float2ex (label v v-speed v-min v-max format flags)
  (ffi:c-inline (label v v-speed v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_DragFloat2Ex(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloat3" drag-float3) :BOOL
  (label :STRING)
  (v :pointer)
)

#+ecl
(defun drag-float3 (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_DragFloat3(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloat3Ex" drag-float3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-float3ex (label v v-speed v-min v-max format flags)
  (ffi:c-inline (label v v-speed v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_DragFloat3Ex(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloat4" drag-float4) :BOOL
  (label :STRING)
  (v :pointer)
)

#+ecl
(defun drag-float4 (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_DragFloat4(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloat4Ex" drag-float4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-float4ex (label v v-speed v-min v-max format flags)
  (ffi:c-inline (label v v-speed v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_DragFloat4Ex(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloatRange2" drag-float-range2) :BOOL
  (label :STRING)
  (v-current-min :POINTER)
  (v-current-max :POINTER)
)

#+ecl
(defun drag-float-range2 (label v-current-min v-current-max)
  (ffi:c-inline (label v-current-min v-current-max) (:CSTRING :POINTER-VOID :POINTER-VOID) :BOOL
    "ImGui_DragFloatRange2(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragFloatRange2Ex" drag-float-range2ex) :BOOL
  (label :STRING)
  (v-current-min :POINTER)
  (v-current-max :POINTER)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (format-max :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-float-range2ex (label v-current-min v-current-max v-speed v-min v-max format format-max flags)
  (ffi:c-inline (label v-current-min v-current-max v-speed v-min v-max format format-max flags) (:CSTRING :POINTER-VOID :POINTER-VOID :FLOAT :FLOAT :FLOAT :CSTRING :CSTRING :INT) :BOOL
    "ImGui_DragFloatRange2Ex(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragInt" drag-int) :BOOL
  (label :STRING)
  (v :POINTER)
)

#+ecl
(defun drag-int (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_DragInt(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragIntEx" drag-int-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-int-ex (label v v-speed v-min v-max format flags)
  (ffi:c-inline (label v v-speed v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :INT :INT :CSTRING :INT) :BOOL
    "ImGui_DragIntEx(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragInt2" drag-int2) :BOOL
  (label :STRING)
  (v :pointer)
)

#+ecl
(defun drag-int2 (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_DragInt2(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragInt2Ex" drag-int2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-int2ex (label v v-speed v-min v-max format flags)
  (ffi:c-inline (label v v-speed v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :INT :INT :CSTRING :INT) :BOOL
    "ImGui_DragInt2Ex(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragInt3" drag-int3) :BOOL
  (label :STRING)
  (v :pointer)
)

#+ecl
(defun drag-int3 (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_DragInt3(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragInt3Ex" drag-int3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-int3ex (label v v-speed v-min v-max format flags)
  (ffi:c-inline (label v v-speed v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :INT :INT :CSTRING :INT) :BOOL
    "ImGui_DragInt3Ex(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragInt4" drag-int4) :BOOL
  (label :STRING)
  (v :pointer)
)

#+ecl
(defun drag-int4 (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_DragInt4(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragInt4Ex" drag-int4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-int4ex (label v v-speed v-min v-max format flags)
  (ffi:c-inline (label v v-speed v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :INT :INT :CSTRING :INT) :BOOL
    "ImGui_DragInt4Ex(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragIntRange2" drag-int-range2) :BOOL
  (label :STRING)
  (v-current-min :POINTER)
  (v-current-max :POINTER)
)

#+ecl
(defun drag-int-range2 (label v-current-min v-current-max)
  (ffi:c-inline (label v-current-min v-current-max) (:CSTRING :POINTER-VOID :POINTER-VOID) :BOOL
    "ImGui_DragIntRange2(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragIntRange2Ex" drag-int-range2ex) :BOOL
  (label :STRING)
  (v-current-min :POINTER)
  (v-current-max :POINTER)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (format-max :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-int-range2ex (label v-current-min v-current-max v-speed v-min v-max format format-max flags)
  (ffi:c-inline (label v-current-min v-current-max v-speed v-min v-max format format-max flags) (:CSTRING :POINTER-VOID :POINTER-VOID :FLOAT :INT :INT :CSTRING :CSTRING :INT) :BOOL
    "ImGui_DragIntRange2Ex(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragScalar" drag-scalar) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
)

#+ecl
(defun drag-scalar (label data-type p-data)
  (ffi:c-inline (label data-type p-data) (:CSTRING :INT :POINTER-VOID) :BOOL
    "ImGui_DragScalar(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragScalarEx" drag-scalar-ex) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (v-speed :FLOAT)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-scalar-ex (label data-type p-data v-speed p-min p-max format flags)
  (ffi:c-inline (label data-type p-data v-speed p-min p-max format flags) (:CSTRING :INT :POINTER-VOID :FLOAT :POINTER-VOID :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_DragScalarEx(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragScalarN" drag-scalar-n) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (components :INT)
)

#+ecl
(defun drag-scalar-n (label data-type p-data components)
  (ffi:c-inline (label data-type p-data components) (:CSTRING :INT :POINTER-VOID :INT) :BOOL
    "ImGui_DragScalarN(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DragScalarNEx" drag-scalar-nex) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (components :INT)
  (v-speed :FLOAT)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun drag-scalar-nex (label data-type p-data components v-speed p-min p-max format flags)
  (ffi:c-inline (label data-type p-data components v-speed p-min p-max format flags) (:CSTRING :INT :POINTER-VOID :INT :FLOAT :POINTER-VOID :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_DragScalarNEx(#0, #1, #2, #3, #4, #5, #6, #7, #8)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderFloat" slider-float) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-min :FLOAT)
  (v-max :FLOAT)
)

#+ecl
(defun slider-float (label v v-min v-max)
  (ffi:c-inline (label v v-min v-max) (:CSTRING :POINTER-VOID :FLOAT :FLOAT) :BOOL
    "ImGui_SliderFloat(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderFloatEx" slider-float-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-float-ex (label v v-min v-max format flags)
  (ffi:c-inline (label v v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_SliderFloatEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderFloat2" slider-float2) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :FLOAT)
  (v-max :FLOAT)
)

#+ecl
(defun slider-float2 (label v v-min v-max)
  (ffi:c-inline (label v v-min v-max) (:CSTRING :POINTER-VOID :FLOAT :FLOAT) :BOOL
    "ImGui_SliderFloat2(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderFloat2Ex" slider-float2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-float2ex (label v v-min v-max format flags)
  (ffi:c-inline (label v v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_SliderFloat2Ex(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderFloat3" slider-float3) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :FLOAT)
  (v-max :FLOAT)
)

#+ecl
(defun slider-float3 (label v v-min v-max)
  (ffi:c-inline (label v v-min v-max) (:CSTRING :POINTER-VOID :FLOAT :FLOAT) :BOOL
    "ImGui_SliderFloat3(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderFloat3Ex" slider-float3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-float3ex (label v v-min v-max format flags)
  (ffi:c-inline (label v v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_SliderFloat3Ex(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderFloat4" slider-float4) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :FLOAT)
  (v-max :FLOAT)
)

#+ecl
(defun slider-float4 (label v v-min v-max)
  (ffi:c-inline (label v v-min v-max) (:CSTRING :POINTER-VOID :FLOAT :FLOAT) :BOOL
    "ImGui_SliderFloat4(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderFloat4Ex" slider-float4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-float4ex (label v v-min v-max format flags)
  (ffi:c-inline (label v v-min v-max format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_SliderFloat4Ex(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderAngle" slider-angle) :BOOL
  (label :STRING)
  (v-rad :POINTER)
)

#+ecl
(defun slider-angle (label v-rad)
  (ffi:c-inline (label v-rad) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_SliderAngle(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderAngleEx" slider-angle-ex) :BOOL
  (label :STRING)
  (v-rad :POINTER)
  (v-degrees-min :FLOAT)
  (v-degrees-max :FLOAT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-angle-ex (label v-rad v-degrees-min v-degrees-max format flags)
  (ffi:c-inline (label v-rad v-degrees-min v-degrees-max format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_SliderAngleEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderInt" slider-int) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-min :INT)
  (v-max :INT)
)

#+ecl
(defun slider-int (label v v-min v-max)
  (ffi:c-inline (label v v-min v-max) (:CSTRING :POINTER-VOID :INT :INT) :BOOL
    "ImGui_SliderInt(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderIntEx" slider-int-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-int-ex (label v v-min v-max format flags)
  (ffi:c-inline (label v v-min v-max format flags) (:CSTRING :POINTER-VOID :INT :INT :CSTRING :INT) :BOOL
    "ImGui_SliderIntEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderInt2" slider-int2) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :INT)
  (v-max :INT)
)

#+ecl
(defun slider-int2 (label v v-min v-max)
  (ffi:c-inline (label v v-min v-max) (:CSTRING :POINTER-VOID :INT :INT) :BOOL
    "ImGui_SliderInt2(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderInt2Ex" slider-int2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-int2ex (label v v-min v-max format flags)
  (ffi:c-inline (label v v-min v-max format flags) (:CSTRING :POINTER-VOID :INT :INT :CSTRING :INT) :BOOL
    "ImGui_SliderInt2Ex(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderInt3" slider-int3) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :INT)
  (v-max :INT)
)

#+ecl
(defun slider-int3 (label v v-min v-max)
  (ffi:c-inline (label v v-min v-max) (:CSTRING :POINTER-VOID :INT :INT) :BOOL
    "ImGui_SliderInt3(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderInt3Ex" slider-int3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-int3ex (label v v-min v-max format flags)
  (ffi:c-inline (label v v-min v-max format flags) (:CSTRING :POINTER-VOID :INT :INT :CSTRING :INT) :BOOL
    "ImGui_SliderInt3Ex(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderInt4" slider-int4) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :INT)
  (v-max :INT)
)

#+ecl
(defun slider-int4 (label v v-min v-max)
  (ffi:c-inline (label v v-min v-max) (:CSTRING :POINTER-VOID :INT :INT) :BOOL
    "ImGui_SliderInt4(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderInt4Ex" slider-int4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-int4ex (label v v-min v-max format flags)
  (ffi:c-inline (label v v-min v-max format flags) (:CSTRING :POINTER-VOID :INT :INT :CSTRING :INT) :BOOL
    "ImGui_SliderInt4Ex(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderScalar" slider-scalar) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (p-min :POINTER)
  (p-max :POINTER)
)

#+ecl
(defun slider-scalar (label data-type p-data p-min p-max)
  (ffi:c-inline (label data-type p-data p-min p-max) (:CSTRING :INT :POINTER-VOID :POINTER-VOID :POINTER-VOID) :BOOL
    "ImGui_SliderScalar(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderScalarEx" slider-scalar-ex) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-scalar-ex (label data-type p-data p-min p-max format flags)
  (ffi:c-inline (label data-type p-data p-min p-max format flags) (:CSTRING :INT :POINTER-VOID :POINTER-VOID :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_SliderScalarEx(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderScalarN" slider-scalar-n) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (components :INT)
  (p-min :POINTER)
  (p-max :POINTER)
)

#+ecl
(defun slider-scalar-n (label data-type p-data components p-min p-max)
  (ffi:c-inline (label data-type p-data components p-min p-max) (:CSTRING :INT :POINTER-VOID :INT :POINTER-VOID :POINTER-VOID) :BOOL
    "ImGui_SliderScalarN(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SliderScalarNEx" slider-scalar-nex) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (components :INT)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDER-FLAGS)
)

#+ecl
(defun slider-scalar-nex (label data-type p-data components p-min p-max format flags)
  (ffi:c-inline (label data-type p-data components p-min p-max format flags) (:CSTRING :INT :POINTER-VOID :INT :POINTER-VOID :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_SliderScalarNEx(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputText" input-text) :BOOL
  (label :STRING)
  (buf :STRING)
  (buf-size :SIZE)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-text (label buf buf-size flags)
  (ffi:c-inline (label buf buf-size flags) (:CSTRING :CSTRING :UNSIGNED-LONG :INT) :BOOL
    "ImGui_InputText(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputTextEx" input-text-ex) :BOOL
  (label :STRING)
  (buf :pointer) ; pointer override
  (buf-size :SIZE)
  (flags INPUT-TEXT-FLAGS)
  (callback INPUT-TEXT-CALLBACK)
  (user-data :POINTER)
)

#+ecl
(defun input-text-ex (label buf buf-size flags callback user-data)
  (ffi:c-inline (label buf buf-size flags callback user-data) (:CSTRING :POINTER-VOID :UNSIGNED-LONG :INT :INT :POINTER-VOID) :BOOL
    "ImGui_InputTextEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputTextMultiline" input-text-multiline) :BOOL
  (label :STRING)
  (buf :STRING)
  (buf-size :SIZE)
)

#+ecl
(defun input-text-multiline (label buf buf-size)
  (ffi:c-inline (label buf buf-size) (:CSTRING :CSTRING :UNSIGNED-LONG) :BOOL
    "ImGui_InputTextMultiline(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputTextWithHint" input-text-with-hint) :BOOL
  (label :STRING)
  (hint :STRING)
  (buf :STRING)
  (buf-size :SIZE)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-text-with-hint (label hint buf buf-size flags)
  (ffi:c-inline (label hint buf buf-size flags) (:CSTRING :CSTRING :CSTRING :UNSIGNED-LONG :INT) :BOOL
    "ImGui_InputTextWithHint(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputTextWithHintEx" input-text-with-hint-ex) :BOOL
  (label :STRING)
  (hint :STRING)
  (buf :STRING)
  (buf-size :SIZE)
  (flags INPUT-TEXT-FLAGS)
  (callback INPUT-TEXT-CALLBACK)
  (user-data :POINTER)
)

#+ecl
(defun input-text-with-hint-ex (label hint buf buf-size flags callback user-data)
  (ffi:c-inline (label hint buf buf-size flags callback user-data) (:CSTRING :CSTRING :CSTRING :UNSIGNED-LONG :INT :INT :POINTER-VOID) :BOOL
    "ImGui_InputTextWithHintEx(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputFloat" input-float) :BOOL
  (label :STRING)
  (v :POINTER)
)

#+ecl
(defun input-float (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_InputFloat(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputFloatEx" input-float-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (step :FLOAT)
  (step-fast :FLOAT)
  (format :STRING)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-float-ex (label v step step-fast format flags)
  (ffi:c-inline (label v step step-fast format flags) (:CSTRING :POINTER-VOID :FLOAT :FLOAT :CSTRING :INT) :BOOL
    "ImGui_InputFloatEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputFloat2" input-float2) :BOOL
  (label :STRING)
  (v :pointer)
)

#+ecl
(defun input-float2 (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_InputFloat2(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputFloat2Ex" input-float2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (format :STRING)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-float2ex (label v format flags)
  (ffi:c-inline (label v format flags) (:CSTRING :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_InputFloat2Ex(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputFloat3" input-float3) :BOOL
  (label :STRING)
  (v :pointer)
)

#+ecl
(defun input-float3 (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_InputFloat3(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputFloat3Ex" input-float3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (format :STRING)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-float3ex (label v format flags)
  (ffi:c-inline (label v format flags) (:CSTRING :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_InputFloat3Ex(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputFloat4" input-float4) :BOOL
  (label :STRING)
  (v :pointer)
)

#+ecl
(defun input-float4 (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_InputFloat4(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputFloat4Ex" input-float4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (format :STRING)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-float4ex (label v format flags)
  (ffi:c-inline (label v format flags) (:CSTRING :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_InputFloat4Ex(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputInt" input-int) :BOOL
  (label :STRING)
  (v :POINTER)
)

#+ecl
(defun input-int (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_InputInt(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputIntEx" input-int-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (step :INT)
  (step-fast :INT)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-int-ex (label v step step-fast flags)
  (ffi:c-inline (label v step step-fast flags) (:CSTRING :POINTER-VOID :INT :INT :INT) :BOOL
    "ImGui_InputIntEx(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputInt2" input-int2) :BOOL
  (label :STRING)
  (v :pointer)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-int2 (label v flags)
  (ffi:c-inline (label v flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_InputInt2(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputInt3" input-int3) :BOOL
  (label :STRING)
  (v :pointer)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-int3 (label v flags)
  (ffi:c-inline (label v flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_InputInt3(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputInt4" input-int4) :BOOL
  (label :STRING)
  (v :pointer)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-int4 (label v flags)
  (ffi:c-inline (label v flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_InputInt4(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputDouble" input-double) :BOOL
  (label :STRING)
  (v :POINTER)
)

#+ecl
(defun input-double (label v)
  (ffi:c-inline (label v) (:CSTRING :POINTER-VOID) :BOOL
    "ImGui_InputDouble(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputDoubleEx" input-double-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (step :DOUBLE)
  (step-fast :DOUBLE)
  (format :STRING)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-double-ex (label v step step-fast format flags)
  (ffi:c-inline (label v step step-fast format flags) (:CSTRING :POINTER-VOID :DOUBLE :DOUBLE :CSTRING :INT) :BOOL
    "ImGui_InputDoubleEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputScalar" input-scalar) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
)

#+ecl
(defun input-scalar (label data-type p-data)
  (ffi:c-inline (label data-type p-data) (:CSTRING :INT :POINTER-VOID) :BOOL
    "ImGui_InputScalar(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputScalarEx" input-scalar-ex) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (p-step :POINTER)
  (p-step-fast :POINTER)
  (format :STRING)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-scalar-ex (label data-type p-data p-step p-step-fast format flags)
  (ffi:c-inline (label data-type p-data p-step p-step-fast format flags) (:CSTRING :INT :POINTER-VOID :POINTER-VOID :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_InputScalarEx(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputScalarN" input-scalar-n) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (components :INT)
)

#+ecl
(defun input-scalar-n (label data-type p-data components)
  (ffi:c-inline (label data-type p-data components) (:CSTRING :INT :POINTER-VOID :INT) :BOOL
    "ImGui_InputScalarN(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_InputScalarNEx" input-scalar-nex) :BOOL
  (label :STRING)
  (data-type DATA-TYPE)
  (p-data :POINTER)
  (components :INT)
  (p-step :POINTER)
  (p-step-fast :POINTER)
  (format :STRING)
  (flags INPUT-TEXT-FLAGS)
)

#+ecl
(defun input-scalar-nex (label data-type p-data components p-step p-step-fast format flags)
  (ffi:c-inline (label data-type p-data components p-step p-step-fast format flags) (:CSTRING :INT :POINTER-VOID :INT :POINTER-VOID :POINTER-VOID :CSTRING :INT) :BOOL
    "ImGui_InputScalarNEx(#0, #1, #2, #3, #4, #5, #6, #7)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorEdit3" color-edit3) :BOOL
  (label :STRING)
  (col :pointer)
  (flags COLOR-EDIT-FLAGS)
)

#+ecl
(defun color-edit3 (label col flags)
  (ffi:c-inline (label col flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_ColorEdit3(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorEdit4" color-edit4) :BOOL
  (label :STRING)
  (col :pointer)
  (flags COLOR-EDIT-FLAGS)
)

#+ecl
(defun color-edit4 (label col flags)
  (ffi:c-inline (label col flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_ColorEdit4(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorPicker3" color-picker3) :BOOL
  (label :STRING)
  (col :pointer)
  (flags COLOR-EDIT-FLAGS)
)

#+ecl
(defun color-picker3 (label col flags)
  (ffi:c-inline (label col flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_ColorPicker3(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorPicker4" color-picker4) :BOOL
  (label :STRING)
  (col :pointer)
  (flags COLOR-EDIT-FLAGS)
  (ref-col :POINTER)
)

#+ecl
(defun color-picker4 (label col flags ref-col)
  (ffi:c-inline (label col flags ref-col) (:CSTRING :POINTER-VOID :INT :POINTER-VOID) :BOOL
    "ImGui_ColorPicker4(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetColorEditOptions" set-color-edit-options) :VOID
  (flags COLOR-EDIT-FLAGS)
)

#+ecl
(defun set-color-edit-options (flags)
  (ffi:c-inline (flags) (:INT) :VOID
    "ImGui_SetColorEditOptions(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TreeNode" tree-node) :BOOL
  (label :STRING)
)

#+ecl
(defun tree-node (label)
  (ffi:c-inline (label) (:CSTRING) :BOOL
    "ImGui_TreeNode(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TreeNodeStr" tree-node-str) :BOOL
  (str-id :STRING)
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_TreeNodePtr" tree-node-ptr) :BOOL
  (ptr-id :POINTER)
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_TreeNodeV" tree-node-v) :BOOL
  (str-id :STRING)
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun tree-node-v (str-id fmt args)
  (ffi:c-inline (str-id fmt args) (:CSTRING :CSTRING :POINTER-VOID) :BOOL
    "ImGui_TreeNodeV(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TreeNodeVPtr" tree-node-vptr) :BOOL
  (ptr-id :POINTER)
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun tree-node-vptr (ptr-id fmt args)
  (ffi:c-inline (ptr-id fmt args) (:POINTER-VOID :CSTRING :POINTER-VOID) :BOOL
    "ImGui_TreeNodeVPtr(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TreeNodeEx" tree-node-ex) :BOOL
  (label :STRING)
  (flags TREE-NODE-FLAGS)
)

#+ecl
(defun tree-node-ex (label flags)
  (ffi:c-inline (label flags) (:CSTRING :INT) :BOOL
    "ImGui_TreeNodeEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TreeNodeExStr" tree-node-ex-str) :BOOL
  (str-id :STRING)
  (flags TREE-NODE-FLAGS)
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_TreeNodeExPtr" tree-node-ex-ptr) :BOOL
  (ptr-id :POINTER)
  (flags TREE-NODE-FLAGS)
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_TreeNodeExV" tree-node-ex-v) :BOOL
  (str-id :STRING)
  (flags TREE-NODE-FLAGS)
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun tree-node-ex-v (str-id flags fmt args)
  (ffi:c-inline (str-id flags fmt args) (:CSTRING :INT :CSTRING :POINTER-VOID) :BOOL
    "ImGui_TreeNodeExV(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TreeNodeExVPtr" tree-node-ex-vptr) :BOOL
  (ptr-id :POINTER)
  (flags TREE-NODE-FLAGS)
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun tree-node-ex-vptr (ptr-id flags fmt args)
  (ffi:c-inline (ptr-id flags fmt args) (:POINTER-VOID :INT :CSTRING :POINTER-VOID) :BOOL
    "ImGui_TreeNodeExVPtr(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TreePush" tree-push) :VOID
  (str-id :STRING)
)

#+ecl
(defun tree-push (str-id)
  (ffi:c-inline (str-id) (:CSTRING) :VOID
    "ImGui_TreePush(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TreePushPtr" tree-push-ptr) :VOID
  (ptr-id :POINTER)
)

#+ecl
(defun tree-push-ptr (ptr-id)
  (ffi:c-inline (ptr-id) (:POINTER-VOID) :VOID
    "ImGui_TreePushPtr(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TreePop" tree-pop) :VOID)

#+ecl
(defun tree-pop ()
  (ffi:c-inline () () :VOID
    "ImGui_TreePop()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetTreeNodeToLabelSpacing" get-tree-node-to-label-spacing) :FLOAT)

#+ecl
(defun get-tree-node-to-label-spacing ()
  (ffi:c-inline () () :FLOAT
    "ImGui_GetTreeNodeToLabelSpacing()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_CollapsingHeader" collapsing-header) :BOOL
  (label :STRING)
  (flags TREE-NODE-FLAGS)
)

#+ecl
(defun collapsing-header (label flags)
  (ffi:c-inline (label flags) (:CSTRING :INT) :BOOL
    "ImGui_CollapsingHeader(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_CollapsingHeaderBoolPtr" collapsing-header-bool-ptr) :BOOL
  (label :STRING)
  (p-visible :POINTER)
  (flags TREE-NODE-FLAGS)
)

#+ecl
(defun collapsing-header-bool-ptr (label p-visible flags)
  (ffi:c-inline (label p-visible flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_CollapsingHeaderBoolPtr(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextItemOpen" set-next-item-open) :VOID
  (is-open :BOOL)
  (cond COND)
)

#+ecl
(defun set-next-item-open (is-open cond)
  (ffi:c-inline (is-open cond) (:BOOL :INT) :VOID
    "ImGui_SetNextItemOpen(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextItemStorageID" set-next-item-storage-id) :VOID
  (storage-id ID)
)

#+ecl
(defun set-next-item-storage-id (storage-id)
  (ffi:c-inline (storage-id) (:INT) :VOID
    "ImGui_SetNextItemStorageID(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Selectable" selectable) :BOOL
  (label :STRING)
)

#+ecl
(defun selectable (label)
  (ffi:c-inline (label) (:CSTRING) :BOOL
    "ImGui_Selectable(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SelectableBoolPtr" selectable-bool-ptr) :BOOL
  (label :STRING)
  (p-selected :POINTER)
  (flags SELECTABLE-FLAGS)
)

#+ecl
(defun selectable-bool-ptr (label p-selected flags)
  (ffi:c-inline (label p-selected flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_SelectableBoolPtr(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginMultiSelect" begin-multi-select) :POINTER
  (flags MULTI-SELECT-FLAGS)
)

#+ecl
(defun begin-multi-select (flags)
  (ffi:c-inline (flags) (:INT) :POINTER-VOID
    "ImGui_BeginMultiSelect(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginMultiSelectEx" begin-multi-select-ex) :POINTER
  (flags MULTI-SELECT-FLAGS)
  (selection-size :INT)
  (items-count :INT)
)

#+ecl
(defun begin-multi-select-ex (flags selection-size items-count)
  (ffi:c-inline (flags selection-size items-count) (:INT :INT :INT) :POINTER-VOID
    "ImGui_BeginMultiSelectEx(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndMultiSelect" end-multi-select) :POINTER)

#+ecl
(defun end-multi-select ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_EndMultiSelect()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextItemSelectionUserData" set-next-item-selection-user-data) :VOID
  (selection-user-data SELECTION-USER-DATA)
)

#+ecl
(defun set-next-item-selection-user-data (selection-user-data)
  (ffi:c-inline (selection-user-data) (:INT) :VOID
    "ImGui_SetNextItemSelectionUserData(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemToggledSelection" is-item-toggled-selection) :BOOL)

#+ecl
(defun is-item-toggled-selection ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemToggledSelection()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndListBox" end-list-box) :VOID)

#+ecl
(defun end-list-box ()
  (ffi:c-inline () () :VOID
    "ImGui_EndListBox()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ListBox" list-box) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (items :pointer)
  (items-count :INT)
  (height-in-items :INT)
)

#+ecl
(defun list-box (label current-item items items-count height-in-items)
  (ffi:c-inline (label current-item items items-count height-in-items) (:CSTRING :POINTER-VOID :POINTER-VOID :INT :INT) :BOOL
    "ImGui_ListBox(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ListBoxCallback" list-box-callback) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (getter :POINTER)
  (user-data :POINTER)
  (items-count :INT)
)

#+ecl
(defun list-box-callback (label current-item getter user-data items-count)
  (ffi:c-inline (label current-item getter user-data items-count) (:CSTRING :POINTER-VOID :POINTER-VOID :POINTER-VOID :INT) :BOOL
    "ImGui_ListBoxCallback(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ListBoxCallbackEx" list-box-callback-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (getter :POINTER)
  (user-data :POINTER)
  (items-count :INT)
  (height-in-items :INT)
)

#+ecl
(defun list-box-callback-ex (label current-item getter user-data items-count height-in-items)
  (ffi:c-inline (label current-item getter user-data items-count height-in-items) (:CSTRING :POINTER-VOID :POINTER-VOID :POINTER-VOID :INT :INT) :BOOL
    "ImGui_ListBoxCallbackEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PlotLines" plot-lines) :VOID
  (label :STRING)
  (values :POINTER)
  (values-count :INT)
)

#+ecl
(defun plot-lines (label values values-count)
  (ffi:c-inline (label values values-count) (:CSTRING :POINTER-VOID :INT) :VOID
    "ImGui_PlotLines(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PlotLinesCallback" plot-lines-callback) :VOID
  (label :STRING)
  (values-getter :POINTER)
  (data :POINTER)
  (values-count :INT)
)

#+ecl
(defun plot-lines-callback (label values-getter data values-count)
  (ffi:c-inline (label values-getter data values-count) (:CSTRING :POINTER-VOID :POINTER-VOID :INT) :VOID
    "ImGui_PlotLinesCallback(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PlotHistogram" plot-histogram) :VOID
  (label :STRING)
  (values :POINTER)
  (values-count :INT)
)

#+ecl
(defun plot-histogram (label values values-count)
  (ffi:c-inline (label values values-count) (:CSTRING :POINTER-VOID :INT) :VOID
    "ImGui_PlotHistogram(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PlotHistogramCallback" plot-histogram-callback) :VOID
  (label :STRING)
  (values-getter :POINTER)
  (data :POINTER)
  (values-count :INT)
)

#+ecl
(defun plot-histogram-callback (label values-getter data values-count)
  (ffi:c-inline (label values-getter data values-count) (:CSTRING :POINTER-VOID :POINTER-VOID :INT) :VOID
    "ImGui_PlotHistogramCallback(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginMenuBar" begin-menu-bar) :BOOL)

#+ecl
(defun begin-menu-bar ()
  (ffi:c-inline () () :BOOL
    "ImGui_BeginMenuBar()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndMenuBar" end-menu-bar) :VOID)

#+ecl
(defun end-menu-bar ()
  (ffi:c-inline () () :VOID
    "ImGui_EndMenuBar()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginMainMenuBar" begin-main-menu-bar) :BOOL)

#+ecl
(defun begin-main-menu-bar ()
  (ffi:c-inline () () :BOOL
    "ImGui_BeginMainMenuBar()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndMainMenuBar" end-main-menu-bar) :VOID)

#+ecl
(defun end-main-menu-bar ()
  (ffi:c-inline () () :VOID
    "ImGui_EndMainMenuBar()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginMenu" begin-menu) :BOOL
  (label :STRING)
)

#+ecl
(defun begin-menu (label)
  (ffi:c-inline (label) (:CSTRING) :BOOL
    "ImGui_BeginMenu(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginMenuEx" begin-menu-ex) :BOOL
  (label :STRING)
  (enabled :BOOL)
)

#+ecl
(defun begin-menu-ex (label enabled)
  (ffi:c-inline (label enabled) (:CSTRING :BOOL) :BOOL
    "ImGui_BeginMenuEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndMenu" end-menu) :VOID)

#+ecl
(defun end-menu ()
  (ffi:c-inline () () :VOID
    "ImGui_EndMenu()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_MenuItem" menu-item) :BOOL
  (label :STRING)
)

#+ecl
(defun menu-item (label)
  (ffi:c-inline (label) (:CSTRING) :BOOL
    "ImGui_MenuItem(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_MenuItemEx" menu-item-ex) :BOOL
  (label :STRING)
  (shortcut :STRING)
  (selected :BOOL)
  (enabled :BOOL)
)

#+ecl
(defun menu-item-ex (label shortcut selected enabled)
  (ffi:c-inline (label shortcut selected enabled) (:CSTRING :CSTRING :BOOL :BOOL) :BOOL
    "ImGui_MenuItemEx(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_MenuItemBoolPtr" menu-item-bool-ptr) :BOOL
  (label :STRING)
  (shortcut :STRING)
  (p-selected :POINTER)
  (enabled :BOOL)
)

#+ecl
(defun menu-item-bool-ptr (label shortcut p-selected enabled)
  (ffi:c-inline (label shortcut p-selected enabled) (:CSTRING :CSTRING :POINTER-VOID :BOOL) :BOOL
    "ImGui_MenuItemBoolPtr(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginTooltip" begin-tooltip) :BOOL)

#+ecl
(defun begin-tooltip ()
  (ffi:c-inline () () :BOOL
    "ImGui_BeginTooltip()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndTooltip" end-tooltip) :VOID)

#+ecl
(defun end-tooltip ()
  (ffi:c-inline () () :VOID
    "ImGui_EndTooltip()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetTooltip" set-tooltip) :VOID
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_SetTooltipV" set-tooltip-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun set-tooltip-v (fmt args)
  (ffi:c-inline (fmt args) (:CSTRING :POINTER-VOID) :VOID
    "ImGui_SetTooltipV(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginItemTooltip" begin-item-tooltip) :BOOL)

#+ecl
(defun begin-item-tooltip ()
  (ffi:c-inline () () :BOOL
    "ImGui_BeginItemTooltip()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetItemTooltip" set-item-tooltip) :VOID
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_SetItemTooltipV" set-item-tooltip-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun set-item-tooltip-v (fmt args)
  (ffi:c-inline (fmt args) (:CSTRING :POINTER-VOID) :VOID
    "ImGui_SetItemTooltipV(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginPopup" begin-popup) :BOOL
  (str-id :STRING)
  (flags WINDOW-FLAGS)
)

#+ecl
(defun begin-popup (str-id flags)
  (ffi:c-inline (str-id flags) (:CSTRING :INT) :BOOL
    "ImGui_BeginPopup(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginPopupModal" begin-popup-modal) :BOOL
  (name :STRING)
  (p-open :POINTER)
  (flags WINDOW-FLAGS)
)

#+ecl
(defun begin-popup-modal (name p-open flags)
  (ffi:c-inline (name p-open flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_BeginPopupModal(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndPopup" end-popup) :VOID)

#+ecl
(defun end-popup ()
  (ffi:c-inline () () :VOID
    "ImGui_EndPopup()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_OpenPopup" open-popup) :VOID
  (str-id :STRING)
  (popup-flags POPUP-FLAGS)
)

#+ecl
(defun open-popup (str-id popup-flags)
  (ffi:c-inline (str-id popup-flags) (:CSTRING :INT) :VOID
    "ImGui_OpenPopup(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_OpenPopupID" open-popup-id) :VOID
  (id ID)
  (popup-flags POPUP-FLAGS)
)

#+ecl
(defun open-popup-id (id popup-flags)
  (ffi:c-inline (id popup-flags) (:INT :INT) :VOID
    "ImGui_OpenPopupID(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_OpenPopupOnItemClick" open-popup-on-item-click) :VOID
  (str-id :STRING)
  (popup-flags POPUP-FLAGS)
)

#+ecl
(defun open-popup-on-item-click (str-id popup-flags)
  (ffi:c-inline (str-id popup-flags) (:CSTRING :INT) :VOID
    "ImGui_OpenPopupOnItemClick(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_CloseCurrentPopup" close-current-popup) :VOID)

#+ecl
(defun close-current-popup ()
  (ffi:c-inline () () :VOID
    "ImGui_CloseCurrentPopup()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginPopupContextItem" begin-popup-context-item) :BOOL)

#+ecl
(defun begin-popup-context-item ()
  (ffi:c-inline () () :BOOL
    "ImGui_BeginPopupContextItem()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginPopupContextItemEx" begin-popup-context-item-ex) :BOOL
  (str-id :STRING)
  (popup-flags POPUP-FLAGS)
)

#+ecl
(defun begin-popup-context-item-ex (str-id popup-flags)
  (ffi:c-inline (str-id popup-flags) (:CSTRING :INT) :BOOL
    "ImGui_BeginPopupContextItemEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginPopupContextWindow" begin-popup-context-window) :BOOL)

#+ecl
(defun begin-popup-context-window ()
  (ffi:c-inline () () :BOOL
    "ImGui_BeginPopupContextWindow()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginPopupContextWindowEx" begin-popup-context-window-ex) :BOOL
  (str-id :STRING)
  (popup-flags POPUP-FLAGS)
)

#+ecl
(defun begin-popup-context-window-ex (str-id popup-flags)
  (ffi:c-inline (str-id popup-flags) (:CSTRING :INT) :BOOL
    "ImGui_BeginPopupContextWindowEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginPopupContextVoid" begin-popup-context-void) :BOOL)

#+ecl
(defun begin-popup-context-void ()
  (ffi:c-inline () () :BOOL
    "ImGui_BeginPopupContextVoid()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginPopupContextVoidEx" begin-popup-context-void-ex) :BOOL
  (str-id :STRING)
  (popup-flags POPUP-FLAGS)
)

#+ecl
(defun begin-popup-context-void-ex (str-id popup-flags)
  (ffi:c-inline (str-id popup-flags) (:CSTRING :INT) :BOOL
    "ImGui_BeginPopupContextVoidEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsPopupOpen" is-popup-open) :BOOL
  (str-id :STRING)
  (flags POPUP-FLAGS)
)

#+ecl
(defun is-popup-open (str-id flags)
  (ffi:c-inline (str-id flags) (:CSTRING :INT) :BOOL
    "ImGui_IsPopupOpen(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginTable" begin-table) :BOOL
  (str-id :STRING)
  (columns :INT)
  (flags TABLE-FLAGS)
)

#+ecl
(defun begin-table (str-id columns flags)
  (ffi:c-inline (str-id columns flags) (:CSTRING :INT :INT) :BOOL
    "ImGui_BeginTable(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndTable" end-table) :VOID)

#+ecl
(defun end-table ()
  (ffi:c-inline () () :VOID
    "ImGui_EndTable()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableNextRow" table-next-row) :VOID)

#+ecl
(defun table-next-row ()
  (ffi:c-inline () () :VOID
    "ImGui_TableNextRow()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableNextRowEx" table-next-row-ex) :VOID
  (row-flags TABLE-ROW-FLAGS)
  (min-row-height :FLOAT)
)

#+ecl
(defun table-next-row-ex (row-flags min-row-height)
  (ffi:c-inline (row-flags min-row-height) (:INT :FLOAT) :VOID
    "ImGui_TableNextRowEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableNextColumn" table-next-column) :BOOL)

#+ecl
(defun table-next-column ()
  (ffi:c-inline () () :BOOL
    "ImGui_TableNextColumn()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableSetColumnIndex" table-set-column-index) :BOOL
  (column-n :INT)
)

#+ecl
(defun table-set-column-index (column-n)
  (ffi:c-inline (column-n) (:INT) :BOOL
    "ImGui_TableSetColumnIndex(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableSetupColumn" table-setup-column) :VOID
  (label :STRING)
  (flags TABLE-COLUMN-FLAGS)
)

#+ecl
(defun table-setup-column (label flags)
  (ffi:c-inline (label flags) (:CSTRING :INT) :VOID
    "ImGui_TableSetupColumn(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableSetupColumnEx" table-setup-column-ex) :VOID
  (label :STRING)
  (flags TABLE-COLUMN-FLAGS)
  (init-width-or-weight :FLOAT)
  (user-id ID)
)

#+ecl
(defun table-setup-column-ex (label flags init-width-or-weight user-id)
  (ffi:c-inline (label flags init-width-or-weight user-id) (:CSTRING :INT :FLOAT :INT) :VOID
    "ImGui_TableSetupColumnEx(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableSetupScrollFreeze" table-setup-scroll-freeze) :VOID
  (cols :INT)
  (rows :INT)
)

#+ecl
(defun table-setup-scroll-freeze (cols rows)
  (ffi:c-inline (cols rows) (:INT :INT) :VOID
    "ImGui_TableSetupScrollFreeze(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableHeader" table-header) :VOID
  (label :STRING)
)

#+ecl
(defun table-header (label)
  (ffi:c-inline (label) (:CSTRING) :VOID
    "ImGui_TableHeader(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableHeadersRow" table-headers-row) :VOID)

#+ecl
(defun table-headers-row ()
  (ffi:c-inline () () :VOID
    "ImGui_TableHeadersRow()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableAngledHeadersRow" table-angled-headers-row) :VOID)

#+ecl
(defun table-angled-headers-row ()
  (ffi:c-inline () () :VOID
    "ImGui_TableAngledHeadersRow()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableGetSortSpecs" table-get-sort-specs) :POINTER)

#+ecl
(defun table-get-sort-specs ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_TableGetSortSpecs()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableGetColumnCount" table-get-column-count) :INT)

#+ecl
(defun table-get-column-count ()
  (ffi:c-inline () () :INT
    "ImGui_TableGetColumnCount()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableGetColumnIndex" table-get-column-index) :INT)

#+ecl
(defun table-get-column-index ()
  (ffi:c-inline () () :INT
    "ImGui_TableGetColumnIndex()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableGetRowIndex" table-get-row-index) :INT)

#+ecl
(defun table-get-row-index ()
  (ffi:c-inline () () :INT
    "ImGui_TableGetRowIndex()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableGetColumnName" table-get-column-name) :STRING
  (column-n :INT)
)

#+ecl
(defun table-get-column-name (column-n)
  (ffi:c-inline (column-n) (:INT) :CSTRING
    "ImGui_TableGetColumnName(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableGetColumnFlags" table-get-column-flags) TABLE-COLUMN-FLAGS
  (column-n :INT)
)

#+ecl
(defun table-get-column-flags (column-n)
  (ffi:c-inline (column-n) (:INT) :INT
    "ImGui_TableGetColumnFlags(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableSetColumnEnabled" table-set-column-enabled) :VOID
  (column-n :INT)
  (v :BOOL)
)

#+ecl
(defun table-set-column-enabled (column-n v)
  (ffi:c-inline (column-n v) (:INT :BOOL) :VOID
    "ImGui_TableSetColumnEnabled(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableGetHoveredColumn" table-get-hovered-column) :INT)

#+ecl
(defun table-get-hovered-column ()
  (ffi:c-inline () () :INT
    "ImGui_TableGetHoveredColumn()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TableSetBgColor" table-set-bg-color) :VOID
  (target TABLE-BG-TARGET)
  (color U32)
  (column-n :INT)
)

#+ecl
(defun table-set-bg-color (target color column-n)
  (ffi:c-inline (target color column-n) (:INT :INT :INT) :VOID
    "ImGui_TableSetBgColor(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Columns" columns) :VOID)

#+ecl
(defun columns ()
  (ffi:c-inline () () :VOID
    "ImGui_Columns()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColumnsEx" columns-ex) :VOID
  (count :INT)
  (id :STRING)
  (borders :BOOL)
)

#+ecl
(defun columns-ex (count id borders)
  (ffi:c-inline (count id borders) (:INT :CSTRING :BOOL) :VOID
    "ImGui_ColumnsEx(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_NextColumn" next-column) :VOID)

#+ecl
(defun next-column ()
  (ffi:c-inline () () :VOID
    "ImGui_NextColumn()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetColumnIndex" get-column-index) :INT)

#+ecl
(defun get-column-index ()
  (ffi:c-inline () () :INT
    "ImGui_GetColumnIndex()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetColumnWidth" get-column-width) :FLOAT
  (column-index :INT)
)

#+ecl
(defun get-column-width (column-index)
  (ffi:c-inline (column-index) (:INT) :FLOAT
    "ImGui_GetColumnWidth(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetColumnWidth" set-column-width) :VOID
  (column-index :INT)
  (width :FLOAT)
)

#+ecl
(defun set-column-width (column-index width)
  (ffi:c-inline (column-index width) (:INT :FLOAT) :VOID
    "ImGui_SetColumnWidth(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetColumnOffset" get-column-offset) :FLOAT
  (column-index :INT)
)

#+ecl
(defun get-column-offset (column-index)
  (ffi:c-inline (column-index) (:INT) :FLOAT
    "ImGui_GetColumnOffset(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetColumnOffset" set-column-offset) :VOID
  (column-index :INT)
  (offset-x :FLOAT)
)

#+ecl
(defun set-column-offset (column-index offset-x)
  (ffi:c-inline (column-index offset-x) (:INT :FLOAT) :VOID
    "ImGui_SetColumnOffset(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetColumnsCount" get-columns-count) :INT)

#+ecl
(defun get-columns-count ()
  (ffi:c-inline () () :INT
    "ImGui_GetColumnsCount()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginTabBar" begin-tab-bar) :BOOL
  (str-id :STRING)
  (flags TAB-BAR-FLAGS)
)

#+ecl
(defun begin-tab-bar (str-id flags)
  (ffi:c-inline (str-id flags) (:CSTRING :INT) :BOOL
    "ImGui_BeginTabBar(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndTabBar" end-tab-bar) :VOID)

#+ecl
(defun end-tab-bar ()
  (ffi:c-inline () () :VOID
    "ImGui_EndTabBar()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginTabItem" begin-tab-item) :BOOL
  (label :STRING)
  (p-open :POINTER)
  (flags TAB-ITEM-FLAGS)
)

#+ecl
(defun begin-tab-item (label p-open flags)
  (ffi:c-inline (label p-open flags) (:CSTRING :POINTER-VOID :INT) :BOOL
    "ImGui_BeginTabItem(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndTabItem" end-tab-item) :VOID)

#+ecl
(defun end-tab-item ()
  (ffi:c-inline () () :VOID
    "ImGui_EndTabItem()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_TabItemButton" tab-item-button) :BOOL
  (label :STRING)
  (flags TAB-ITEM-FLAGS)
)

#+ecl
(defun tab-item-button (label flags)
  (ffi:c-inline (label flags) (:CSTRING :INT) :BOOL
    "ImGui_TabItemButton(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetTabItemClosed" set-tab-item-closed) :VOID
  (tab-or-docked-window-label :STRING)
)

#+ecl
(defun set-tab-item-closed (tab-or-docked-window-label)
  (ffi:c-inline (tab-or-docked-window-label) (:CSTRING) :VOID
    "ImGui_SetTabItemClosed(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_LogToTTY" log-to-tty) :VOID
  (auto-open-depth :INT)
)

#+ecl
(defun log-to-tty (auto-open-depth)
  (ffi:c-inline (auto-open-depth) (:INT) :VOID
    "ImGui_LogToTTY(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_LogToFile" log-to-file) :VOID
  (auto-open-depth :INT)
  (filename :STRING)
)

#+ecl
(defun log-to-file (auto-open-depth filename)
  (ffi:c-inline (auto-open-depth filename) (:INT :CSTRING) :VOID
    "ImGui_LogToFile(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_LogToClipboard" log-to-clipboard) :VOID
  (auto-open-depth :INT)
)

#+ecl
(defun log-to-clipboard (auto-open-depth)
  (ffi:c-inline (auto-open-depth) (:INT) :VOID
    "ImGui_LogToClipboard(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_LogFinish" log-finish) :VOID)

#+ecl
(defun log-finish ()
  (ffi:c-inline () () :VOID
    "ImGui_LogFinish()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_LogButtons" log-buttons) :VOID)

#+ecl
(defun log-buttons ()
  (ffi:c-inline () () :VOID
    "ImGui_LogButtons()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_LogText" log-text) :VOID
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_LogTextV" log-text-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun log-text-v (fmt args)
  (ffi:c-inline (fmt args) (:CSTRING :POINTER-VOID) :VOID
    "ImGui_LogTextV(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginDragDropSource" begin-drag-drop-source) :BOOL
  (flags DRAG-DROP-FLAGS)
)

#+ecl
(defun begin-drag-drop-source (flags)
  (ffi:c-inline (flags) (:INT) :BOOL
    "ImGui_BeginDragDropSource(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetDragDropPayload" set-drag-drop-payload) :BOOL
  (type :STRING)
  (data :POINTER)
  (sz :SIZE)
  (cond COND)
)

#+ecl
(defun set-drag-drop-payload (type data sz cond)
  (ffi:c-inline (type data sz cond) (:CSTRING :POINTER-VOID :UNSIGNED-LONG :INT) :BOOL
    "ImGui_SetDragDropPayload(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndDragDropSource" end-drag-drop-source) :VOID)

#+ecl
(defun end-drag-drop-source ()
  (ffi:c-inline () () :VOID
    "ImGui_EndDragDropSource()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginDragDropTarget" begin-drag-drop-target) :BOOL)

#+ecl
(defun begin-drag-drop-target ()
  (ffi:c-inline () () :BOOL
    "ImGui_BeginDragDropTarget()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_AcceptDragDropPayload" accept-drag-drop-payload) :POINTER
  (type :STRING)
  (flags DRAG-DROP-FLAGS)
)

#+ecl
(defun accept-drag-drop-payload (type flags)
  (ffi:c-inline (type flags) (:CSTRING :INT) :POINTER-VOID
    "ImGui_AcceptDragDropPayload(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndDragDropTarget" end-drag-drop-target) :VOID)

#+ecl
(defun end-drag-drop-target ()
  (ffi:c-inline () () :VOID
    "ImGui_EndDragDropTarget()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetDragDropPayload" get-drag-drop-payload) :POINTER)

#+ecl
(defun get-drag-drop-payload ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetDragDropPayload()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_BeginDisabled" begin-disabled) :VOID
  (disabled :BOOL)
)

#+ecl
(defun begin-disabled (disabled)
  (ffi:c-inline (disabled) (:BOOL) :VOID
    "ImGui_BeginDisabled(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndDisabled" end-disabled) :VOID)

#+ecl
(defun end-disabled ()
  (ffi:c-inline () () :VOID
    "ImGui_EndDisabled()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopClipRect" pop-clip-rect) :VOID)

#+ecl
(defun pop-clip-rect ()
  (ffi:c-inline () () :VOID
    "ImGui_PopClipRect()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetItemDefaultFocus" set-item-default-focus) :VOID)

#+ecl
(defun set-item-default-focus ()
  (ffi:c-inline () () :VOID
    "ImGui_SetItemDefaultFocus()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetKeyboardFocusHere" set-keyboard-focus-here) :VOID)

#+ecl
(defun set-keyboard-focus-here ()
  (ffi:c-inline () () :VOID
    "ImGui_SetKeyboardFocusHere()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetKeyboardFocusHereEx" set-keyboard-focus-here-ex) :VOID
  (offset :INT)
)

#+ecl
(defun set-keyboard-focus-here-ex (offset)
  (ffi:c-inline (offset) (:INT) :VOID
    "ImGui_SetKeyboardFocusHereEx(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNavCursorVisible" set-nav-cursor-visible) :VOID
  (visible :BOOL)
)

#+ecl
(defun set-nav-cursor-visible (visible)
  (ffi:c-inline (visible) (:BOOL) :VOID
    "ImGui_SetNavCursorVisible(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextItemAllowOverlap" set-next-item-allow-overlap) :VOID)

#+ecl
(defun set-next-item-allow-overlap ()
  (ffi:c-inline () () :VOID
    "ImGui_SetNextItemAllowOverlap()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemHovered" is-item-hovered) :BOOL
  (flags HOVERED-FLAGS)
)

#+ecl
(defun is-item-hovered (flags)
  (ffi:c-inline (flags) (:INT) :BOOL
    "ImGui_IsItemHovered(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemActive" is-item-active) :BOOL)

#+ecl
(defun is-item-active ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemActive()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemFocused" is-item-focused) :BOOL)

#+ecl
(defun is-item-focused ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemFocused()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemClicked" is-item-clicked) :BOOL)

#+ecl
(defun is-item-clicked ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemClicked()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemClickedEx" is-item-clicked-ex) :BOOL
  (mouse-button MOUSE-BUTTON)
)

#+ecl
(defun is-item-clicked-ex (mouse-button)
  (ffi:c-inline (mouse-button) (:INT) :BOOL
    "ImGui_IsItemClickedEx(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemVisible" is-item-visible) :BOOL)

#+ecl
(defun is-item-visible ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemVisible()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemEdited" is-item-edited) :BOOL)

#+ecl
(defun is-item-edited ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemEdited()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemActivated" is-item-activated) :BOOL)

#+ecl
(defun is-item-activated ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemActivated()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemDeactivated" is-item-deactivated) :BOOL)

#+ecl
(defun is-item-deactivated ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemDeactivated()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemDeactivatedAfterEdit" is-item-deactivated-after-edit) :BOOL)

#+ecl
(defun is-item-deactivated-after-edit ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemDeactivatedAfterEdit()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsItemToggledOpen" is-item-toggled-open) :BOOL)

#+ecl
(defun is-item-toggled-open ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsItemToggledOpen()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsAnyItemHovered" is-any-item-hovered) :BOOL)

#+ecl
(defun is-any-item-hovered ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsAnyItemHovered()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsAnyItemActive" is-any-item-active) :BOOL)

#+ecl
(defun is-any-item-active ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsAnyItemActive()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsAnyItemFocused" is-any-item-focused) :BOOL)

#+ecl
(defun is-any-item-focused ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsAnyItemFocused()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetItemID" get-item-id) ID)

#+ecl
(defun get-item-id ()
  (ffi:c-inline () () :INT
    "ImGui_GetItemID()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetItemRectMin" get-item-rect-min) VEC2)

#+ecl
(defun get-item-rect-min ()
  (ffi:c-inline () () :INT
    "ImGui_GetItemRectMin()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetItemRectMax" get-item-rect-max) VEC2)

#+ecl
(defun get-item-rect-max ()
  (ffi:c-inline () () :INT
    "ImGui_GetItemRectMax()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetItemRectSize" get-item-rect-size) VEC2)

#+ecl
(defun get-item-rect-size ()
  (ffi:c-inline () () :INT
    "ImGui_GetItemRectSize()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetMainViewport" get-main-viewport) :POINTER)

#+ecl
(defun get-main-viewport ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetMainViewport()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetBackgroundDrawList" get-background-draw-list) :POINTER)

#+ecl
(defun get-background-draw-list ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetBackgroundDrawList()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetForegroundDrawList" get-foreground-draw-list) :POINTER)

#+ecl
(defun get-foreground-draw-list ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetForegroundDrawList()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetTime" get-time) :DOUBLE)

#+ecl
(defun get-time ()
  (ffi:c-inline () () :DOUBLE
    "ImGui_GetTime()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetFrameCount" get-frame-count) :INT)

#+ecl
(defun get-frame-count ()
  (ffi:c-inline () () :INT
    "ImGui_GetFrameCount()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetDrawListSharedData" get-draw-list-shared-data) :POINTER)

#+ecl
(defun get-draw-list-shared-data ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetDrawListSharedData()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetStyleColorName" get-style-color-name) :STRING
  (idx COL)
)

#+ecl
(defun get-style-color-name (idx)
  (ffi:c-inline (idx) (:INT) :CSTRING
    "ImGui_GetStyleColorName(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetStateStorage" set-state-storage) :VOID
  (storage :POINTER)
)

#+ecl
(defun set-state-storage (storage)
  (ffi:c-inline (storage) (:POINTER-VOID) :VOID
    "ImGui_SetStateStorage(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetStateStorage" get-state-storage) :POINTER)

#+ecl
(defun get-state-storage ()
  (ffi:c-inline () () :POINTER-VOID
    "ImGui_GetStateStorage()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_CalcTextSize" calc-text-size) VEC2
  (text :STRING)
)

#+ecl
(defun calc-text-size (text)
  (ffi:c-inline (text) (:CSTRING) :INT
    "ImGui_CalcTextSize(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_CalcTextSizeEx" calc-text-size-ex) VEC2
  (text :STRING)
  (text-end :STRING)
  (hide-text-after-double-hash :BOOL)
  (wrap-width :FLOAT)
)

#+ecl
(defun calc-text-size-ex (text text-end hide-text-after-double-hash wrap-width)
  (ffi:c-inline (text text-end hide-text-after-double-hash wrap-width) (:CSTRING :CSTRING :BOOL :FLOAT) :INT
    "ImGui_CalcTextSizeEx(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorConvertU32ToFloat4" color-convert-u32to-float4) VEC4
  (in U32)
)

#+ecl
(defun color-convert-u32to-float4 (in)
  (ffi:c-inline (in) (:INT) :INT
    "ImGui_ColorConvertU32ToFloat4(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorConvertRGBtoHSV" color-convert-rgbto-hsv) :VOID
  (r :FLOAT)
  (g :FLOAT)
  (b :FLOAT)
  (out-h :POINTER)
  (out-s :POINTER)
  (out-v :POINTER)
)

#+ecl
(defun color-convert-rgbto-hsv (r g b out-h out-s out-v)
  (ffi:c-inline (r g b out-h out-s out-v) (:FLOAT :FLOAT :FLOAT :POINTER-VOID :POINTER-VOID :POINTER-VOID) :VOID
    "ImGui_ColorConvertRGBtoHSV(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ColorConvertHSVtoRGB" color-convert-hsvto-rgb) :VOID
  (h :FLOAT)
  (s :FLOAT)
  (v :FLOAT)
  (out-r :POINTER)
  (out-g :POINTER)
  (out-b :POINTER)
)

#+ecl
(defun color-convert-hsvto-rgb (h s v out-r out-g out-b)
  (ffi:c-inline (h s v out-r out-g out-b) (:FLOAT :FLOAT :FLOAT :POINTER-VOID :POINTER-VOID :POINTER-VOID) :VOID
    "ImGui_ColorConvertHSVtoRGB(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsKeyDown" is-key-down) :BOOL
  (key IM-KEY)
)

#+ecl
(defun is-key-down (key)
  (ffi:c-inline (key) (:INT) :BOOL
    "ImGui_IsKeyDown(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsKeyPressed" is-key-pressed) :BOOL
  (key IM-KEY)
)

#+ecl
(defun is-key-pressed (key)
  (ffi:c-inline (key) (:INT) :BOOL
    "ImGui_IsKeyPressed(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsKeyPressedEx" is-key-pressed-ex) :BOOL
  (key IM-KEY)
  (repeat :BOOL)
)

#+ecl
(defun is-key-pressed-ex (key repeat)
  (ffi:c-inline (key repeat) (:INT :BOOL) :BOOL
    "ImGui_IsKeyPressedEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsKeyReleased" is-key-released) :BOOL
  (key IM-KEY)
)

#+ecl
(defun is-key-released (key)
  (ffi:c-inline (key) (:INT) :BOOL
    "ImGui_IsKeyReleased(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsKeyChordPressed" is-key-chord-pressed) :BOOL
  (key-chord KEY-CHORD)
)

#+ecl
(defun is-key-chord-pressed (key-chord)
  (ffi:c-inline (key-chord) (:INT) :BOOL
    "ImGui_IsKeyChordPressed(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetKeyPressedAmount" get-key-pressed-amount) :INT
  (key IM-KEY)
  (repeat-delay :FLOAT)
  (rate :FLOAT)
)

#+ecl
(defun get-key-pressed-amount (key repeat-delay rate)
  (ffi:c-inline (key repeat-delay rate) (:INT :FLOAT :FLOAT) :INT
    "ImGui_GetKeyPressedAmount(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetKeyName" get-key-name) :STRING
  (key IM-KEY)
)

#+ecl
(defun get-key-name (key)
  (ffi:c-inline (key) (:INT) :CSTRING
    "ImGui_GetKeyName(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextFrameWantCaptureKeyboard" set-next-frame-want-capture-keyboard) :VOID
  (want-capture-keyboard :BOOL)
)

#+ecl
(defun set-next-frame-want-capture-keyboard (want-capture-keyboard)
  (ffi:c-inline (want-capture-keyboard) (:BOOL) :VOID
    "ImGui_SetNextFrameWantCaptureKeyboard(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_Shortcut" shortcut) :BOOL
  (key-chord KEY-CHORD)
  (flags INPUT-FLAGS)
)

#+ecl
(defun shortcut (key-chord flags)
  (ffi:c-inline (key-chord flags) (:INT :INT) :BOOL
    "ImGui_Shortcut(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextItemShortcut" set-next-item-shortcut) :VOID
  (key-chord KEY-CHORD)
  (flags INPUT-FLAGS)
)

#+ecl
(defun set-next-item-shortcut (key-chord flags)
  (ffi:c-inline (key-chord flags) (:INT :INT) :VOID
    "ImGui_SetNextItemShortcut(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetItemKeyOwner" set-item-key-owner) :VOID
  (key IM-KEY)
)

#+ecl
(defun set-item-key-owner (key)
  (ffi:c-inline (key) (:INT) :VOID
    "ImGui_SetItemKeyOwner(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMouseDown" is-mouse-down) :BOOL
  (button MOUSE-BUTTON)
)

#+ecl
(defun is-mouse-down (button)
  (ffi:c-inline (button) (:INT) :BOOL
    "ImGui_IsMouseDown(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMouseClicked" is-mouse-clicked) :BOOL
  (button MOUSE-BUTTON)
)

#+ecl
(defun is-mouse-clicked (button)
  (ffi:c-inline (button) (:INT) :BOOL
    "ImGui_IsMouseClicked(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMouseClickedEx" is-mouse-clicked-ex) :BOOL
  (button MOUSE-BUTTON)
  (repeat :BOOL)
)

#+ecl
(defun is-mouse-clicked-ex (button repeat)
  (ffi:c-inline (button repeat) (:INT :BOOL) :BOOL
    "ImGui_IsMouseClickedEx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMouseReleased" is-mouse-released) :BOOL
  (button MOUSE-BUTTON)
)

#+ecl
(defun is-mouse-released (button)
  (ffi:c-inline (button) (:INT) :BOOL
    "ImGui_IsMouseReleased(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMouseDoubleClicked" is-mouse-double-clicked) :BOOL
  (button MOUSE-BUTTON)
)

#+ecl
(defun is-mouse-double-clicked (button)
  (ffi:c-inline (button) (:INT) :BOOL
    "ImGui_IsMouseDoubleClicked(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMouseReleasedWithDelay" is-mouse-released-with-delay) :BOOL
  (button MOUSE-BUTTON)
  (delay :FLOAT)
)

#+ecl
(defun is-mouse-released-with-delay (button delay)
  (ffi:c-inline (button delay) (:INT :FLOAT) :BOOL
    "ImGui_IsMouseReleasedWithDelay(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetMouseClickedCount" get-mouse-clicked-count) :INT
  (button MOUSE-BUTTON)
)

#+ecl
(defun get-mouse-clicked-count (button)
  (ffi:c-inline (button) (:INT) :INT
    "ImGui_GetMouseClickedCount(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMousePosValid" is-mouse-pos-valid) :BOOL
  (mouse-pos :POINTER)
)

#+ecl
(defun is-mouse-pos-valid (mouse-pos)
  (ffi:c-inline (mouse-pos) (:POINTER-VOID) :BOOL
    "ImGui_IsMousePosValid(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsAnyMouseDown" is-any-mouse-down) :BOOL)

#+ecl
(defun is-any-mouse-down ()
  (ffi:c-inline () () :BOOL
    "ImGui_IsAnyMouseDown()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetMousePos" get-mouse-pos) VEC2)

#+ecl
(defun get-mouse-pos ()
  (ffi:c-inline () () :INT
    "ImGui_GetMousePos()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetMousePosOnOpeningCurrentPopup" get-mouse-pos-on-opening-current-popup) VEC2)

#+ecl
(defun get-mouse-pos-on-opening-current-popup ()
  (ffi:c-inline () () :INT
    "ImGui_GetMousePosOnOpeningCurrentPopup()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_IsMouseDragging" is-mouse-dragging) :BOOL
  (button MOUSE-BUTTON)
  (lock-threshold :FLOAT)
)

#+ecl
(defun is-mouse-dragging (button lock-threshold)
  (ffi:c-inline (button lock-threshold) (:INT :FLOAT) :BOOL
    "ImGui_IsMouseDragging(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetMouseDragDelta" get-mouse-drag-delta) VEC2
  (button MOUSE-BUTTON)
  (lock-threshold :FLOAT)
)

#+ecl
(defun get-mouse-drag-delta (button lock-threshold)
  (ffi:c-inline (button lock-threshold) (:INT :FLOAT) :INT
    "ImGui_GetMouseDragDelta(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ResetMouseDragDelta" reset-mouse-drag-delta) :VOID)

#+ecl
(defun reset-mouse-drag-delta ()
  (ffi:c-inline () () :VOID
    "ImGui_ResetMouseDragDelta()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ResetMouseDragDeltaEx" reset-mouse-drag-delta-ex) :VOID
  (button MOUSE-BUTTON)
)

#+ecl
(defun reset-mouse-drag-delta-ex (button)
  (ffi:c-inline (button) (:INT) :VOID
    "ImGui_ResetMouseDragDeltaEx(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetMouseCursor" get-mouse-cursor) MOUSE-CURSOR)

#+ecl
(defun get-mouse-cursor ()
  (ffi:c-inline () () :INT
    "ImGui_GetMouseCursor()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetMouseCursor" set-mouse-cursor) :VOID
  (cursor-type MOUSE-CURSOR)
)

#+ecl
(defun set-mouse-cursor (cursor-type)
  (ffi:c-inline (cursor-type) (:INT) :VOID
    "ImGui_SetMouseCursor(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetNextFrameWantCaptureMouse" set-next-frame-want-capture-mouse) :VOID
  (want-capture-mouse :BOOL)
)

#+ecl
(defun set-next-frame-want-capture-mouse (want-capture-mouse)
  (ffi:c-inline (want-capture-mouse) (:BOOL) :VOID
    "ImGui_SetNextFrameWantCaptureMouse(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetClipboardText" get-clipboard-text) :STRING)

#+ecl
(defun get-clipboard-text ()
  (ffi:c-inline () () :CSTRING
    "ImGui_GetClipboardText()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetClipboardText" set-clipboard-text) :VOID
  (text :STRING)
)

#+ecl
(defun set-clipboard-text (text)
  (ffi:c-inline (text) (:CSTRING) :VOID
    "ImGui_SetClipboardText(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_LoadIniSettingsFromDisk" load-ini-settings-from-disk) :VOID
  (ini-filename :STRING)
)

#+ecl
(defun load-ini-settings-from-disk (ini-filename)
  (ffi:c-inline (ini-filename) (:CSTRING) :VOID
    "ImGui_LoadIniSettingsFromDisk(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_LoadIniSettingsFromMemory" load-ini-settings-from-memory) :VOID
  (ini-data :STRING)
  (ini-size :SIZE)
)

#+ecl
(defun load-ini-settings-from-memory (ini-data ini-size)
  (ffi:c-inline (ini-data ini-size) (:CSTRING :UNSIGNED-LONG) :VOID
    "ImGui_LoadIniSettingsFromMemory(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SaveIniSettingsToDisk" save-ini-settings-to-disk) :VOID
  (ini-filename :STRING)
)

#+ecl
(defun save-ini-settings-to-disk (ini-filename)
  (ffi:c-inline (ini-filename) (:CSTRING) :VOID
    "ImGui_SaveIniSettingsToDisk(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SaveIniSettingsToMemory" save-ini-settings-to-memory) :STRING
  (out-ini-size :POINTER)
)

#+ecl
(defun save-ini-settings-to-memory (out-ini-size)
  (ffi:c-inline (out-ini-size) (:POINTER-VOID) :CSTRING
    "ImGui_SaveIniSettingsToMemory(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DebugTextEncoding" debug-text-encoding) :VOID
  (text :STRING)
)

#+ecl
(defun debug-text-encoding (text)
  (ffi:c-inline (text) (:CSTRING) :VOID
    "ImGui_DebugTextEncoding(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DebugFlashStyleColor" debug-flash-style-color) :VOID
  (idx COL)
)

#+ecl
(defun debug-flash-style-color (idx)
  (ffi:c-inline (idx) (:INT) :VOID
    "ImGui_DebugFlashStyleColor(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DebugStartItemPicker" debug-start-item-picker) :VOID)

#+ecl
(defun debug-start-item-picker ()
  (ffi:c-inline () () :VOID
    "ImGui_DebugStartItemPicker()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DebugCheckVersionAndDataLayout" debug-check-version-and-data-layout) :BOOL
  (version-str :STRING)
  (sz-io :SIZE)
  (sz-style :SIZE)
  (sz-vec2 :SIZE)
  (sz-vec4 :SIZE)
  (sz-drawvert :SIZE)
  (sz-drawidx :SIZE)
)

#+ecl
(defun debug-check-version-and-data-layout (version-str sz-io sz-style sz-vec2 sz-vec4 sz-drawvert sz-drawidx)
  (ffi:c-inline (version-str sz-io sz-style sz-vec2 sz-vec4 sz-drawvert sz-drawidx) (:CSTRING :UNSIGNED-LONG :UNSIGNED-LONG :UNSIGNED-LONG :UNSIGNED-LONG :UNSIGNED-LONG :UNSIGNED-LONG) :BOOL
    "ImGui_DebugCheckVersionAndDataLayout(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_DebugLog" debug-log) :VOID
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGui_DebugLogV" debug-log-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun debug-log-v (fmt args)
  (ffi:c-inline (fmt args) (:CSTRING :POINTER-VOID) :VOID
    "ImGui_DebugLogV(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetAllocatorFunctions" set-allocator-functions) :VOID
  (alloc-func MEM-ALLOC-FUNC)
  (free-func MEM-FREE-FUNC)
  (user-data :POINTER)
)

#+ecl
(defun set-allocator-functions (alloc-func free-func user-data)
  (ffi:c-inline (alloc-func free-func user-data) (:INT :INT :POINTER-VOID) :VOID
    "ImGui_SetAllocatorFunctions(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetAllocatorFunctions" get-allocator-functions) :VOID
  (p-alloc-func :POINTER)
  (p-free-func :POINTER)
  (p-user-data :POINTER)
)

#+ecl
(defun get-allocator-functions (p-alloc-func p-free-func p-user-data)
  (ffi:c-inline (p-alloc-func p-free-func p-user-data) (:POINTER-VOID :POINTER-VOID :POINTER-VOID) :VOID
    "ImGui_GetAllocatorFunctions(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_MemAlloc" mem-alloc) :POINTER
  (size :SIZE)
)

#+ecl
(defun mem-alloc (size)
  (ffi:c-inline (size) (:UNSIGNED-LONG) :POINTER-VOID
    "ImGui_MemAlloc(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_MemFree" mem-free) :VOID
  (ptr :POINTER)
)

#+ecl
(defun mem-free (ptr)
  (ffi:c-inline (ptr) (:POINTER-VOID) :VOID
    "ImGui_MemFree(#0)"
    :one-liner t))

;; Manual helper function
#-ecl
(defcfun ("ImVector_Construct" vector-construct) :VOID
  (vector :POINTER)
)

#+ecl
(defun vector-construct (vector)
  (ffi:c-inline (vector) (:POINTER-VOID) :VOID
    "ImVector_Construct(#0)"
    :one-liner t))

;; Manual helper function
#-ecl
(defcfun ("ImVector_Destruct" vector-destruct) :VOID
  (vector :POINTER)
)

#+ecl
(defun vector-destruct (vector)
  (ffi:c-inline (vector) (:POINTER-VOID) :VOID
    "ImVector_Destruct(#0)"
    :one-liner t))

;; Manual helper function
#-ecl
(defcfun ("ImStr_FromCharStr" str-from-char-str) :POINTER
  (b :STRING)
)

#+ecl
(defun str-from-char-str (b)
  (ffi:c-inline (b) (:CSTRING) :POINTER-VOID
    "ImStr_FromCharStr(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStyle_ScaleAllSizes" style-scale-all-sizes) :VOID
  (self :POINTER)
  (scale-factor :FLOAT)
)

#+ecl
(defun style-scale-all-sizes (self scale-factor)
  (ffi:c-inline (self scale-factor) (:POINTER-VOID :FLOAT) :VOID
    "ImGuiStyle_ScaleAllSizes(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddKeyEvent" io-add-key-event) :VOID
  (self :POINTER)
  (key IM-KEY)
  (down :BOOL)
)

#+ecl
(defun io-add-key-event (self key down)
  (ffi:c-inline (self key down) (:POINTER-VOID :INT :BOOL) :VOID
    "ImGuiIO_AddKeyEvent(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddKeyAnalogEvent" io-add-key-analog-event) :VOID
  (self :POINTER)
  (key IM-KEY)
  (down :BOOL)
  (v :FLOAT)
)

#+ecl
(defun io-add-key-analog-event (self key down v)
  (ffi:c-inline (self key down v) (:POINTER-VOID :INT :BOOL :FLOAT) :VOID
    "ImGuiIO_AddKeyAnalogEvent(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddMousePosEvent" io-add-mouse-pos-event) :VOID
  (self :POINTER)
  (x :FLOAT)
  (y :FLOAT)
)

#+ecl
(defun io-add-mouse-pos-event (self x y)
  (ffi:c-inline (self x y) (:POINTER-VOID :FLOAT :FLOAT) :VOID
    "ImGuiIO_AddMousePosEvent(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddMouseButtonEvent" io-add-mouse-button-event) :VOID
  (self :POINTER)
  (button :INT)
  (down :BOOL)
)

#+ecl
(defun io-add-mouse-button-event (self button down)
  (ffi:c-inline (self button down) (:POINTER-VOID :INT :BOOL) :VOID
    "ImGuiIO_AddMouseButtonEvent(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddMouseWheelEvent" io-add-mouse-wheel-event) :VOID
  (self :POINTER)
  (wheel-x :FLOAT)
  (wheel-y :FLOAT)
)

#+ecl
(defun io-add-mouse-wheel-event (self wheel-x wheel-y)
  (ffi:c-inline (self wheel-x wheel-y) (:POINTER-VOID :FLOAT :FLOAT) :VOID
    "ImGuiIO_AddMouseWheelEvent(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddMouseSourceEvent" io-add-mouse-source-event) :VOID
  (self :POINTER)
  (source IM-MOUSE-SOURCE)
)

#+ecl
(defun io-add-mouse-source-event (self source)
  (ffi:c-inline (self source) (:POINTER-VOID :INT) :VOID
    "ImGuiIO_AddMouseSourceEvent(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddFocusEvent" io-add-focus-event) :VOID
  (self :POINTER)
  (focused :BOOL)
)

#+ecl
(defun io-add-focus-event (self focused)
  (ffi:c-inline (self focused) (:POINTER-VOID :BOOL) :VOID
    "ImGuiIO_AddFocusEvent(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddInputCharacter" io-add-input-character) :VOID
  (self :POINTER)
  (c :UNSIGNED-INT)
)

#+ecl
(defun io-add-input-character (self c)
  (ffi:c-inline (self c) (:POINTER-VOID :UNSIGNED-INT) :VOID
    "ImGuiIO_AddInputCharacter(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddInputCharacterUTF16" io-add-input-character-utf16) :VOID
  (self :POINTER)
  (c WCHAR16)
)

#+ecl
(defun io-add-input-character-utf16 (self c)
  (ffi:c-inline (self c) (:POINTER-VOID :INT) :VOID
    "ImGuiIO_AddInputCharacterUTF16(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_AddInputCharactersUTF8" io-add-input-characters-utf8) :VOID
  (self :POINTER)
  (str :STRING)
)

#+ecl
(defun io-add-input-characters-utf8 (self str)
  (ffi:c-inline (self str) (:POINTER-VOID :CSTRING) :VOID
    "ImGuiIO_AddInputCharactersUTF8(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_SetKeyEventNativeData" io-set-key-event-native-data) :VOID
  (self :POINTER)
  (key IM-KEY)
  (native-keycode :INT)
  (native-scancode :INT)
)

#+ecl
(defun io-set-key-event-native-data (self key native-keycode native-scancode)
  (ffi:c-inline (self key native-keycode native-scancode) (:POINTER-VOID :INT :INT :INT) :VOID
    "ImGuiIO_SetKeyEventNativeData(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_SetKeyEventNativeDataEx" io-set-key-event-native-data-ex) :VOID
  (self :POINTER)
  (key IM-KEY)
  (native-keycode :INT)
  (native-scancode :INT)
  (native-legacy-index :INT)
)

#+ecl
(defun io-set-key-event-native-data-ex (self key native-keycode native-scancode native-legacy-index)
  (ffi:c-inline (self key native-keycode native-scancode native-legacy-index) (:POINTER-VOID :INT :INT :INT :INT) :VOID
    "ImGuiIO_SetKeyEventNativeDataEx(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_SetAppAcceptingEvents" io-set-app-accepting-events) :VOID
  (self :POINTER)
  (accepting-events :BOOL)
)

#+ecl
(defun io-set-app-accepting-events (self accepting-events)
  (ffi:c-inline (self accepting-events) (:POINTER-VOID :BOOL) :VOID
    "ImGuiIO_SetAppAcceptingEvents(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_ClearEventsQueue" io-clear-events-queue) :VOID
  (self :POINTER)
)

#+ecl
(defun io-clear-events-queue (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiIO_ClearEventsQueue(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_ClearInputKeys" io-clear-input-keys) :VOID
  (self :POINTER)
)

#+ecl
(defun io-clear-input-keys (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiIO_ClearInputKeys(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiIO_ClearInputMouse" io-clear-input-mouse) :VOID
  (self :POINTER)
)

#+ecl
(defun io-clear-input-mouse (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiIO_ClearInputMouse(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiInputTextCallbackData_DeleteChars" input-text-callback-data-delete-chars) :VOID
  (self :POINTER)
  (pos :INT)
  (bytes-count :INT)
)

#+ecl
(defun input-text-callback-data-delete-chars (self pos bytes-count)
  (ffi:c-inline (self pos bytes-count) (:POINTER-VOID :INT :INT) :VOID
    "ImGuiInputTextCallbackData_DeleteChars(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiInputTextCallbackData_InsertChars" input-text-callback-data-insert-chars) :VOID
  (self :POINTER)
  (pos :INT)
  (text :STRING)
  (text-end :STRING)
)

#+ecl
(defun input-text-callback-data-insert-chars (self pos text text-end)
  (ffi:c-inline (self pos text text-end) (:POINTER-VOID :INT :CSTRING :CSTRING) :VOID
    "ImGuiInputTextCallbackData_InsertChars(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiInputTextCallbackData_SelectAll" input-text-callback-data-select-all) :VOID
  (self :POINTER)
)

#+ecl
(defun input-text-callback-data-select-all (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiInputTextCallbackData_SelectAll(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiInputTextCallbackData_ClearSelection" input-text-callback-data-clear-selection) :VOID
  (self :POINTER)
)

#+ecl
(defun input-text-callback-data-clear-selection (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiInputTextCallbackData_ClearSelection(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiInputTextCallbackData_HasSelection" input-text-callback-data-has-selection) :BOOL
  (self :POINTER)
)

#+ecl
(defun input-text-callback-data-has-selection (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImGuiInputTextCallbackData_HasSelection(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiPayload_Clear" payload-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun payload-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiPayload_Clear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiPayload_IsDataType" payload-is-data-type) :BOOL
  (self :POINTER)
  (type :STRING)
)

#+ecl
(defun payload-is-data-type (self type)
  (ffi:c-inline (self type) (:POINTER-VOID :CSTRING) :BOOL
    "ImGuiPayload_IsDataType(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiPayload_IsPreview" payload-is-preview) :BOOL
  (self :POINTER)
)

#+ecl
(defun payload-is-preview (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImGuiPayload_IsPreview(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiPayload_IsDelivery" payload-is-delivery) :BOOL
  (self :POINTER)
)

#+ecl
(defun payload-is-delivery (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImGuiPayload_IsDelivery(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextFilter_ImGuiTextRange_empty" text-filter-im-gui-text-range-empty) :BOOL
  (self :POINTER)
)

#+ecl
(defun text-filter-im-gui-text-range-empty (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImGuiTextFilter_ImGuiTextRange_empty(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextFilter_ImGuiTextRange_split" text-filter-im-gui-text-range-split) :VOID
  (self :POINTER)
  (separator :CHAR)
  (out :POINTER)
)

#+ecl
(defun text-filter-im-gui-text-range-split (self separator out)
  (ffi:c-inline (self separator out) (:POINTER-VOID :CHAR :POINTER-VOID) :VOID
    "ImGuiTextFilter_ImGuiTextRange_split(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextFilter_Draw" text-filter-draw) :BOOL
  (self :POINTER)
  (label :STRING)
  (width :FLOAT)
)

#+ecl
(defun text-filter-draw (self label width)
  (ffi:c-inline (self label width) (:POINTER-VOID :CSTRING :FLOAT) :BOOL
    "ImGuiTextFilter_Draw(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextFilter_PassFilter" text-filter-pass-filter) :BOOL
  (self :POINTER)
  (text :STRING)
  (text-end :STRING)
)

#+ecl
(defun text-filter-pass-filter (self text text-end)
  (ffi:c-inline (self text text-end) (:POINTER-VOID :CSTRING :CSTRING) :BOOL
    "ImGuiTextFilter_PassFilter(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextFilter_Build" text-filter-build) :VOID
  (self :POINTER)
)

#+ecl
(defun text-filter-build (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiTextFilter_Build(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextFilter_Clear" text-filter-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun text-filter-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiTextFilter_Clear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextFilter_IsActive" text-filter-is-active) :BOOL
  (self :POINTER)
)

#+ecl
(defun text-filter-is-active (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImGuiTextFilter_IsActive(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_begin" text-buffer-begin) :STRING
  (self :POINTER)
)

#+ecl
(defun text-buffer-begin (self)
  (ffi:c-inline (self) (:POINTER-VOID) :CSTRING
    "ImGuiTextBuffer_begin(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_end" text-buffer-end) :STRING
  (self :POINTER)
)

#+ecl
(defun text-buffer-end (self)
  (ffi:c-inline (self) (:POINTER-VOID) :CSTRING
    "ImGuiTextBuffer_end(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_size" text-buffer-size) :INT
  (self :POINTER)
)

#+ecl
(defun text-buffer-size (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImGuiTextBuffer_size(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_empty" text-buffer-empty) :BOOL
  (self :POINTER)
)

#+ecl
(defun text-buffer-empty (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImGuiTextBuffer_empty(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_clear" text-buffer-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun text-buffer-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiTextBuffer_clear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_resize" text-buffer-resize) :VOID
  (self :POINTER)
  (size :INT)
)

#+ecl
(defun text-buffer-resize (self size)
  (ffi:c-inline (self size) (:POINTER-VOID :INT) :VOID
    "ImGuiTextBuffer_resize(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_reserve" text-buffer-reserve) :VOID
  (self :POINTER)
  (capacity :INT)
)

#+ecl
(defun text-buffer-reserve (self capacity)
  (ffi:c-inline (self capacity) (:POINTER-VOID :INT) :VOID
    "ImGuiTextBuffer_reserve(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_c_str" text-buffer-c-str) :STRING
  (self :POINTER)
)

#+ecl
(defun text-buffer-c-str (self)
  (ffi:c-inline (self) (:POINTER-VOID) :CSTRING
    "ImGuiTextBuffer_c_str(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_append" text-buffer-append) :VOID
  (self :POINTER)
  (str :STRING)
  (str-end :STRING)
)

#+ecl
(defun text-buffer-append (self str str-end)
  (ffi:c-inline (self str str-end) (:POINTER-VOID :CSTRING :CSTRING) :VOID
    "ImGuiTextBuffer_append(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiTextBuffer_appendf" text-buffer-appendf) :VOID
  (self :POINTER)
  (fmt :STRING)
  &rest
)

#-ecl
(defcfun ("ImGuiTextBuffer_appendfv" text-buffer-appendfv) :VOID
  (self :POINTER)
  (fmt :STRING)
  (args :POINTER)
)

#+ecl
(defun text-buffer-appendfv (self fmt args)
  (ffi:c-inline (self fmt args) (:POINTER-VOID :CSTRING :POINTER-VOID) :VOID
    "ImGuiTextBuffer_appendfv(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_Clear" storage-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun storage-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiStorage_Clear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_GetInt" storage-get-int) :INT
  (self :POINTER)
  (key ID)
  (default-val :INT)
)

#+ecl
(defun storage-get-int (self key default-val)
  (ffi:c-inline (self key default-val) (:POINTER-VOID :INT :INT) :INT
    "ImGuiStorage_GetInt(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_SetInt" storage-set-int) :VOID
  (self :POINTER)
  (key ID)
  (val :INT)
)

#+ecl
(defun storage-set-int (self key val)
  (ffi:c-inline (self key val) (:POINTER-VOID :INT :INT) :VOID
    "ImGuiStorage_SetInt(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_GetBool" storage-get-bool) :BOOL
  (self :POINTER)
  (key ID)
  (default-val :BOOL)
)

#+ecl
(defun storage-get-bool (self key default-val)
  (ffi:c-inline (self key default-val) (:POINTER-VOID :INT :BOOL) :BOOL
    "ImGuiStorage_GetBool(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_SetBool" storage-set-bool) :VOID
  (self :POINTER)
  (key ID)
  (val :BOOL)
)

#+ecl
(defun storage-set-bool (self key val)
  (ffi:c-inline (self key val) (:POINTER-VOID :INT :BOOL) :VOID
    "ImGuiStorage_SetBool(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_GetFloat" storage-get-float) :FLOAT
  (self :POINTER)
  (key ID)
  (default-val :FLOAT)
)

#+ecl
(defun storage-get-float (self key default-val)
  (ffi:c-inline (self key default-val) (:POINTER-VOID :INT :FLOAT) :FLOAT
    "ImGuiStorage_GetFloat(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_SetFloat" storage-set-float) :VOID
  (self :POINTER)
  (key ID)
  (val :FLOAT)
)

#+ecl
(defun storage-set-float (self key val)
  (ffi:c-inline (self key val) (:POINTER-VOID :INT :FLOAT) :VOID
    "ImGuiStorage_SetFloat(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_GetVoidPtr" storage-get-void-ptr) :POINTER
  (self :POINTER)
  (key ID)
)

#+ecl
(defun storage-get-void-ptr (self key)
  (ffi:c-inline (self key) (:POINTER-VOID :INT) :POINTER-VOID
    "ImGuiStorage_GetVoidPtr(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_SetVoidPtr" storage-set-void-ptr) :VOID
  (self :POINTER)
  (key ID)
  (val :POINTER)
)

#+ecl
(defun storage-set-void-ptr (self key val)
  (ffi:c-inline (self key val) (:POINTER-VOID :INT :POINTER-VOID) :VOID
    "ImGuiStorage_SetVoidPtr(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_GetIntRef" storage-get-int-ref) :POINTER
  (self :POINTER)
  (key ID)
  (default-val :INT)
)

#+ecl
(defun storage-get-int-ref (self key default-val)
  (ffi:c-inline (self key default-val) (:POINTER-VOID :INT :INT) :POINTER-VOID
    "ImGuiStorage_GetIntRef(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_GetBoolRef" storage-get-bool-ref) :POINTER
  (self :POINTER)
  (key ID)
  (default-val :BOOL)
)

#+ecl
(defun storage-get-bool-ref (self key default-val)
  (ffi:c-inline (self key default-val) (:POINTER-VOID :INT :BOOL) :POINTER-VOID
    "ImGuiStorage_GetBoolRef(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_GetFloatRef" storage-get-float-ref) :POINTER
  (self :POINTER)
  (key ID)
  (default-val :FLOAT)
)

#+ecl
(defun storage-get-float-ref (self key default-val)
  (ffi:c-inline (self key default-val) (:POINTER-VOID :INT :FLOAT) :POINTER-VOID
    "ImGuiStorage_GetFloatRef(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_GetVoidPtrRef" storage-get-void-ptr-ref) :POINTER
  (self :POINTER)
  (key ID)
  (default-val :POINTER)
)

#+ecl
(defun storage-get-void-ptr-ref (self key default-val)
  (ffi:c-inline (self key default-val) (:POINTER-VOID :INT :POINTER-VOID) :POINTER-VOID
    "ImGuiStorage_GetVoidPtrRef(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_BuildSortByKey" storage-build-sort-by-key) :VOID
  (self :POINTER)
)

#+ecl
(defun storage-build-sort-by-key (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiStorage_BuildSortByKey(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiStorage_SetAllInt" storage-set-all-int) :VOID
  (self :POINTER)
  (val :INT)
)

#+ecl
(defun storage-set-all-int (self val)
  (ffi:c-inline (self val) (:POINTER-VOID :INT) :VOID
    "ImGuiStorage_SetAllInt(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiListClipper_Begin" list-clipper-begin) :VOID
  (self :POINTER)
  (items-count :INT)
  (items-height :FLOAT)
)

#+ecl
(defun list-clipper-begin (self items-count items-height)
  (ffi:c-inline (self items-count items-height) (:POINTER-VOID :INT :FLOAT) :VOID
    "ImGuiListClipper_Begin(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiListClipper_End" list-clipper-end) :VOID
  (self :POINTER)
)

#+ecl
(defun list-clipper-end (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiListClipper_End(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiListClipper_Step" list-clipper-step) :BOOL
  (self :POINTER)
)

#+ecl
(defun list-clipper-step (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImGuiListClipper_Step(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiListClipper_IncludeItemByIndex" list-clipper-include-item-by-index) :VOID
  (self :POINTER)
  (item-index :INT)
)

#+ecl
(defun list-clipper-include-item-by-index (self item-index)
  (ffi:c-inline (self item-index) (:POINTER-VOID :INT) :VOID
    "ImGuiListClipper_IncludeItemByIndex(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiListClipper_IncludeItemsByIndex" list-clipper-include-items-by-index) :VOID
  (self :POINTER)
  (item-begin :INT)
  (item-end :INT)
)

#+ecl
(defun list-clipper-include-items-by-index (self item-begin item-end)
  (ffi:c-inline (self item-begin item-end) (:POINTER-VOID :INT :INT) :VOID
    "ImGuiListClipper_IncludeItemsByIndex(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiListClipper_SeekCursorForItem" list-clipper-seek-cursor-for-item) :VOID
  (self :POINTER)
  (item-index :INT)
)

#+ecl
(defun list-clipper-seek-cursor-for-item (self item-index)
  (ffi:c-inline (self item-index) (:POINTER-VOID :INT) :VOID
    "ImGuiListClipper_SeekCursorForItem(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImColor_SetHSV" color-set-hsv) :VOID
  (self :POINTER)
  (h :FLOAT)
  (s :FLOAT)
  (v :FLOAT)
  (a :FLOAT)
)

#+ecl
(defun color-set-hsv (self h s v a)
  (ffi:c-inline (self h s v a) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :FLOAT) :VOID
    "ImColor_SetHSV(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImColor_HSV" color-hsv) COLOR
  (h :FLOAT)
  (s :FLOAT)
  (v :FLOAT)
  (a :FLOAT)
)

#+ecl
(defun color-hsv (h s v a)
  (ffi:c-inline (h s v a) (:FLOAT :FLOAT :FLOAT :FLOAT) :INT
    "ImColor_HSV(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiSelectionBasicStorage_ApplyRequests" selection-basic-storage-apply-requests) :VOID
  (self :POINTER)
  (ms-io :POINTER)
)

#+ecl
(defun selection-basic-storage-apply-requests (self ms-io)
  (ffi:c-inline (self ms-io) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImGuiSelectionBasicStorage_ApplyRequests(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiSelectionBasicStorage_Contains" selection-basic-storage-contains) :BOOL
  (self :POINTER)
  (id ID)
)

#+ecl
(defun selection-basic-storage-contains (self id)
  (ffi:c-inline (self id) (:POINTER-VOID :INT) :BOOL
    "ImGuiSelectionBasicStorage_Contains(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiSelectionBasicStorage_Clear" selection-basic-storage-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun selection-basic-storage-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiSelectionBasicStorage_Clear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiSelectionBasicStorage_Swap" selection-basic-storage-swap) :VOID
  (self :POINTER)
  (r :POINTER)
)

#+ecl
(defun selection-basic-storage-swap (self r)
  (ffi:c-inline (self r) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImGuiSelectionBasicStorage_Swap(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiSelectionBasicStorage_SetItemSelected" selection-basic-storage-set-item-selected) :VOID
  (self :POINTER)
  (id ID)
  (selected :BOOL)
)

#+ecl
(defun selection-basic-storage-set-item-selected (self id selected)
  (ffi:c-inline (self id selected) (:POINTER-VOID :INT :BOOL) :VOID
    "ImGuiSelectionBasicStorage_SetItemSelected(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiSelectionBasicStorage_GetNextSelectedItem" selection-basic-storage-get-next-selected-item) :BOOL
  (self :POINTER)
  (opaque-it :POINTER)
  (out-id :POINTER)
)

#+ecl
(defun selection-basic-storage-get-next-selected-item (self opaque-it out-id)
  (ffi:c-inline (self opaque-it out-id) (:POINTER-VOID :POINTER-VOID :POINTER-VOID) :BOOL
    "ImGuiSelectionBasicStorage_GetNextSelectedItem(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiSelectionBasicStorage_GetStorageIdFromIndex" selection-basic-storage-get-storage-id-from-index) ID
  (self :POINTER)
  (idx :INT)
)

#+ecl
(defun selection-basic-storage-get-storage-id-from-index (self idx)
  (ffi:c-inline (self idx) (:POINTER-VOID :INT) :INT
    "ImGuiSelectionBasicStorage_GetStorageIdFromIndex(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiSelectionExternalStorage_ApplyRequests" selection-external-storage-apply-requests) :VOID
  (self :POINTER)
  (ms-io :POINTER)
)

#+ecl
(defun selection-external-storage-apply-requests (self ms-io)
  (ffi:c-inline (self ms-io) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImGuiSelectionExternalStorage_ApplyRequests(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawCmd_GetTexID" draw-cmd-get-tex-id) TEXTURE-ID
  (self :POINTER)
)

#+ecl
(defun draw-cmd-get-tex-id (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImDrawCmd_GetTexID(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawListSplitter_Clear" draw-list-splitter-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list-splitter-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawListSplitter_Clear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawListSplitter_ClearFreeMemory" draw-list-splitter-clear-free-memory) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list-splitter-clear-free-memory (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawListSplitter_ClearFreeMemory(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawListSplitter_Split" draw-list-splitter-split) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (count :INT)
)

#+ecl
(defun draw-list-splitter-split (self draw-list count)
  (ffi:c-inline (self draw-list count) (:POINTER-VOID :POINTER-VOID :INT) :VOID
    "ImDrawListSplitter_Split(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawListSplitter_Merge" draw-list-splitter-merge) :VOID
  (self :POINTER)
  (draw-list :POINTER)
)

#+ecl
(defun draw-list-splitter-merge (self draw-list)
  (ffi:c-inline (self draw-list) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImDrawListSplitter_Merge(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawListSplitter_SetCurrentChannel" draw-list-splitter-set-current-channel) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (channel-idx :INT)
)

#+ecl
(defun draw-list-splitter-set-current-channel (self draw-list channel-idx)
  (ffi:c-inline (self draw-list channel-idx) (:POINTER-VOID :POINTER-VOID :INT) :VOID
    "ImDrawListSplitter_SetCurrentChannel(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PushClipRectFullScreen" draw-list-push-clip-rect-full-screen) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list-push-clip-rect-full-screen (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList_PushClipRectFullScreen(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PopClipRect" draw-list-pop-clip-rect) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list-pop-clip-rect (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList_PopClipRect(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PopTexture" draw-list-pop-texture) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list-pop-texture (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList_PopTexture(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_GetClipRectMin" draw-list-get-clip-rect-min) VEC2
  (self :POINTER)
)

#+ecl
(defun draw-list-get-clip-rect-min (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImDrawList_GetClipRectMin(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_GetClipRectMax" draw-list-get-clip-rect-max) VEC2
  (self :POINTER)
)

#+ecl
(defun draw-list-get-clip-rect-max (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImDrawList_GetClipRectMax(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddPolyline" draw-list-add-polyline) :VOID
  (self :POINTER)
  (points :POINTER)
  (num-points :INT)
  (col U32)
  (flags DRAW-FLAGS)
  (thickness :FLOAT)
)

#+ecl
(defun draw-list-add-polyline (self points num-points col flags thickness)
  (ffi:c-inline (self points num-points col flags thickness) (:POINTER-VOID :POINTER-VOID :INT :INT :INT :FLOAT) :VOID
    "ImDrawList_AddPolyline(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddConvexPolyFilled" draw-list-add-convex-poly-filled) :VOID
  (self :POINTER)
  (points :POINTER)
  (num-points :INT)
  (col U32)
)

#+ecl
(defun draw-list-add-convex-poly-filled (self points num-points col)
  (ffi:c-inline (self points num-points col) (:POINTER-VOID :POINTER-VOID :INT :INT) :VOID
    "ImDrawList_AddConvexPolyFilled(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddConcavePolyFilled" draw-list-add-concave-poly-filled) :VOID
  (self :POINTER)
  (points :POINTER)
  (num-points :INT)
  (col U32)
)

#+ecl
(defun draw-list-add-concave-poly-filled (self points num-points col)
  (ffi:c-inline (self points num-points col) (:POINTER-VOID :POINTER-VOID :INT :INT) :VOID
    "ImDrawList_AddConcavePolyFilled(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathClear" draw-list-path-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list-path-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList_PathClear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathFillConvex" draw-list-path-fill-convex) :VOID
  (self :POINTER)
  (col U32)
)

#+ecl
(defun draw-list-path-fill-convex (self col)
  (ffi:c-inline (self col) (:POINTER-VOID :INT) :VOID
    "ImDrawList_PathFillConvex(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathFillConcave" draw-list-path-fill-concave) :VOID
  (self :POINTER)
  (col U32)
)

#+ecl
(defun draw-list-path-fill-concave (self col)
  (ffi:c-inline (self col) (:POINTER-VOID :INT) :VOID
    "ImDrawList_PathFillConcave(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PathStroke" draw-list-path-stroke) :VOID
  (self :POINTER)
  (col U32)
  (flags DRAW-FLAGS)
  (thickness :FLOAT)
)

#+ecl
(defun draw-list-path-stroke (self col flags thickness)
  (ffi:c-inline (self col flags thickness) (:POINTER-VOID :INT :INT :FLOAT) :VOID
    "ImDrawList_PathStroke(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddCallback" draw-list-add-callback) :VOID
  (self :POINTER)
  (callback DRAW-CALLBACK)
  (userdata :POINTER)
)

#+ecl
(defun draw-list-add-callback (self callback userdata)
  (ffi:c-inline (self callback userdata) (:POINTER-VOID :INT :POINTER-VOID) :VOID
    "ImDrawList_AddCallback(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddCallbackEx" draw-list-add-callback-ex) :VOID
  (self :POINTER)
  (callback DRAW-CALLBACK)
  (userdata :POINTER)
  (userdata-size :SIZE)
)

#+ecl
(defun draw-list-add-callback-ex (self callback userdata userdata-size)
  (ffi:c-inline (self callback userdata userdata-size) (:POINTER-VOID :INT :POINTER-VOID :UNSIGNED-LONG) :VOID
    "ImDrawList_AddCallbackEx(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_AddDrawCmd" draw-list-add-draw-cmd) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list-add-draw-cmd (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList_AddDrawCmd(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_CloneOutput" draw-list-clone-output) :POINTER
  (self :POINTER)
)

#+ecl
(defun draw-list-clone-output (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImDrawList_CloneOutput(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_ChannelsSplit" draw-list-channels-split) :VOID
  (self :POINTER)
  (count :INT)
)

#+ecl
(defun draw-list-channels-split (self count)
  (ffi:c-inline (self count) (:POINTER-VOID :INT) :VOID
    "ImDrawList_ChannelsSplit(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_ChannelsMerge" draw-list-channels-merge) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list-channels-merge (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList_ChannelsMerge(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_ChannelsSetCurrent" draw-list-channels-set-current) :VOID
  (self :POINTER)
  (n :INT)
)

#+ecl
(defun draw-list-channels-set-current (self n)
  (ffi:c-inline (self n) (:POINTER-VOID :INT) :VOID
    "ImDrawList_ChannelsSetCurrent(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PrimReserve" draw-list-prim-reserve) :VOID
  (self :POINTER)
  (idx-count :INT)
  (vtx-count :INT)
)

#+ecl
(defun draw-list-prim-reserve (self idx-count vtx-count)
  (ffi:c-inline (self idx-count vtx-count) (:POINTER-VOID :INT :INT) :VOID
    "ImDrawList_PrimReserve(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PrimUnreserve" draw-list-prim-unreserve) :VOID
  (self :POINTER)
  (idx-count :INT)
  (vtx-count :INT)
)

#+ecl
(defun draw-list-prim-unreserve (self idx-count vtx-count)
  (ffi:c-inline (self idx-count vtx-count) (:POINTER-VOID :INT :INT) :VOID
    "ImDrawList_PrimUnreserve(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PrimWriteIdx" draw-list-prim-write-idx) :VOID
  (self :POINTER)
  (idx DRAW-IDX)
)

#+ecl
(defun draw-list-prim-write-idx (self idx)
  (ffi:c-inline (self idx) (:POINTER-VOID :INT) :VOID
    "ImDrawList_PrimWriteIdx(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList_PopTextureID" draw-list-pop-texture-id) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list-pop-texture-id (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList_PopTextureID(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__SetDrawListSharedData" draw-list--set-draw-list-shared-data) :VOID
  (self :POINTER)
  (data :POINTER)
)

#+ecl
(defun draw-list--set-draw-list-shared-data (self data)
  (ffi:c-inline (self data) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImDrawList__SetDrawListSharedData(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__ResetForNewFrame" draw-list--reset-for-new-frame) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list--reset-for-new-frame (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList__ResetForNewFrame(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__ClearFreeMemory" draw-list--clear-free-memory) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list--clear-free-memory (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList__ClearFreeMemory(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__PopUnusedDrawCmd" draw-list--pop-unused-draw-cmd) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list--pop-unused-draw-cmd (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList__PopUnusedDrawCmd(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__TryMergeDrawCmds" draw-list--try-merge-draw-cmds) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list--try-merge-draw-cmds (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList__TryMergeDrawCmds(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__OnChangedClipRect" draw-list--on-changed-clip-rect) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list--on-changed-clip-rect (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList__OnChangedClipRect(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__OnChangedTexture" draw-list--on-changed-texture) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list--on-changed-texture (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList__OnChangedTexture(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__OnChangedVtxOffset" draw-list--on-changed-vtx-offset) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-list--on-changed-vtx-offset (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawList__OnChangedVtxOffset(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawList__CalcCircleAutoSegmentCount" draw-list--calc-circle-auto-segment-count) :INT
  (self :POINTER)
  (radius :FLOAT)
)

#+ecl
(defun draw-list--calc-circle-auto-segment-count (self radius)
  (ffi:c-inline (self radius) (:POINTER-VOID :FLOAT) :INT
    "ImDrawList__CalcCircleAutoSegmentCount(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawData_Clear" draw-data-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-data-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawData_Clear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawData_AddDrawList" draw-data-add-draw-list) :VOID
  (self :POINTER)
  (draw-list :POINTER)
)

#+ecl
(defun draw-data-add-draw-list (self draw-list)
  (ffi:c-inline (self draw-list) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImDrawData_AddDrawList(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImDrawData_DeIndexAllBuffers" draw-data-de-index-all-buffers) :VOID
  (self :POINTER)
)

#+ecl
(defun draw-data-de-index-all-buffers (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImDrawData_DeIndexAllBuffers(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_Create" texture-data-create) :VOID
  (self :POINTER)
  (format IM-TEXTURE-FORMAT)
  (w :INT)
  (h :INT)
)

#+ecl
(defun texture-data-create (self format w h)
  (ffi:c-inline (self format w h) (:POINTER-VOID :INT :INT :INT) :VOID
    "ImTextureData_Create(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_DestroyPixels" texture-data-destroy-pixels) :VOID
  (self :POINTER)
)

#+ecl
(defun texture-data-destroy-pixels (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImTextureData_DestroyPixels(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_GetPixels" texture-data-get-pixels) :POINTER
  (self :POINTER)
)

#+ecl
(defun texture-data-get-pixels (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImTextureData_GetPixels(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_GetPixelsAt" texture-data-get-pixels-at) :POINTER
  (self :POINTER)
  (x :INT)
  (y :INT)
)

#+ecl
(defun texture-data-get-pixels-at (self x y)
  (ffi:c-inline (self x y) (:POINTER-VOID :INT :INT) :POINTER-VOID
    "ImTextureData_GetPixelsAt(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_GetSizeInBytes" texture-data-get-size-in-bytes) :INT
  (self :POINTER)
)

#+ecl
(defun texture-data-get-size-in-bytes (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImTextureData_GetSizeInBytes(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_GetPitch" texture-data-get-pitch) :INT
  (self :POINTER)
)

#+ecl
(defun texture-data-get-pitch (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImTextureData_GetPitch(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_GetTexRef" texture-data-get-tex-ref) TEXTURE-REF
  (self :POINTER)
)

#+ecl
(defun texture-data-get-tex-ref (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImTextureData_GetTexRef(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_GetTexID" texture-data-get-tex-id) TEXTURE-ID
  (self :POINTER)
)

#+ecl
(defun texture-data-get-tex-id (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImTextureData_GetTexID(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_SetTexID" texture-data-set-tex-id) :VOID
  (self :POINTER)
  (tex-id TEXTURE-ID)
)

#+ecl
(defun texture-data-set-tex-id (self tex-id)
  (ffi:c-inline (self tex-id) (:POINTER-VOID :INT) :VOID
    "ImTextureData_SetTexID(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImTextureData_SetStatus" texture-data-set-status) :VOID
  (self :POINTER)
  (status IM-TEXTURE-STATUS)
)

#+ecl
(defun texture-data-set-status (self status)
  (ffi:c-inline (self status) (:POINTER-VOID :INT) :VOID
    "ImTextureData_SetStatus(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontGlyphRangesBuilder_Clear" font-glyph-ranges-builder-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun font-glyph-ranges-builder-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImFontGlyphRangesBuilder_Clear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontGlyphRangesBuilder_GetBit" font-glyph-ranges-builder-get-bit) :BOOL
  (self :POINTER)
  (n :SIZE)
)

#+ecl
(defun font-glyph-ranges-builder-get-bit (self n)
  (ffi:c-inline (self n) (:POINTER-VOID :UNSIGNED-LONG) :BOOL
    "ImFontGlyphRangesBuilder_GetBit(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontGlyphRangesBuilder_SetBit" font-glyph-ranges-builder-set-bit) :VOID
  (self :POINTER)
  (n :SIZE)
)

#+ecl
(defun font-glyph-ranges-builder-set-bit (self n)
  (ffi:c-inline (self n) (:POINTER-VOID :UNSIGNED-LONG) :VOID
    "ImFontGlyphRangesBuilder_SetBit(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontGlyphRangesBuilder_AddChar" font-glyph-ranges-builder-add-char) :VOID
  (self :POINTER)
  (c WCHAR)
)

#+ecl
(defun font-glyph-ranges-builder-add-char (self c)
  (ffi:c-inline (self c) (:POINTER-VOID :INT) :VOID
    "ImFontGlyphRangesBuilder_AddChar(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontGlyphRangesBuilder_AddText" font-glyph-ranges-builder-add-text) :VOID
  (self :POINTER)
  (text :STRING)
  (text-end :STRING)
)

#+ecl
(defun font-glyph-ranges-builder-add-text (self text text-end)
  (ffi:c-inline (self text text-end) (:POINTER-VOID :CSTRING :CSTRING) :VOID
    "ImFontGlyphRangesBuilder_AddText(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImFontGlyphRangesBuilder_AddRanges" font-glyph-ranges-builder-add-ranges) :VOID
  (self :POINTER)
  (ranges :POINTER)
)

#+ecl
(defun font-glyph-ranges-builder-add-ranges (self ranges)
  (ffi:c-inline (self ranges) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImFontGlyphRangesBuilder_AddRanges(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontGlyphRangesBuilder_BuildRanges" font-glyph-ranges-builder-build-ranges) :VOID
  (self :POINTER)
  (out-ranges :POINTER)
)

#+ecl
(defun font-glyph-ranges-builder-build-ranges (self out-ranges)
  (ffi:c-inline (self out-ranges) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImFontGlyphRangesBuilder_BuildRanges(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddFont" font-atlas-add-font) :POINTER
  (self :POINTER)
  (font-cfg :POINTER)
)

#+ecl
(defun font-atlas-add-font (self font-cfg)
  (ffi:c-inline (self font-cfg) (:POINTER-VOID :POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_AddFont(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddFontDefault" font-atlas-add-font-default) :POINTER
  (self :POINTER)
  (font-cfg :POINTER)
)

#+ecl
(defun font-atlas-add-font-default (self font-cfg)
  (ffi:c-inline (self font-cfg) (:POINTER-VOID :POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_AddFontDefault(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddFontFromFileTTF" font-atlas-add-font-from-file-ttf) :POINTER
  (self :POINTER)
  (filename :STRING)
  (size-pixels :FLOAT)
  (font-cfg :POINTER)
  (glyph-ranges :POINTER)
)

#+ecl
(defun font-atlas-add-font-from-file-ttf (self filename size-pixels font-cfg glyph-ranges)
  (ffi:c-inline (self filename size-pixels font-cfg glyph-ranges) (:POINTER-VOID :CSTRING :FLOAT :POINTER-VOID :POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_AddFontFromFileTTF(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddFontFromMemoryTTF" font-atlas-add-font-from-memory-ttf) :POINTER
  (self :POINTER)
  (font-data :POINTER)
  (font-data-size :INT)
  (size-pixels :FLOAT)
  (font-cfg :POINTER)
  (glyph-ranges :POINTER)
)

#+ecl
(defun font-atlas-add-font-from-memory-ttf (self font-data font-data-size size-pixels font-cfg glyph-ranges)
  (ffi:c-inline (self font-data font-data-size size-pixels font-cfg glyph-ranges) (:POINTER-VOID :POINTER-VOID :INT :FLOAT :POINTER-VOID :POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_AddFontFromMemoryTTF(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddFontFromMemoryCompressedTTF" font-atlas-add-font-from-memory-compressed-ttf) :POINTER
  (self :POINTER)
  (compressed-font-data :POINTER)
  (compressed-font-data-size :INT)
  (size-pixels :FLOAT)
  (font-cfg :POINTER)
  (glyph-ranges :POINTER)
)

#+ecl
(defun font-atlas-add-font-from-memory-compressed-ttf (self compressed-font-data compressed-font-data-size size-pixels font-cfg glyph-ranges)
  (ffi:c-inline (self compressed-font-data compressed-font-data-size size-pixels font-cfg glyph-ranges) (:POINTER-VOID :POINTER-VOID :INT :FLOAT :POINTER-VOID :POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_AddFontFromMemoryCompressedTTF(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddFontFromMemoryCompressedBase85TTF" font-atlas-add-font-from-memory-compressed-base85ttf) :POINTER
  (self :POINTER)
  (compressed-font-data-base85 :STRING)
  (size-pixels :FLOAT)
  (font-cfg :POINTER)
  (glyph-ranges :POINTER)
)

#+ecl
(defun font-atlas-add-font-from-memory-compressed-base85ttf (self compressed-font-data-base85 size-pixels font-cfg glyph-ranges)
  (ffi:c-inline (self compressed-font-data-base85 size-pixels font-cfg glyph-ranges) (:POINTER-VOID :CSTRING :FLOAT :POINTER-VOID :POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_RemoveFont" font-atlas-remove-font) :VOID
  (self :POINTER)
  (font :POINTER)
)

#+ecl
(defun font-atlas-remove-font (self font)
  (ffi:c-inline (self font) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImFontAtlas_RemoveFont(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_Clear" font-atlas-clear) :VOID
  (self :POINTER)
)

#+ecl
(defun font-atlas-clear (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImFontAtlas_Clear(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_CompactCache" font-atlas-compact-cache) :VOID
  (self :POINTER)
)

#+ecl
(defun font-atlas-compact-cache (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImFontAtlas_CompactCache(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_SetFontLoader" font-atlas-set-font-loader) :VOID
  (self :POINTER)
  (font-loader :POINTER)
)

#+ecl
(defun font-atlas-set-font-loader (self font-loader)
  (ffi:c-inline (self font-loader) (:POINTER-VOID :POINTER-VOID) :VOID
    "ImFontAtlas_SetFontLoader(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_ClearInputData" font-atlas-clear-input-data) :VOID
  (self :POINTER)
)

#+ecl
(defun font-atlas-clear-input-data (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImFontAtlas_ClearInputData(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_ClearFonts" font-atlas-clear-fonts) :VOID
  (self :POINTER)
)

#+ecl
(defun font-atlas-clear-fonts (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImFontAtlas_ClearFonts(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_ClearTexData" font-atlas-clear-tex-data) :VOID
  (self :POINTER)
)

#+ecl
(defun font-atlas-clear-tex-data (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImFontAtlas_ClearTexData(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_Build" font-atlas-build) :BOOL
  (self :POINTER)
)

#+ecl
(defun font-atlas-build (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImFontAtlas_Build(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetTexDataAsAlpha8" font-atlas-get-tex-data-as-alpha8) :VOID
  (self :POINTER)
  (out-pixels :POINTER)
  (out-width :POINTER)
  (out-height :POINTER)
  (out-bytes-per-pixel :POINTER)
)

#+ecl
(defun font-atlas-get-tex-data-as-alpha8 (self out-pixels out-width out-height out-bytes-per-pixel)
  (ffi:c-inline (self out-pixels out-width out-height out-bytes-per-pixel) (:POINTER-VOID :POINTER-VOID :POINTER-VOID :POINTER-VOID :POINTER-VOID) :VOID
    "ImFontAtlas_GetTexDataAsAlpha8(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetTexDataAsRGBA32" font-atlas-get-tex-data-as-rgba32) :VOID
  (self :POINTER)
  (out-pixels :POINTER)
  (out-width :POINTER)
  (out-height :POINTER)
  (out-bytes-per-pixel :POINTER)
)

#+ecl
(defun font-atlas-get-tex-data-as-rgba32 (self out-pixels out-width out-height out-bytes-per-pixel)
  (ffi:c-inline (self out-pixels out-width out-height out-bytes-per-pixel) (:POINTER-VOID :POINTER-VOID :POINTER-VOID :POINTER-VOID :POINTER-VOID) :VOID
    "ImFontAtlas_GetTexDataAsRGBA32(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_SetTexID" font-atlas-set-tex-id) :VOID
  (self :POINTER)
  (id TEXTURE-ID)
)

#+ecl
(defun font-atlas-set-tex-id (self id)
  (ffi:c-inline (self id) (:POINTER-VOID :INT) :VOID
    "ImFontAtlas_SetTexID(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_IsBuilt" font-atlas-is-built) :BOOL
  (self :POINTER)
)

#+ecl
(defun font-atlas-is-built (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImFontAtlas_IsBuilt(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetGlyphRangesDefault" font-atlas-get-glyph-ranges-default) :POINTER
  (self :POINTER)
)

#+ecl
(defun font-atlas-get-glyph-ranges-default (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_GetGlyphRangesDefault(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetGlyphRangesGreek" font-atlas-get-glyph-ranges-greek) :POINTER
  (self :POINTER)
)

#+ecl
(defun font-atlas-get-glyph-ranges-greek (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_GetGlyphRangesGreek(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetGlyphRangesKorean" font-atlas-get-glyph-ranges-korean) :POINTER
  (self :POINTER)
)

#+ecl
(defun font-atlas-get-glyph-ranges-korean (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_GetGlyphRangesKorean(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetGlyphRangesJapanese" font-atlas-get-glyph-ranges-japanese) :POINTER
  (self :POINTER)
)

#+ecl
(defun font-atlas-get-glyph-ranges-japanese (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_GetGlyphRangesJapanese(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetGlyphRangesChineseFull" font-atlas-get-glyph-ranges-chinese-full) :POINTER
  (self :POINTER)
)

#+ecl
(defun font-atlas-get-glyph-ranges-chinese-full (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_GetGlyphRangesChineseFull(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon" font-atlas-get-glyph-ranges-chinese-simplified-common) :POINTER
  (self :POINTER)
)

#+ecl
(defun font-atlas-get-glyph-ranges-chinese-simplified-common (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetGlyphRangesCyrillic" font-atlas-get-glyph-ranges-cyrillic) :POINTER
  (self :POINTER)
)

#+ecl
(defun font-atlas-get-glyph-ranges-cyrillic (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_GetGlyphRangesCyrillic(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetGlyphRangesThai" font-atlas-get-glyph-ranges-thai) :POINTER
  (self :POINTER)
)

#+ecl
(defun font-atlas-get-glyph-ranges-thai (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_GetGlyphRangesThai(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetGlyphRangesVietnamese" font-atlas-get-glyph-ranges-vietnamese) :POINTER
  (self :POINTER)
)

#+ecl
(defun font-atlas-get-glyph-ranges-vietnamese (self)
  (ffi:c-inline (self) (:POINTER-VOID) :POINTER-VOID
    "ImFontAtlas_GetGlyphRangesVietnamese(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddCustomRect" font-atlas-add-custom-rect) FONT-ATLAS-RECT-ID
  (self :POINTER)
  (width :INT)
  (height :INT)
  (out-r :POINTER)
)

#+ecl
(defun font-atlas-add-custom-rect (self width height out-r)
  (ffi:c-inline (self width height out-r) (:POINTER-VOID :INT :INT :POINTER-VOID) :INT
    "ImFontAtlas_AddCustomRect(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_RemoveCustomRect" font-atlas-remove-custom-rect) :VOID
  (self :POINTER)
  (id FONT-ATLAS-RECT-ID)
)

#+ecl
(defun font-atlas-remove-custom-rect (self id)
  (ffi:c-inline (self id) (:POINTER-VOID :INT) :VOID
    "ImFontAtlas_RemoveCustomRect(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetCustomRect" font-atlas-get-custom-rect) :BOOL
  (self :POINTER)
  (id FONT-ATLAS-RECT-ID)
  (out-r :POINTER)
)

#+ecl
(defun font-atlas-get-custom-rect (self id out-r)
  (ffi:c-inline (self id out-r) (:POINTER-VOID :INT :POINTER-VOID) :BOOL
    "ImFontAtlas_GetCustomRect(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_AddCustomRectRegular" font-atlas-add-custom-rect-regular) FONT-ATLAS-RECT-ID
  (self :POINTER)
  (w :INT)
  (h :INT)
)

#+ecl
(defun font-atlas-add-custom-rect-regular (self w h)
  (ffi:c-inline (self w h) (:POINTER-VOID :INT :INT) :INT
    "ImFontAtlas_AddCustomRectRegular(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_GetCustomRectByIndex" font-atlas-get-custom-rect-by-index) :POINTER
  (self :POINTER)
  (id FONT-ATLAS-RECT-ID)
)

#+ecl
(defun font-atlas-get-custom-rect-by-index (self id)
  (ffi:c-inline (self id) (:POINTER-VOID :INT) :POINTER-VOID
    "ImFontAtlas_GetCustomRectByIndex(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontAtlas_CalcCustomRectUV" font-atlas-calc-custom-rect-uv) :VOID
  (self :POINTER)
  (r :POINTER)
  (out-uv-min :POINTER)
  (out-uv-max :POINTER)
)

#+ecl
(defun font-atlas-calc-custom-rect-uv (self r out-uv-min out-uv-max)
  (ffi:c-inline (self r out-uv-min out-uv-max) (:POINTER-VOID :POINTER-VOID :POINTER-VOID :POINTER-VOID) :VOID
    "ImFontAtlas_CalcCustomRectUV(#0, #1, #2, #3)"
    :one-liner t))

#-ecl
(defcfun ("ImFontBaked_ClearOutputData" font-baked-clear-output-data) :VOID
  (self :POINTER)
)

#+ecl
(defun font-baked-clear-output-data (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImFontBaked_ClearOutputData(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFontBaked_FindGlyph" font-baked-find-glyph) :POINTER
  (self :POINTER)
  (c WCHAR)
)

#+ecl
(defun font-baked-find-glyph (self c)
  (ffi:c-inline (self c) (:POINTER-VOID :INT) :POINTER-VOID
    "ImFontBaked_FindGlyph(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontBaked_FindGlyphNoFallback" font-baked-find-glyph-no-fallback) :POINTER
  (self :POINTER)
  (c WCHAR)
)

#+ecl
(defun font-baked-find-glyph-no-fallback (self c)
  (ffi:c-inline (self c) (:POINTER-VOID :INT) :POINTER-VOID
    "ImFontBaked_FindGlyphNoFallback(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontBaked_GetCharAdvance" font-baked-get-char-advance) :FLOAT
  (self :POINTER)
  (c WCHAR)
)

#+ecl
(defun font-baked-get-char-advance (self c)
  (ffi:c-inline (self c) (:POINTER-VOID :INT) :FLOAT
    "ImFontBaked_GetCharAdvance(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFontBaked_IsGlyphLoaded" font-baked-is-glyph-loaded) :BOOL
  (self :POINTER)
  (c WCHAR)
)

#+ecl
(defun font-baked-is-glyph-loaded (self c)
  (ffi:c-inline (self c) (:POINTER-VOID :INT) :BOOL
    "ImFontBaked_IsGlyphLoaded(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_IsGlyphInFont" font-is-glyph-in-font) :BOOL
  (self :POINTER)
  (c WCHAR)
)

#+ecl
(defun font-is-glyph-in-font (self c)
  (ffi:c-inline (self c) (:POINTER-VOID :INT) :BOOL
    "ImFont_IsGlyphInFont(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_IsLoaded" font-is-loaded) :BOOL
  (self :POINTER)
)

#+ecl
(defun font-is-loaded (self)
  (ffi:c-inline (self) (:POINTER-VOID) :BOOL
    "ImFont_IsLoaded(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_GetDebugName" font-get-debug-name) :STRING
  (self :POINTER)
)

#+ecl
(defun font-get-debug-name (self)
  (ffi:c-inline (self) (:POINTER-VOID) :CSTRING
    "ImFont_GetDebugName(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_GetFontBaked" font-get-font-baked) :POINTER
  (self :POINTER)
  (font-size :FLOAT)
)

#+ecl
(defun font-get-font-baked (self font-size)
  (ffi:c-inline (self font-size) (:POINTER-VOID :FLOAT) :POINTER-VOID
    "ImFont_GetFontBaked(#0, #1)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_GetFontBakedEx" font-get-font-baked-ex) :POINTER
  (self :POINTER)
  (font-size :FLOAT)
  (density :FLOAT)
)

#+ecl
(defun font-get-font-baked-ex (self font-size density)
  (ffi:c-inline (self font-size density) (:POINTER-VOID :FLOAT :FLOAT) :POINTER-VOID
    "ImFont_GetFontBakedEx(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_CalcTextSizeA" font-calc-text-size-a) VEC2
  (self :POINTER)
  (size :FLOAT)
  (max-width :FLOAT)
  (wrap-width :FLOAT)
  (text-begin :STRING)
)

#+ecl
(defun font-calc-text-size-a (self size max-width wrap-width text-begin)
  (ffi:c-inline (self size max-width wrap-width text-begin) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :CSTRING) :INT
    "ImFont_CalcTextSizeA(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_CalcTextSizeAEx" font-calc-text-size-aex) VEC2
  (self :POINTER)
  (size :FLOAT)
  (max-width :FLOAT)
  (wrap-width :FLOAT)
  (text-begin :STRING)
  (text-end :STRING)
  (out-remaining :POINTER)
)

#+ecl
(defun font-calc-text-size-aex (self size max-width wrap-width text-begin text-end out-remaining)
  (ffi:c-inline (self size max-width wrap-width text-begin text-end out-remaining) (:POINTER-VOID :FLOAT :FLOAT :FLOAT :CSTRING :CSTRING :POINTER-VOID) :INT
    "ImFont_CalcTextSizeAEx(#0, #1, #2, #3, #4, #5, #6)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_CalcWordWrapPosition" font-calc-word-wrap-position) :STRING
  (self :POINTER)
  (size :FLOAT)
  (text :STRING)
  (text-end :STRING)
  (wrap-width :FLOAT)
)

#+ecl
(defun font-calc-word-wrap-position (self size text text-end wrap-width)
  (ffi:c-inline (self size text text-end wrap-width) (:POINTER-VOID :FLOAT :CSTRING :CSTRING :FLOAT) :CSTRING
    "ImFont_CalcWordWrapPosition(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_CalcWordWrapPositionA" font-calc-word-wrap-position-a) :STRING
  (self :POINTER)
  (scale :FLOAT)
  (text :STRING)
  (text-end :STRING)
  (wrap-width :FLOAT)
)

#+ecl
(defun font-calc-word-wrap-position-a (self scale text text-end wrap-width)
  (ffi:c-inline (self scale text text-end wrap-width) (:POINTER-VOID :FLOAT :CSTRING :CSTRING :FLOAT) :CSTRING
    "ImFont_CalcWordWrapPositionA(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_ClearOutputData" font-clear-output-data) :VOID
  (self :POINTER)
)

#+ecl
(defun font-clear-output-data (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImFont_ClearOutputData(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_AddRemapChar" font-add-remap-char) :VOID
  (self :POINTER)
  (from-codepoint WCHAR)
  (to-codepoint WCHAR)
)

#+ecl
(defun font-add-remap-char (self from-codepoint to-codepoint)
  (ffi:c-inline (self from-codepoint to-codepoint) (:POINTER-VOID :INT :INT) :VOID
    "ImFont_AddRemapChar(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImFont_IsGlyphRangeUnused" font-is-glyph-range-unused) :BOOL
  (self :POINTER)
  (c-begin :UNSIGNED-INT)
  (c-last :UNSIGNED-INT)
)

#+ecl
(defun font-is-glyph-range-unused (self c-begin c-last)
  (ffi:c-inline (self c-begin c-last) (:POINTER-VOID :UNSIGNED-INT :UNSIGNED-INT) :BOOL
    "ImFont_IsGlyphRangeUnused(#0, #1, #2)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiViewport_GetCenter" viewport-get-center) VEC2
  (self :POINTER)
)

#+ecl
(defun viewport-get-center (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImGuiViewport_GetCenter(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiViewport_GetWorkCenter" viewport-get-work-center) VEC2
  (self :POINTER)
)

#+ecl
(defun viewport-get-work-center (self)
  (ffi:c-inline (self) (:POINTER-VOID) :INT
    "ImGuiViewport_GetWorkCenter(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiPlatformIO_ClearPlatformHandlers" platform-io-clear-platform-handlers) :VOID
  (self :POINTER)
)

#+ecl
(defun platform-io-clear-platform-handlers (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiPlatformIO_ClearPlatformHandlers(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGuiPlatformIO_ClearRendererHandlers" platform-io-clear-renderer-handlers) :VOID
  (self :POINTER)
)

#+ecl
(defun platform-io-clear-renderer-handlers (self)
  (ffi:c-inline (self) (:POINTER-VOID) :VOID
    "ImGuiPlatformIO_ClearRendererHandlers(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushFont" push-font) :VOID
  (font :POINTER)
)

#+ecl
(defun push-font (font)
  (ffi:c-inline (font) (:POINTER-VOID) :VOID
    "ImGui_PushFont(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_SetWindowFontScale" set-window-font-scale) :VOID
  (scale :FLOAT)
)

#+ecl
(defun set-window-font-scale (scale)
  (ffi:c-inline (scale) (:FLOAT) :VOID
    "ImGui_SetWindowFontScale(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushButtonRepeat" push-button-repeat) :VOID
  (repeat :BOOL)
)

#+ecl
(defun push-button-repeat (repeat)
  (ffi:c-inline (repeat) (:BOOL) :VOID
    "ImGui_PushButtonRepeat(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopButtonRepeat" pop-button-repeat) :VOID)

#+ecl
(defun pop-button-repeat ()
  (ffi:c-inline () () :VOID
    "ImGui_PopButtonRepeat()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PushTabStop" push-tab-stop) :VOID
  (tab-stop :BOOL)
)

#+ecl
(defun push-tab-stop (tab-stop)
  (ffi:c-inline (tab-stop) (:BOOL) :VOID
    "ImGui_PushTabStop(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_PopTabStop" pop-tab-stop) :VOID)

#+ecl
(defun pop-tab-stop ()
  (ffi:c-inline () () :VOID
    "ImGui_PopTabStop()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetContentRegionMax" get-content-region-max) VEC2)

#+ecl
(defun get-content-region-max ()
  (ffi:c-inline () () :INT
    "ImGui_GetContentRegionMax()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetWindowContentRegionMin" get-window-content-region-min) VEC2)

#+ecl
(defun get-window-content-region-min ()
  (ffi:c-inline () () :INT
    "ImGui_GetWindowContentRegionMin()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_GetWindowContentRegionMax" get-window-content-region-max) VEC2)

#+ecl
(defun get-window-content-region-max ()
  (ffi:c-inline () () :INT
    "ImGui_GetWindowContentRegionMax()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_EndChildFrame" end-child-frame) :VOID)

#+ecl
(defun end-child-frame ()
  (ffi:c-inline () () :VOID
    "ImGui_EndChildFrame()"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ShowStackToolWindow" show-stack-tool-window) :VOID
  (p-open :POINTER)
)

#+ecl
(defun show-stack-tool-window (p-open)
  (ffi:c-inline (p-open) (:POINTER-VOID) :VOID
    "ImGui_ShowStackToolWindow(#0)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ComboObsolete" combo-obsolete) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (old-callback :POINTER)
  (user-data :POINTER)
  (items-count :INT)
)

#+ecl
(defun combo-obsolete (label current-item old-callback user-data items-count)
  (ffi:c-inline (label current-item old-callback user-data items-count) (:CSTRING :POINTER-VOID :POINTER-VOID :POINTER-VOID :INT) :BOOL
    "ImGui_ComboObsolete(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ComboObsoleteEx" combo-obsolete-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (old-callback :POINTER)
  (user-data :POINTER)
  (items-count :INT)
  (popup-max-height-in-items :INT)
)

#+ecl
(defun combo-obsolete-ex (label current-item old-callback user-data items-count popup-max-height-in-items)
  (ffi:c-inline (label current-item old-callback user-data items-count popup-max-height-in-items) (:CSTRING :POINTER-VOID :POINTER-VOID :POINTER-VOID :INT :INT) :BOOL
    "ImGui_ComboObsoleteEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ListBoxObsolete" list-box-obsolete) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (old-callback :POINTER)
  (user-data :POINTER)
  (items-count :INT)
)

#+ecl
(defun list-box-obsolete (label current-item old-callback user-data items-count)
  (ffi:c-inline (label current-item old-callback user-data items-count) (:CSTRING :POINTER-VOID :POINTER-VOID :POINTER-VOID :INT) :BOOL
    "ImGui_ListBoxObsolete(#0, #1, #2, #3, #4)"
    :one-liner t))

#-ecl
(defcfun ("ImGui_ListBoxObsoleteEx" list-box-obsolete-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (old-callback :POINTER)
  (user-data :POINTER)
  (items-count :INT)
  (height-in-items :INT)
)

#+ecl
(defun list-box-obsolete-ex (label current-item old-callback user-data items-count height-in-items)
  (ffi:c-inline (label current-item old-callback user-data items-count height-in-items) (:CSTRING :POINTER-VOID :POINTER-VOID :POINTER-VOID :INT :INT) :BOOL
    "ImGui_ListBoxObsoleteEx(#0, #1, #2, #3, #4, #5)"
    :one-liner t))


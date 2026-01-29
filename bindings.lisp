;;;; bindings.lisp
;;;; Auto-generated CFFI bindings for Dear ImGui
;;;; Generated from dcimgui.json

(in-package #:cl-dear-imgui)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew (asdf:system-relative-pathname :cl-dear-imgui "./")
           cffi:*foreign-library-directories*
           :test #'equal))

(define-foreign-library dcimgui
  (:darwin "libdcimgui.dylib")
  (:unix "libdcimgui.so")
  (:windows "dcimgui.dll")
  (t (:default "libdcimgui")))

(use-foreign-library dcimgui)

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
(defcenum window-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum child-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum item-flags-
  (:item-flags-none 0)
  (:item-flags-no-tab-stop 1)
  (:item-flags-no-nav 2)
  (:item-flags-no-nav-default-focus 4)
  (:item-flags-button-repeat 8)
  (:item-flags-auto-close-popups 16)
  (:item-flags-allow-duplicate-id 32)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum input-text-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum tree-node-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum popup-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum selectable-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum combo-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum tab-bar-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum tab-item-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum focused-flags-
  (:focused-flags-none 0)
  (:focused-flags-child-windows 1)
  (:focused-flags-root-window 2)
  (:focused-flags-any-window 4)
  (:focused-flags-no-popup-hierarchy 8)
  (:focused-flags-root-and-child-windows 3)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum hovered-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum drag-drop-flags-
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

(defcenum data-type-
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

(defcenum dir
  (:dir-none -1)
  (:dir-left 0)
  (:dir-right 1)
  (:dir-up 2)
  (:dir-down 3)
)

(defcenum sort-direction
  (:sort-direction-none 0)
  (:sort-direction-ascending 1)
  (:sort-direction-descending 2)
)

(defcenum key
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum input-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum config-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum backend-flags-
  (:backend-flags-none 0)
  (:backend-flags-has-gamepad 1)
  (:backend-flags-has-mouse-cursors 2)
  (:backend-flags-has-set-mouse-pos 4)
  (:backend-flags-renderer-has-vtx-offset 8)
  (:backend-flags-renderer-has-textures 16)
)

(defcenum col-
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

(defcenum style-var-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum button-flags-
  (:button-flags-none 0)
  (:button-flags-mouse-button-left 1)
  (:button-flags-mouse-button-right 2)
  (:button-flags-mouse-button-middle 4)
  (:button-flags-mouse-button-mask- 7)
  (:button-flags-enable-nav 8)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum color-edit-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum slider-flags-
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

(defcenum mouse-button-
  (:mouse-button-left 0)
  (:mouse-button-right 1)
  (:mouse-button-middle 2)
)

(defcenum mouse-cursor-
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

(defcenum mouse-source
  (:mouse-source-mouse 0)
  (:mouse-source-touch-screen 1)
  (:mouse-source-pen 2)
)

(defcenum cond-
  (:cond-none 0)
  (:cond-always 1)
  (:cond-once 2)
  (:cond-first-use-ever 4)
  (:cond-appearing 8)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum table-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum table-column-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum table-row-flags-
  (:table-row-flags-none 0)
  (:table-row-flags-headers 1)
)

(defcenum table-bg-target-
  (:table-bg-target-none 0)
  (:table-bg-target-row-bg0 1)
  (:table-bg-target-row-bg1 2)
  (:table-bg-target-cell-bg 3)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum list-clipper-flags-
  (:list-clipper-flags-none 0)
  (:list-clipper-flags-no-set-table-row-counters 1)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum multi-select-flags-
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

(defcenum selection-request-type
  (:selection-request-type-none 0)
  (:selection-request-type-set-all 1)
  (:selection-request-type-set-range 2)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum draw-flags-
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

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum draw-list-flags-
  (:draw-list-flags-none 0)
  (:draw-list-flags-anti-aliased-lines 1)
  (:draw-list-flags-anti-aliased-lines-use-tex 2)
  (:draw-list-flags-anti-aliased-fill 4)
  (:draw-list-flags-allow-vtx-offset 8)
)

(defcenum texture-format
  (:texture-format-rgba32 0)
  (:texture-format-alpha8 1)
)

(defcenum texture-status
  (:texture-status-ok 0)
  (:texture-status-destroyed 1)
  (:texture-status-want-create 2)
  (:texture-status-want-updates 3)
  (:texture-status-want-destroy 4)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum font-atlas-flags-
  (:font-atlas-flags-none 0)
  (:font-atlas-flags-no-power-of-two-height 1)
  (:font-atlas-flags-no-mouse-cursors 2)
  (:font-atlas-flags-no-baked-lines 4)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum font-flags-
  (:font-flags-none 0)
  (:font-flags-no-load-error 2)
  (:font-flags-no-load-glyphs 4)
  (:font-flags-lock-baked-sizes 8)
)

;; Flags enum (bitfield) - combine with LOGIOR
(defcenum viewport-flags-
  (:viewport-flags-none 0)
  (:viewport-flags-is-platform-window 1)
  (:viewport-flags-is-platform-monitor 2)
  (:viewport-flags-owned-by-app 4)
)

(defctype ID :UNSIGNED-INT)

(defcstruct VEC2
  (x :FLOAT)
  (y :FLOAT)
)

(defcstruct PLATFORMIMEDATA
  (want-visible :BOOL)
  (want-text-input :BOOL)
  (input-pos VEC2)
  (input-line-height :FLOAT)
  (viewport-id ID)
)

(defcstruct TEXTURERECT
  (x :UNSIGNED-SHORT)
  (y :UNSIGNED-SHORT)
  (w :UNSIGNED-SHORT)
  (h :UNSIGNED-SHORT)
)

(defcstruct VECTOR-IMTEXTURERECT
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defctype U64 :UNSIGNED-LONG-LONG)

(defctype TEXTUREID U64)

(defcstruct TEXTUREDATA
  (unique-id :INT)
  (status TEXTURE-STATUS)
  (backend-user-data :POINTER)
  (tex-id TEXTUREID)
  (format TEXTURE-FORMAT)
  (width :INT)
  (height :INT)
  (bytes-per-pixel :INT)
  (pixels :POINTER)
  (used-rect TEXTURERECT)
  (update-rect TEXTURERECT)
  (updates VECTOR-IMTEXTURERECT)
  (unused-frames :INT)
  (ref-count :UNSIGNED-SHORT)
  (use-colors :BOOL)
  (want-destroy-next-frame :BOOL)
)

(defcstruct VECTOR-IMTEXTUREDATAPTR
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defctype WCHAR16 :UNSIGNED-SHORT)

(defctype WCHAR WCHAR16)

(defcstruct PLATFORMIO
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
  (textures VECTOR-IMTEXTUREDATAPTR)
)

(defctype VIEWPORTFLAGS :INT)

(defcstruct VIEWPORT
  (id ID)
  (flags VIEWPORTFLAGS)
  (pos VEC2)
  (size VEC2)
  (framebuffer-scale VEC2)
  (work-pos VEC2)
  (work-size VEC2)
  (platform-handle :POINTER)
  (platform-handle-raw :POINTER)
)

(defcstruct STORAGEPAIR
  (key ID)
  (--anonymous-type0 :POINTER)
)

(defcstruct VECTOR-IMGUISTORAGEPAIR
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct STORAGE
  (data VECTOR-IMGUISTORAGEPAIR)
)

(defctype U8 :UNSIGNED-CHAR)

(defctype FONTFLAGS :INT)

(defctype U32 :UNSIGNED-INT)

(defctype S8 :CHAR)

(defcstruct FONTCONFIG
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
  (flags FONTFLAGS)
  (dst-font :POINTER)
  (font-loader :POINTER)
  (font-loader-data :POINTER)
)

(defcstruct VECTOR-IMFONTCONFIGPTR
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct FONTATLASRECT
  (x :UNSIGNED-SHORT)
  (y :UNSIGNED-SHORT)
  (w :UNSIGNED-SHORT)
  (h :UNSIGNED-SHORT)
  (uv0 VEC2)
  (uv1 VEC2)
)

(defcstruct VECTOR-IMDRAWLISTSHAREDDATAPTR
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct VEC4
  (x :FLOAT)
  (y :FLOAT)
  (z :FLOAT)
  (w :FLOAT)
)

(defcstruct VECTOR-IMFONTCONFIG
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct VECTOR-IMFONTPTR
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct TEXTUREREF
  (-tex-data :POINTER)
  (-tex-id TEXTUREID)
)

(defctype FONTATLASFLAGS :INT)

(defcstruct FONTATLAS
  (flags FONTATLASFLAGS)
  (tex-desired-format TEXTURE-FORMAT)
  (tex-glyph-padding :INT)
  (tex-min-width :INT)
  (tex-min-height :INT)
  (tex-max-width :INT)
  (tex-max-height :INT)
  (user-data :POINTER)
  (tex-ref TEXTUREREF)
  (--anonymous-type1 :POINTER)
  (tex-data :POINTER)
  (tex-list VECTOR-IMTEXTUREDATAPTR)
  (locked :BOOL)
  (renderer-has-textures :BOOL)
  (tex-is-built :BOOL)
  (tex-pixels-use-colors :BOOL)
  (tex-uv-scale VEC2)
  (tex-uv-white-pixel VEC2)
  (fonts VECTOR-IMFONTPTR)
  (sources VECTOR-IMFONTCONFIG)
  (tex-uv-lines :pointer) ; Array with complex bounds: IM_DRAWLIST_TEX_LINES_WIDTH_MAX+1
  (tex-next-unique-id :INT)
  (font-next-unique-id :INT)
  (draw-list-shared-datas VECTOR-IMDRAWLISTSHAREDDATAPTR)
  (builder :POINTER)
  (font-loader :POINTER)
  (font-loader-name :STRING)
  (font-loader-data :POINTER)
  (font-loader-flags :UNSIGNED-INT)
  (ref-count :INT)
  (owner-context :POINTER)
  (temp-rect FONTATLASRECT)
)

(defcstruct FONTGLYPH
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

(defcstruct VECTOR-IMFONTGLYPH
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defctype U16 :UNSIGNED-SHORT)

(defcstruct VECTOR-IMU16
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct VECTOR-FLOAT
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct FONTBAKED
  (index-advance-x VECTOR-FLOAT)
  (fallback-advance-x :FLOAT)
  (size :FLOAT)
  (rasterizer-density :FLOAT)
  (index-lookup VECTOR-IMU16)
  (glyphs VECTOR-IMFONTGLYPH)
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

(defcstruct FONT
  (last-baked :POINTER)
  (owner-atlas :POINTER)
  (flags FONTFLAGS)
  (current-rasterizer-density :FLOAT)
  (font-id ID)
  (legacy-size :FLOAT)
  (sources VECTOR-IMFONTCONFIGPTR)
  (ellipsis-char WCHAR)
  (fallback-char WCHAR)
  (used8k-pages-map :pointer) ; Array with complex bounds: (IM_UNICODE_CODEPOINT_MAX +1)/8192/8
  (ellipsis-auto-bake :BOOL)
  (remap-pairs STORAGE)
  (scale :FLOAT)
)

(defcstruct VECTOR-IMU32
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct FONTGLYPHRANGESBUILDER
  (used-chars VECTOR-IMU32)
)

(defcstruct VECTOR-IMU8
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct VECTOR-IMTEXTUREREF
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct VECTOR-IMVEC4
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defctype DRAWIDX :UNSIGNED-SHORT)

(defcstruct VECTOR-IMDRAWIDX
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defctype DRAWCALLBACK :POINTER)

(defcstruct DRAWCMD
  (clip-rect VEC4)
  (tex-ref TEXTUREREF)
  (vtx-offset :UNSIGNED-INT)
  (idx-offset :UNSIGNED-INT)
  (elem-count :UNSIGNED-INT)
  (user-callback DRAWCALLBACK)
  (user-callback-data :POINTER)
  (user-callback-data-size :INT)
  (user-callback-data-offset :INT)
)

(defcstruct VECTOR-IMDRAWCMD
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct DRAWCHANNEL
  (-cmd-buffer VECTOR-IMDRAWCMD)
  (-idx-buffer VECTOR-IMDRAWIDX)
)

(defcstruct VECTOR-IMDRAWCHANNEL
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct DRAWLISTSPLITTER
  (-current :INT)
  (-count :INT)
  (-channels VECTOR-IMDRAWCHANNEL)
)

(defcstruct DRAWCMDHEADER
  (clip-rect VEC4)
  (tex-ref TEXTUREREF)
  (vtx-offset :UNSIGNED-INT)
)

(defcstruct VECTOR-IMVEC2
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct DRAWVERT
  (pos VEC2)
  (uv VEC2)
  (col U32)
)

(defctype DRAWLISTFLAGS :INT)

(defcstruct VECTOR-IMDRAWVERT
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct DRAWLIST
  (cmd-buffer VECTOR-IMDRAWCMD)
  (idx-buffer VECTOR-IMDRAWIDX)
  (vtx-buffer VECTOR-IMDRAWVERT)
  (flags DRAWLISTFLAGS)
  (-vtx-current-idx :UNSIGNED-INT)
  (-data :POINTER)
  (-vtx-write-ptr :POINTER)
  (-idx-write-ptr :POINTER)
  (-path VECTOR-IMVEC2)
  (-cmd-header DRAWCMDHEADER)
  (-splitter DRAWLISTSPLITTER)
  (-clip-rect-stack VECTOR-IMVEC4)
  (-texture-stack VECTOR-IMTEXTUREREF)
  (-callbacks-data-buf VECTOR-IMU8)
  (-fringe-scale :FLOAT)
  (-owner-name :STRING)
)

(defcstruct VECTOR-IMDRAWLISTPTR
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct DRAWDATA
  (valid :BOOL)
  (cmd-lists-count :INT)
  (total-idx-count :INT)
  (total-vtx-count :INT)
  (cmd-lists VECTOR-IMDRAWLISTPTR)
  (display-pos VEC2)
  (display-size VEC2)
  (framebuffer-scale VEC2)
  (owner-viewport :POINTER)
  (textures :POINTER)
)

(defcstruct SELECTIONEXTERNALSTORAGE
  (user-data :POINTER)
  (adapter-set-item-selected :POINTER)
)

(defcstruct SELECTIONBASICSTORAGE
  (size :INT)
  (preserve-order :BOOL)
  (user-data :POINTER)
  (adapter-index-to-storage-id :POINTER)
  (-selection-order :INT)
  (-storage STORAGE)
)

(defctype S64 :LONG-LONG)

(defctype SELECTIONUSERDATA S64)

(defcstruct SELECTIONREQUEST
  (type SELECTION-REQUEST-TYPE)
  (selected :BOOL)
  (range-direction S8)
  (range-first-item SELECTIONUSERDATA)
  (range-last-item SELECTIONUSERDATA)
)

(defcstruct VECTOR-IMGUISELECTIONREQUEST
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct MULTISELECTIO
  (requests VECTOR-IMGUISELECTIONREQUEST)
  (range-src-item SELECTIONUSERDATA)
  (nav-id-item SELECTIONUSERDATA)
  (nav-id-selected :BOOL)
  (range-src-reset :BOOL)
  (items-count :INT)
)

(defcstruct COLOR
  (value VEC4)
)

(defctype LISTCLIPPERFLAGS :INT)

(defcstruct LISTCLIPPER
  (ctx :POINTER)
  (display-start :INT)
  (display-end :INT)
  (items-count :INT)
  (items-height :FLOAT)
  (start-pos-y :DOUBLE)
  (start-seek-offset-y :DOUBLE)
  (temp-data :POINTER)
  (flags LISTCLIPPERFLAGS)
)

(defcstruct VECTOR-CHAR
  (size :INT)
  (capacity :INT)
  (data :STRING)
)

(defcstruct TEXTBUFFER
  (buf VECTOR-CHAR)
)

(defcstruct TEXTFILTER-IMGUITEXTRANGE
  (b :STRING)
  (e :STRING)
)

(defcstruct VECTOR-IMGUITEXTRANGE
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct TEXTFILTER
  (input-buf :CHAR :count 256)
  (filters VECTOR-IMGUITEXTRANGE)
  (count-grep :INT)
)

(defcstruct PAYLOAD
  (data :POINTER)
  (data-size :INT)
  (source-id ID)
  (source-parent-id ID)
  (data-frame-count :INT)
  (data-type :CHAR :count 32)
  (preview :BOOL)
  (delivery :BOOL)
)

(defcstruct SIZECALLBACKDATA
  (user-data :POINTER)
  (pos VEC2)
  (current-size VEC2)
  (desired-size VEC2)
)

(defctype KEY :INT)

(defctype INPUTTEXTFLAGS :INT)

(defcstruct INPUTTEXTCALLBACKDATA
  (ctx :POINTER)
  (event-flag INPUTTEXTFLAGS)
  (flags INPUTTEXTFLAGS)
  (user-data :POINTER)
  (event-char WCHAR)
  (event-key KEY)
  (buf :STRING)
  (buf-text-len :INT)
  (buf-size :INT)
  (buf-dirty :BOOL)
  (cursor-pos :INT)
  (selection-start :INT)
  (selection-end :INT)
)

(defcstruct VECTOR-IMWCHAR
  (size :INT)
  (capacity :INT)
  (data :POINTER)
)

(defcstruct KEYDATA
  (down :BOOL)
  (down-duration :FLOAT)
  (down-duration-prev :FLOAT)
  (analog-value :FLOAT)
)

(defctype KEYCHORD :INT)

(defctype MOUSESOURCE :INT)

(defctype BACKENDFLAGS :INT)

(defctype CONFIGFLAGS :INT)

(defcstruct IO
  (config-flags CONFIGFLAGS)
  (backend-flags BACKENDFLAGS)
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
  (mouse-source MOUSE-SOURCE)
  (key-ctrl :BOOL)
  (key-shift :BOOL)
  (key-alt :BOOL)
  (key-super :BOOL)
  (key-mods KEYCHORD)
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
  (input-queue-characters VECTOR-IMWCHAR)
  (font-global-scale :FLOAT)
  (get-clipboard-text-fn :POINTER)
  (set-clipboard-text-fn :POINTER)
  (clipboard-user-data :POINTER)
)

(defctype HOVEREDFLAGS :INT)

(defctype TREENODEFLAGS :INT)

(defctype DIR :INT)

(defcstruct STYLE
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
  (window-menu-button-position DIR)
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
  (tree-lines-flags TREENODEFLAGS)
  (tree-lines-size :FLOAT)
  (tree-lines-rounding :FLOAT)
  (drag-drop-target-rounding :FLOAT)
  (drag-drop-target-border-size :FLOAT)
  (drag-drop-target-padding :FLOAT)
  (color-marker-size :FLOAT)
  (color-button-position DIR)
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
  (hover-flags-for-tooltip-mouse HOVEREDFLAGS)
  (hover-flags-for-tooltip-nav HOVEREDFLAGS)
  (-main-scale :FLOAT)
  (-next-frame-font-size-base :FLOAT)
)

(defctype SORTDIRECTION U8)

(defctype S16 :SHORT)

(defcstruct TABLECOLUMNSORTSPECS
  (column-user-id ID)
  (column-index S16)
  (sort-order S16)
  (sort-direction SORT-DIRECTION)
)

(defcstruct TABLESORTSPECS
  (specs :POINTER)
  (specs-count :INT)
  (specs-dirty :BOOL)
)

(defctype FONTATLASCUSTOMRECT FONTATLASRECT)

(defctype FONTATLASRECTID :INT)

(defctype MEMFREEFUNC :POINTER)

(defctype MEMALLOCFUNC :POINTER)

(defctype SIZECALLBACK :POINTER)

(defctype INPUTTEXTCALLBACK :POINTER)

(defctype WCHAR32 :UNSIGNED-INT)

(defctype WINDOWFLAGS :INT)

(defctype TABLEROWFLAGS :INT)

(defctype TABLECOLUMNFLAGS :INT)

(defctype TABLEFLAGS :INT)

(defctype TABITEMFLAGS :INT)

(defctype TABBARFLAGS :INT)

(defctype SLIDERFLAGS :INT)

(defctype SELECTABLEFLAGS :INT)

(defctype MULTISELECTFLAGS :INT)

(defctype POPUPFLAGS :INT)

(defctype ITEMFLAGS :INT)

(defctype INPUTFLAGS :INT)

(defctype FOCUSEDFLAGS :INT)

(defctype DRAGDROPFLAGS :INT)

(defctype COMBOFLAGS :INT)

(defctype COLOREDITFLAGS :INT)

(defctype CHILDFLAGS :INT)

(defctype BUTTONFLAGS :INT)

(defctype DRAWTEXTFLAGS :INT)

(defctype DRAWFLAGS :INT)

(defctype TABLEBGTARGET :INT)

(defctype STYLEVAR :INT)

(defctype MOUSECURSOR :INT)

(defctype MOUSEBUTTON :INT)

(defctype DATATYPE :INT)

(defctype COND :INT)

(defctype COL :INT)

(defctype S32 :INT)

(defcfun ("ImTextureRef_GetTexID" texture-ref-get-tex-id) TEXTUREID
  (self :POINTER)
)

(defcfun ("ImGui_CreateContext" create-context) :POINTER
  (shared-font-atlas :POINTER)
)

(defcfun ("ImGui_DestroyContext" destroy-context) :VOID
  (ctx :POINTER)
)

(defcfun ("ImGui_GetCurrentContext" get-current-context) :POINTER)

(defcfun ("ImGui_SetCurrentContext" set-current-context) :VOID
  (ctx :POINTER)
)

(defcfun ("ImGui_GetIO" get-io) :POINTER)

(defcfun ("ImGui_GetPlatformIO" get-platform-io) :POINTER)

(defcfun ("ImGui_GetStyle" get-style) :POINTER)

(defcfun ("ImGui_NewFrame" new-frame) :VOID)

(defcfun ("ImGui_EndFrame" end-frame) :VOID)

(defcfun ("ImGui_Render" render) :VOID)

(defcfun ("ImGui_GetDrawData" get-draw-data) :POINTER)

(defcfun ("ImGui_ShowDemoWindow" show-demo-window) :VOID
  (p-open :POINTER)
)

(defcfun ("ImGui_ShowMetricsWindow" show-metrics-window) :VOID
  (p-open :POINTER)
)

(defcfun ("ImGui_ShowDebugLogWindow" show-debug-log-window) :VOID
  (p-open :POINTER)
)

(defcfun ("ImGui_ShowIDStackToolWindowEx" show-idstack-tool-window-ex) :VOID
  (p-open :POINTER)
)

(defcfun ("ImGui_ShowAboutWindow" show-about-window) :VOID
  (p-open :POINTER)
)

(defcfun ("ImGui_ShowStyleEditor" show-style-editor) :VOID
  (ref :POINTER)
)

(defcfun ("ImGui_ShowStyleSelector" show-style-selector) :BOOL
  (label :STRING)
)

(defcfun ("ImGui_ShowFontSelector" show-font-selector) :VOID
  (label :STRING)
)

(defcfun ("ImGui_ShowUserGuide" show-user-guide) :VOID)

(defcfun ("ImGui_GetVersion" get-version) :STRING)

(defcfun ("ImGui_StyleColorsDark" style-colors-dark) :VOID
  (dst :POINTER)
)

(defcfun ("ImGui_StyleColorsLight" style-colors-light) :VOID
  (dst :POINTER)
)

(defcfun ("ImGui_StyleColorsClassic" style-colors-classic) :VOID
  (dst :POINTER)
)

(defcfun ("ImGui_Begin" begin) :BOOL
  (name :STRING)
  (p-open :POINTER)
  (flags WINDOWFLAGS)
)

(defcfun ("ImGui_End" end) :VOID)

(defcfun ("ImGui_BeginChild" begin-child) :BOOL
  (str-id :STRING)
  (size VEC2)
  (child-flags CHILDFLAGS)
  (window-flags WINDOWFLAGS)
)

(defcfun ("ImGui_BeginChildID" begin-child-id) :BOOL
  (id ID)
  (size VEC2)
  (child-flags CHILDFLAGS)
  (window-flags WINDOWFLAGS)
)

(defcfun ("ImGui_EndChild" end-child) :VOID)

(defcfun ("ImGui_IsWindowAppearing" is-window-appearing) :BOOL)

(defcfun ("ImGui_IsWindowCollapsed" is-window-collapsed) :BOOL)

(defcfun ("ImGui_IsWindowFocused" is-window-focused) :BOOL
  (flags FOCUSEDFLAGS)
)

(defcfun ("ImGui_IsWindowHovered" is-window-hovered) :BOOL
  (flags HOVEREDFLAGS)
)

(defcfun ("ImGui_GetWindowDrawList" get-window-draw-list) :POINTER)

(defcfun ("ImGui_GetWindowPos" get-window-pos) VEC2)

(defcfun ("ImGui_GetWindowSize" get-window-size) VEC2)

(defcfun ("ImGui_GetWindowWidth" get-window-width) :FLOAT)

(defcfun ("ImGui_GetWindowHeight" get-window-height) :FLOAT)

(defcfun ("ImGui_SetNextWindowPosEx" set-next-window-pos-ex) :VOID
  (pos VEC2)
  (cond COND)
  (pivot VEC2)
)

(defcfun ("ImGui_SetNextWindowSize" set-next-window-size) :VOID
  (size VEC2)
  (cond COND)
)

(defcfun ("ImGui_SetNextWindowSizeConstraints" set-next-window-size-constraints) :VOID
  (size-min VEC2)
  (size-max VEC2)
  (custom-callback SIZECALLBACK)
  (custom-callback-data :POINTER)
)

(defcfun ("ImGui_SetNextWindowContentSize" set-next-window-content-size) :VOID
  (size VEC2)
)

(defcfun ("ImGui_SetNextWindowCollapsed" set-next-window-collapsed) :VOID
  (collapsed :BOOL)
  (cond COND)
)

(defcfun ("ImGui_SetNextWindowFocus" set-next-window-focus) :VOID)

(defcfun ("ImGui_SetNextWindowScroll" set-next-window-scroll) :VOID
  (scroll VEC2)
)

(defcfun ("ImGui_SetNextWindowBgAlpha" set-next-window-bg-alpha) :VOID
  (alpha :FLOAT)
)

(defcfun ("ImGui_SetWindowPos" set-window-pos) :VOID
  (pos VEC2)
  (cond COND)
)

(defcfun ("ImGui_SetWindowSize" set-window-size) :VOID
  (size VEC2)
  (cond COND)
)

(defcfun ("ImGui_SetWindowCollapsed" set-window-collapsed) :VOID
  (collapsed :BOOL)
  (cond COND)
)

(defcfun ("ImGui_SetWindowFocus" set-window-focus) :VOID)

(defcfun ("ImGui_SetWindowPosStr" set-window-pos-str) :VOID
  (name :STRING)
  (pos VEC2)
  (cond COND)
)

(defcfun ("ImGui_SetWindowSizeStr" set-window-size-str) :VOID
  (name :STRING)
  (size VEC2)
  (cond COND)
)

(defcfun ("ImGui_SetWindowCollapsedStr" set-window-collapsed-str) :VOID
  (name :STRING)
  (collapsed :BOOL)
  (cond COND)
)

(defcfun ("ImGui_SetWindowFocusStr" set-window-focus-str) :VOID
  (name :STRING)
)

(defcfun ("ImGui_GetScrollX" get-scroll-x) :FLOAT)

(defcfun ("ImGui_GetScrollY" get-scroll-y) :FLOAT)

(defcfun ("ImGui_SetScrollX" set-scroll-x) :VOID
  (scroll-x :FLOAT)
)

(defcfun ("ImGui_SetScrollY" set-scroll-y) :VOID
  (scroll-y :FLOAT)
)

(defcfun ("ImGui_GetScrollMaxX" get-scroll-max-x) :FLOAT)

(defcfun ("ImGui_GetScrollMaxY" get-scroll-max-y) :FLOAT)

(defcfun ("ImGui_SetScrollHereX" set-scroll-here-x) :VOID
  (center-x-ratio :FLOAT)
)

(defcfun ("ImGui_SetScrollHereY" set-scroll-here-y) :VOID
  (center-y-ratio :FLOAT)
)

(defcfun ("ImGui_SetScrollFromPosX" set-scroll-from-pos-x) :VOID
  (local-x :FLOAT)
  (center-x-ratio :FLOAT)
)

(defcfun ("ImGui_SetScrollFromPosY" set-scroll-from-pos-y) :VOID
  (local-y :FLOAT)
  (center-y-ratio :FLOAT)
)

(defcfun ("ImGui_PushFontFloat" push-font-float) :VOID
  (font :POINTER)
  (font-size-base-unscaled :FLOAT)
)

(defcfun ("ImGui_PopFont" pop-font) :VOID)

(defcfun ("ImGui_GetFont" get-font) :POINTER)

(defcfun ("ImGui_GetFontSize" get-font-size) :FLOAT)

(defcfun ("ImGui_GetFontBaked" get-font-baked) :POINTER)

(defcfun ("ImGui_PushStyleColor" push-style-color) :VOID
  (idx COL)
  (col U32)
)

(defcfun ("ImGui_PushStyleColorImVec4" push-style-color-im-vec4) :VOID
  (idx COL)
  (col VEC4)
)

(defcfun ("ImGui_PopStyleColorEx" pop-style-color-ex) :VOID
  (count :INT)
)

(defcfun ("ImGui_PushStyleVar" push-style-var) :VOID
  (idx STYLEVAR)
  (val :FLOAT)
)

(defcfun ("ImGui_PushStyleVarImVec2" push-style-var-im-vec2) :VOID
  (idx STYLEVAR)
  (val VEC2)
)

(defcfun ("ImGui_PushStyleVarX" push-style-var-x) :VOID
  (idx STYLEVAR)
  (val-x :FLOAT)
)

(defcfun ("ImGui_PushStyleVarY" push-style-var-y) :VOID
  (idx STYLEVAR)
  (val-y :FLOAT)
)

(defcfun ("ImGui_PopStyleVarEx" pop-style-var-ex) :VOID
  (count :INT)
)

(defcfun ("ImGui_PushItemFlag" push-item-flag) :VOID
  (option ITEMFLAGS)
  (enabled :BOOL)
)

(defcfun ("ImGui_PopItemFlag" pop-item-flag) :VOID)

(defcfun ("ImGui_PushItemWidth" push-item-width) :VOID
  (item-width :FLOAT)
)

(defcfun ("ImGui_PopItemWidth" pop-item-width) :VOID)

(defcfun ("ImGui_SetNextItemWidth" set-next-item-width) :VOID
  (item-width :FLOAT)
)

(defcfun ("ImGui_CalcItemWidth" calc-item-width) :FLOAT)

(defcfun ("ImGui_PushTextWrapPos" push-text-wrap-pos) :VOID
  (wrap-local-pos-x :FLOAT)
)

(defcfun ("ImGui_PopTextWrapPos" pop-text-wrap-pos) :VOID)

(defcfun ("ImGui_GetFontTexUvWhitePixel" get-font-tex-uv-white-pixel) VEC2)

(defcfun ("ImGui_GetColorU32Ex" get-color-u32ex) U32
  (idx COL)
  (alpha-mul :FLOAT)
)

(defcfun ("ImGui_GetColorU32ImVec4" get-color-u32im-vec4) U32
  (col VEC4)
)

(defcfun ("ImGui_GetColorU32ImU32Ex" get-color-u32im-u32ex) U32
  (col U32)
  (alpha-mul :FLOAT)
)

(defcfun ("ImGui_GetStyleColorVec4" get-style-color-vec4) :POINTER
  (idx COL)
)

(defcfun ("ImGui_GetCursorScreenPos" get-cursor-screen-pos) VEC2)

(defcfun ("ImGui_SetCursorScreenPos" set-cursor-screen-pos) :VOID
  (pos VEC2)
)

(defcfun ("ImGui_GetContentRegionAvail" get-content-region-avail) VEC2)

(defcfun ("ImGui_GetCursorPos" get-cursor-pos) VEC2)

(defcfun ("ImGui_GetCursorPosX" get-cursor-pos-x) :FLOAT)

(defcfun ("ImGui_GetCursorPosY" get-cursor-pos-y) :FLOAT)

(defcfun ("ImGui_SetCursorPos" set-cursor-pos) :VOID
  (local-pos VEC2)
)

(defcfun ("ImGui_SetCursorPosX" set-cursor-pos-x) :VOID
  (local-x :FLOAT)
)

(defcfun ("ImGui_SetCursorPosY" set-cursor-pos-y) :VOID
  (local-y :FLOAT)
)

(defcfun ("ImGui_GetCursorStartPos" get-cursor-start-pos) VEC2)

(defcfun ("ImGui_Separator" separator) :VOID)

(defcfun ("ImGui_SameLineEx" same-line-ex) :VOID
  (offset-from-start-x :FLOAT)
  (spacing :FLOAT)
)

(defcfun ("ImGui_NewLine" new-line) :VOID)

(defcfun ("ImGui_Spacing" spacing) :VOID)

(defcfun ("ImGui_Dummy" dummy) :VOID
  (size VEC2)
)

(defcfun ("ImGui_IndentEx" indent-ex) :VOID
  (indent-w :FLOAT)
)

(defcfun ("ImGui_UnindentEx" unindent-ex) :VOID
  (indent-w :FLOAT)
)

(defcfun ("ImGui_BeginGroup" begin-group) :VOID)

(defcfun ("ImGui_EndGroup" end-group) :VOID)

(defcfun ("ImGui_AlignTextToFramePadding" align-text-to-frame-padding) :VOID)

(defcfun ("ImGui_GetTextLineHeight" get-text-line-height) :FLOAT)

(defcfun ("ImGui_GetTextLineHeightWithSpacing" get-text-line-height-with-spacing) :FLOAT)

(defcfun ("ImGui_GetFrameHeight" get-frame-height) :FLOAT)

(defcfun ("ImGui_GetFrameHeightWithSpacing" get-frame-height-with-spacing) :FLOAT)

(defcfun ("ImGui_PushID" push-id) :VOID
  (str-id :STRING)
)

(defcfun ("ImGui_PushIDStr" push-idstr) :VOID
  (str-id-begin :STRING)
  (str-id-end :STRING)
)

(defcfun ("ImGui_PushIDPtr" push-idptr) :VOID
  (ptr-id :POINTER)
)

(defcfun ("ImGui_PushIDInt" push-idint) :VOID
  (int-id :INT)
)

(defcfun ("ImGui_PopID" pop-id) :VOID)

(defcfun ("ImGui_GetID" get-id) ID
  (str-id :STRING)
)

(defcfun ("ImGui_GetIDStr" get-idstr) ID
  (str-id-begin :STRING)
  (str-id-end :STRING)
)

(defcfun ("ImGui_GetIDPtr" get-idptr) ID
  (ptr-id :POINTER)
)

(defcfun ("ImGui_GetIDInt" get-idint) ID
  (int-id :INT)
)

(defcfun ("ImGui_TextUnformattedEx" text-unformatted-ex) :VOID
  (text :STRING)
  (text-end :STRING)
)

(defcfun ("ImGui_Text" text) :VOID
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_TextV" text-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_TextColored" text-colored) :VOID
  (col VEC4)
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_TextColoredV" text-colored-v) :VOID
  (col VEC4)
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_TextDisabled" text-disabled) :VOID
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_TextDisabledV" text-disabled-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_TextWrapped" text-wrapped) :VOID
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_TextWrappedV" text-wrapped-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_LabelText" label-text) :VOID
  (label :STRING)
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_LabelTextV" label-text-v) :VOID
  (label :STRING)
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_BulletText" bullet-text) :VOID
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_BulletTextV" bullet-text-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_SeparatorText" separator-text) :VOID
  (label :STRING)
)

(defcfun ("ImGui_ButtonEx" button-ex) :BOOL
  (label :STRING)
  (size VEC2)
)

(defcfun ("ImGui_SmallButton" small-button) :BOOL
  (label :STRING)
)

(defcfun ("ImGui_InvisibleButton" invisible-button) :BOOL
  (str-id :STRING)
  (size VEC2)
  (flags BUTTONFLAGS)
)

(defcfun ("ImGui_ArrowButton" arrow-button) :BOOL
  (str-id :STRING)
  (dir DIR)
)

(defcfun ("ImGui_Checkbox" checkbox) :BOOL
  (label :STRING)
  (v :POINTER)
)

(defcfun ("ImGui_CheckboxFlagsIntPtr" checkbox-flags-int-ptr) :BOOL
  (label :STRING)
  (flags :POINTER)
  (flags-value :INT)
)

(defcfun ("ImGui_CheckboxFlagsUintPtr" checkbox-flags-uint-ptr) :BOOL
  (label :STRING)
  (flags :POINTER)
  (flags-value :UNSIGNED-INT)
)

(defcfun ("ImGui_RadioButton" radio-button) :BOOL
  (label :STRING)
  (active :BOOL)
)

(defcfun ("ImGui_RadioButtonIntPtr" radio-button-int-ptr) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-button :INT)
)

(defcfun ("ImGui_ProgressBar" progress-bar) :VOID
  (fraction :FLOAT)
  (size-arg VEC2)
  (overlay :STRING)
)

(defcfun ("ImGui_Bullet" bullet) :VOID)

(defcfun ("ImGui_TextLink" text-link) :BOOL
  (label :STRING)
)

(defcfun ("ImGui_TextLinkOpenURLEx" text-link-open-urlex) :BOOL
  (label :STRING)
  (url :STRING)
)

(defcfun ("ImGui_ImageEx" image-ex) :VOID
  (tex-ref TEXTUREREF)
  (image-size VEC2)
  (uv0 VEC2)
  (uv1 VEC2)
)

(defcfun ("ImGui_ImageWithBgEx" image-with-bg-ex) :VOID
  (tex-ref TEXTUREREF)
  (image-size VEC2)
  (uv0 VEC2)
  (uv1 VEC2)
  (bg-col VEC4)
  (tint-col VEC4)
)

(defcfun ("ImGui_ImageButtonEx" image-button-ex) :BOOL
  (str-id :STRING)
  (tex-ref TEXTUREREF)
  (image-size VEC2)
  (uv0 VEC2)
  (uv1 VEC2)
  (bg-col VEC4)
  (tint-col VEC4)
)

(defcfun ("ImGui_BeginCombo" begin-combo) :BOOL
  (label :STRING)
  (preview-value :STRING)
  (flags COMBOFLAGS)
)

(defcfun ("ImGui_EndCombo" end-combo) :VOID)

(defcfun ("ImGui_ComboCharEx" combo-char-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (items :pointer)
  (items-count :INT)
  (popup-max-height-in-items :INT)
)

(defcfun ("ImGui_ComboEx" combo-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (items-separated-by-zeros :STRING)
  (popup-max-height-in-items :INT)
)

(defcfun ("ImGui_ComboCallbackEx" combo-callback-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (getter :POINTER)
  (user-data :POINTER)
  (items-count :INT)
  (popup-max-height-in-items :INT)
)

(defcfun ("ImGui_DragFloatEx" drag-float-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragFloat2Ex" drag-float2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragFloat3Ex" drag-float3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragFloat4Ex" drag-float4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragFloatRange2Ex" drag-float-range2ex) :BOOL
  (label :STRING)
  (v-current-min :POINTER)
  (v-current-max :POINTER)
  (v-speed :FLOAT)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (format-max :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragIntEx" drag-int-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragInt2Ex" drag-int2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragInt3Ex" drag-int3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragInt4Ex" drag-int4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragIntRange2Ex" drag-int-range2ex) :BOOL
  (label :STRING)
  (v-current-min :POINTER)
  (v-current-max :POINTER)
  (v-speed :FLOAT)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (format-max :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragScalarEx" drag-scalar-ex) :BOOL
  (label :STRING)
  (data-type DATATYPE)
  (p-data :POINTER)
  (v-speed :FLOAT)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_DragScalarNEx" drag-scalar-nex) :BOOL
  (label :STRING)
  (data-type DATATYPE)
  (p-data :POINTER)
  (components :INT)
  (v-speed :FLOAT)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderFloatEx" slider-float-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderFloat2Ex" slider-float2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderFloat3Ex" slider-float3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderFloat4Ex" slider-float4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderAngleEx" slider-angle-ex) :BOOL
  (label :STRING)
  (v-rad :POINTER)
  (v-degrees-min :FLOAT)
  (v-degrees-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderIntEx" slider-int-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderInt2Ex" slider-int2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderInt3Ex" slider-int3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderInt4Ex" slider-int4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderScalarEx" slider-scalar-ex) :BOOL
  (label :STRING)
  (data-type DATATYPE)
  (p-data :POINTER)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_SliderScalarNEx" slider-scalar-nex) :BOOL
  (label :STRING)
  (data-type DATATYPE)
  (p-data :POINTER)
  (components :INT)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_VSliderFloatEx" vslider-float-ex) :BOOL
  (label :STRING)
  (size VEC2)
  (v :POINTER)
  (v-min :FLOAT)
  (v-max :FLOAT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_VSliderIntEx" vslider-int-ex) :BOOL
  (label :STRING)
  (size VEC2)
  (v :POINTER)
  (v-min :INT)
  (v-max :INT)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_VSliderScalarEx" vslider-scalar-ex) :BOOL
  (label :STRING)
  (size VEC2)
  (data-type DATATYPE)
  (p-data :POINTER)
  (p-min :POINTER)
  (p-max :POINTER)
  (format :STRING)
  (flags SLIDERFLAGS)
)

(defcfun ("ImGui_InputTextEx" input-text-ex) :BOOL
  (label :STRING)
  (buf :STRING)
  (buf-size :SIZE)
  (flags INPUTTEXTFLAGS)
  (callback INPUTTEXTCALLBACK)
  (user-data :POINTER)
)

(defcfun ("ImGui_InputTextMultilineEx" input-text-multiline-ex) :BOOL
  (label :STRING)
  (buf :STRING)
  (buf-size :SIZE)
  (size VEC2)
  (flags INPUTTEXTFLAGS)
  (callback INPUTTEXTCALLBACK)
  (user-data :POINTER)
)

(defcfun ("ImGui_InputTextWithHintEx" input-text-with-hint-ex) :BOOL
  (label :STRING)
  (hint :STRING)
  (buf :STRING)
  (buf-size :SIZE)
  (flags INPUTTEXTFLAGS)
  (callback INPUTTEXTCALLBACK)
  (user-data :POINTER)
)

(defcfun ("ImGui_InputFloatEx" input-float-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (step :FLOAT)
  (step-fast :FLOAT)
  (format :STRING)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputFloat2Ex" input-float2ex) :BOOL
  (label :STRING)
  (v :pointer)
  (format :STRING)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputFloat3Ex" input-float3ex) :BOOL
  (label :STRING)
  (v :pointer)
  (format :STRING)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputFloat4Ex" input-float4ex) :BOOL
  (label :STRING)
  (v :pointer)
  (format :STRING)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputIntEx" input-int-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (step :INT)
  (step-fast :INT)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputInt2" input-int2) :BOOL
  (label :STRING)
  (v :pointer)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputInt3" input-int3) :BOOL
  (label :STRING)
  (v :pointer)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputInt4" input-int4) :BOOL
  (label :STRING)
  (v :pointer)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputDoubleEx" input-double-ex) :BOOL
  (label :STRING)
  (v :POINTER)
  (step :DOUBLE)
  (step-fast :DOUBLE)
  (format :STRING)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputScalarEx" input-scalar-ex) :BOOL
  (label :STRING)
  (data-type DATATYPE)
  (p-data :POINTER)
  (p-step :POINTER)
  (p-step-fast :POINTER)
  (format :STRING)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_InputScalarNEx" input-scalar-nex) :BOOL
  (label :STRING)
  (data-type DATATYPE)
  (p-data :POINTER)
  (components :INT)
  (p-step :POINTER)
  (p-step-fast :POINTER)
  (format :STRING)
  (flags INPUTTEXTFLAGS)
)

(defcfun ("ImGui_ColorEdit3" color-edit3) :BOOL
  (label :STRING)
  (col :pointer)
  (flags COLOREDITFLAGS)
)

(defcfun ("ImGui_ColorEdit4" color-edit4) :BOOL
  (label :STRING)
  (col :pointer)
  (flags COLOREDITFLAGS)
)

(defcfun ("ImGui_ColorPicker3" color-picker3) :BOOL
  (label :STRING)
  (col :pointer)
  (flags COLOREDITFLAGS)
)

(defcfun ("ImGui_ColorPicker4" color-picker4) :BOOL
  (label :STRING)
  (col :pointer)
  (flags COLOREDITFLAGS)
  (ref-col :POINTER)
)

(defcfun ("ImGui_ColorButtonEx" color-button-ex) :BOOL
  (desc-id :STRING)
  (col VEC4)
  (flags COLOREDITFLAGS)
  (size VEC2)
)

(defcfun ("ImGui_SetColorEditOptions" set-color-edit-options) :VOID
  (flags COLOREDITFLAGS)
)

(defcfun ("ImGui_TreeNode" tree-node) :BOOL
  (label :STRING)
)

(defcfun ("ImGui_TreeNodeStr" tree-node-str) :BOOL
  (str-id :STRING)
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_TreeNodePtr" tree-node-ptr) :BOOL
  (ptr-id :POINTER)
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_TreeNodeV" tree-node-v) :BOOL
  (str-id :STRING)
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_TreeNodeVPtr" tree-node-vptr) :BOOL
  (ptr-id :POINTER)
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_TreeNodeEx" tree-node-ex) :BOOL
  (label :STRING)
  (flags TREENODEFLAGS)
)

(defcfun ("ImGui_TreeNodeExStr" tree-node-ex-str) :BOOL
  (str-id :STRING)
  (flags TREENODEFLAGS)
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_TreeNodeExPtr" tree-node-ex-ptr) :BOOL
  (ptr-id :POINTER)
  (flags TREENODEFLAGS)
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_TreeNodeExV" tree-node-ex-v) :BOOL
  (str-id :STRING)
  (flags TREENODEFLAGS)
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_TreeNodeExVPtr" tree-node-ex-vptr) :BOOL
  (ptr-id :POINTER)
  (flags TREENODEFLAGS)
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_TreePush" tree-push) :VOID
  (str-id :STRING)
)

(defcfun ("ImGui_TreePushPtr" tree-push-ptr) :VOID
  (ptr-id :POINTER)
)

(defcfun ("ImGui_TreePop" tree-pop) :VOID)

(defcfun ("ImGui_GetTreeNodeToLabelSpacing" get-tree-node-to-label-spacing) :FLOAT)

(defcfun ("ImGui_CollapsingHeader" collapsing-header) :BOOL
  (label :STRING)
  (flags TREENODEFLAGS)
)

(defcfun ("ImGui_CollapsingHeaderBoolPtr" collapsing-header-bool-ptr) :BOOL
  (label :STRING)
  (p-visible :POINTER)
  (flags TREENODEFLAGS)
)

(defcfun ("ImGui_SetNextItemOpen" set-next-item-open) :VOID
  (is-open :BOOL)
  (cond COND)
)

(defcfun ("ImGui_SetNextItemStorageID" set-next-item-storage-id) :VOID
  (storage-id ID)
)

(defcfun ("ImGui_SelectableEx" selectable-ex) :BOOL
  (label :STRING)
  (selected :BOOL)
  (flags SELECTABLEFLAGS)
  (size VEC2)
)

(defcfun ("ImGui_SelectableBoolPtrEx" selectable-bool-ptr-ex) :BOOL
  (label :STRING)
  (p-selected :POINTER)
  (flags SELECTABLEFLAGS)
  (size VEC2)
)

(defcfun ("ImGui_BeginMultiSelectEx" begin-multi-select-ex) :POINTER
  (flags MULTISELECTFLAGS)
  (selection-size :INT)
  (items-count :INT)
)

(defcfun ("ImGui_EndMultiSelect" end-multi-select) :POINTER)

(defcfun ("ImGui_SetNextItemSelectionUserData" set-next-item-selection-user-data) :VOID
  (selection-user-data SELECTIONUSERDATA)
)

(defcfun ("ImGui_IsItemToggledSelection" is-item-toggled-selection) :BOOL)

(defcfun ("ImGui_BeginListBox" begin-list-box) :BOOL
  (label :STRING)
  (size VEC2)
)

(defcfun ("ImGui_EndListBox" end-list-box) :VOID)

(defcfun ("ImGui_ListBox" list-box) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (items :pointer)
  (items-count :INT)
  (height-in-items :INT)
)

(defcfun ("ImGui_ListBoxCallbackEx" list-box-callback-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (getter :POINTER)
  (user-data :POINTER)
  (items-count :INT)
  (height-in-items :INT)
)

(defcfun ("ImGui_PlotLinesEx" plot-lines-ex) :VOID
  (label :STRING)
  (values :POINTER)
  (values-count :INT)
  (values-offset :INT)
  (overlay-text :STRING)
  (scale-min :FLOAT)
  (scale-max :FLOAT)
  (graph-size VEC2)
  (stride :INT)
)

(defcfun ("ImGui_PlotLinesCallbackEx" plot-lines-callback-ex) :VOID
  (label :STRING)
  (values-getter :POINTER)
  (data :POINTER)
  (values-count :INT)
  (values-offset :INT)
  (overlay-text :STRING)
  (scale-min :FLOAT)
  (scale-max :FLOAT)
  (graph-size VEC2)
)

(defcfun ("ImGui_PlotHistogramEx" plot-histogram-ex) :VOID
  (label :STRING)
  (values :POINTER)
  (values-count :INT)
  (values-offset :INT)
  (overlay-text :STRING)
  (scale-min :FLOAT)
  (scale-max :FLOAT)
  (graph-size VEC2)
  (stride :INT)
)

(defcfun ("ImGui_PlotHistogramCallbackEx" plot-histogram-callback-ex) :VOID
  (label :STRING)
  (values-getter :POINTER)
  (data :POINTER)
  (values-count :INT)
  (values-offset :INT)
  (overlay-text :STRING)
  (scale-min :FLOAT)
  (scale-max :FLOAT)
  (graph-size VEC2)
)

(defcfun ("ImGui_BeginMenuBar" begin-menu-bar) :BOOL)

(defcfun ("ImGui_EndMenuBar" end-menu-bar) :VOID)

(defcfun ("ImGui_BeginMainMenuBar" begin-main-menu-bar) :BOOL)

(defcfun ("ImGui_EndMainMenuBar" end-main-menu-bar) :VOID)

(defcfun ("ImGui_BeginMenuEx" begin-menu-ex) :BOOL
  (label :STRING)
  (enabled :BOOL)
)

(defcfun ("ImGui_EndMenu" end-menu) :VOID)

(defcfun ("ImGui_MenuItemEx" menu-item-ex) :BOOL
  (label :STRING)
  (shortcut :STRING)
  (selected :BOOL)
  (enabled :BOOL)
)

(defcfun ("ImGui_MenuItemBoolPtr" menu-item-bool-ptr) :BOOL
  (label :STRING)
  (shortcut :STRING)
  (p-selected :POINTER)
  (enabled :BOOL)
)

(defcfun ("ImGui_BeginTooltip" begin-tooltip) :BOOL)

(defcfun ("ImGui_EndTooltip" end-tooltip) :VOID)

(defcfun ("ImGui_SetTooltip" set-tooltip) :VOID
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_SetTooltipV" set-tooltip-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_BeginItemTooltip" begin-item-tooltip) :BOOL)

(defcfun ("ImGui_SetItemTooltip" set-item-tooltip) :VOID
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_SetItemTooltipV" set-item-tooltip-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_BeginPopup" begin-popup) :BOOL
  (str-id :STRING)
  (flags WINDOWFLAGS)
)

(defcfun ("ImGui_BeginPopupModal" begin-popup-modal) :BOOL
  (name :STRING)
  (p-open :POINTER)
  (flags WINDOWFLAGS)
)

(defcfun ("ImGui_EndPopup" end-popup) :VOID)

(defcfun ("ImGui_OpenPopup" open-popup) :VOID
  (str-id :STRING)
  (popup-flags POPUPFLAGS)
)

(defcfun ("ImGui_OpenPopupID" open-popup-id) :VOID
  (id ID)
  (popup-flags POPUPFLAGS)
)

(defcfun ("ImGui_OpenPopupOnItemClick" open-popup-on-item-click) :VOID
  (str-id :STRING)
  (popup-flags POPUPFLAGS)
)

(defcfun ("ImGui_CloseCurrentPopup" close-current-popup) :VOID)

(defcfun ("ImGui_BeginPopupContextItemEx" begin-popup-context-item-ex) :BOOL
  (str-id :STRING)
  (popup-flags POPUPFLAGS)
)

(defcfun ("ImGui_BeginPopupContextWindowEx" begin-popup-context-window-ex) :BOOL
  (str-id :STRING)
  (popup-flags POPUPFLAGS)
)

(defcfun ("ImGui_BeginPopupContextVoidEx" begin-popup-context-void-ex) :BOOL
  (str-id :STRING)
  (popup-flags POPUPFLAGS)
)

(defcfun ("ImGui_IsPopupOpen" is-popup-open) :BOOL
  (str-id :STRING)
  (flags POPUPFLAGS)
)

(defcfun ("ImGui_BeginTableEx" begin-table-ex) :BOOL
  (str-id :STRING)
  (columns :INT)
  (flags TABLEFLAGS)
  (outer-size VEC2)
  (inner-width :FLOAT)
)

(defcfun ("ImGui_EndTable" end-table) :VOID)

(defcfun ("ImGui_TableNextRowEx" table-next-row-ex) :VOID
  (row-flags TABLEROWFLAGS)
  (min-row-height :FLOAT)
)

(defcfun ("ImGui_TableNextColumn" table-next-column) :BOOL)

(defcfun ("ImGui_TableSetColumnIndex" table-set-column-index) :BOOL
  (column-n :INT)
)

(defcfun ("ImGui_TableSetupColumnEx" table-setup-column-ex) :VOID
  (label :STRING)
  (flags TABLECOLUMNFLAGS)
  (init-width-or-weight :FLOAT)
  (user-id ID)
)

(defcfun ("ImGui_TableSetupScrollFreeze" table-setup-scroll-freeze) :VOID
  (cols :INT)
  (rows :INT)
)

(defcfun ("ImGui_TableHeader" table-header) :VOID
  (label :STRING)
)

(defcfun ("ImGui_TableHeadersRow" table-headers-row) :VOID)

(defcfun ("ImGui_TableAngledHeadersRow" table-angled-headers-row) :VOID)

(defcfun ("ImGui_TableGetSortSpecs" table-get-sort-specs) :POINTER)

(defcfun ("ImGui_TableGetColumnCount" table-get-column-count) :INT)

(defcfun ("ImGui_TableGetColumnIndex" table-get-column-index) :INT)

(defcfun ("ImGui_TableGetRowIndex" table-get-row-index) :INT)

(defcfun ("ImGui_TableGetColumnName" table-get-column-name) :STRING
  (column-n :INT)
)

(defcfun ("ImGui_TableGetColumnFlags" table-get-column-flags) TABLECOLUMNFLAGS
  (column-n :INT)
)

(defcfun ("ImGui_TableSetColumnEnabled" table-set-column-enabled) :VOID
  (column-n :INT)
  (v :BOOL)
)

(defcfun ("ImGui_TableGetHoveredColumn" table-get-hovered-column) :INT)

(defcfun ("ImGui_TableSetBgColor" table-set-bg-color) :VOID
  (target TABLEBGTARGET)
  (color U32)
  (column-n :INT)
)

(defcfun ("ImGui_ColumnsEx" columns-ex) :VOID
  (count :INT)
  (id :STRING)
  (borders :BOOL)
)

(defcfun ("ImGui_NextColumn" next-column) :VOID)

(defcfun ("ImGui_GetColumnIndex" get-column-index) :INT)

(defcfun ("ImGui_GetColumnWidth" get-column-width) :FLOAT
  (column-index :INT)
)

(defcfun ("ImGui_SetColumnWidth" set-column-width) :VOID
  (column-index :INT)
  (width :FLOAT)
)

(defcfun ("ImGui_GetColumnOffset" get-column-offset) :FLOAT
  (column-index :INT)
)

(defcfun ("ImGui_SetColumnOffset" set-column-offset) :VOID
  (column-index :INT)
  (offset-x :FLOAT)
)

(defcfun ("ImGui_GetColumnsCount" get-columns-count) :INT)

(defcfun ("ImGui_BeginTabBar" begin-tab-bar) :BOOL
  (str-id :STRING)
  (flags TABBARFLAGS)
)

(defcfun ("ImGui_EndTabBar" end-tab-bar) :VOID)

(defcfun ("ImGui_BeginTabItem" begin-tab-item) :BOOL
  (label :STRING)
  (p-open :POINTER)
  (flags TABITEMFLAGS)
)

(defcfun ("ImGui_EndTabItem" end-tab-item) :VOID)

(defcfun ("ImGui_TabItemButton" tab-item-button) :BOOL
  (label :STRING)
  (flags TABITEMFLAGS)
)

(defcfun ("ImGui_SetTabItemClosed" set-tab-item-closed) :VOID
  (tab-or-docked-window-label :STRING)
)

(defcfun ("ImGui_LogToTTY" log-to-tty) :VOID
  (auto-open-depth :INT)
)

(defcfun ("ImGui_LogToFile" log-to-file) :VOID
  (auto-open-depth :INT)
  (filename :STRING)
)

(defcfun ("ImGui_LogToClipboard" log-to-clipboard) :VOID
  (auto-open-depth :INT)
)

(defcfun ("ImGui_LogFinish" log-finish) :VOID)

(defcfun ("ImGui_LogButtons" log-buttons) :VOID)

(defcfun ("ImGui_LogText" log-text) :VOID
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_LogTextV" log-text-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_BeginDragDropSource" begin-drag-drop-source) :BOOL
  (flags DRAGDROPFLAGS)
)

(defcfun ("ImGui_SetDragDropPayload" set-drag-drop-payload) :BOOL
  (type :STRING)
  (data :POINTER)
  (sz :SIZE)
  (cond COND)
)

(defcfun ("ImGui_EndDragDropSource" end-drag-drop-source) :VOID)

(defcfun ("ImGui_BeginDragDropTarget" begin-drag-drop-target) :BOOL)

(defcfun ("ImGui_AcceptDragDropPayload" accept-drag-drop-payload) :POINTER
  (type :STRING)
  (flags DRAGDROPFLAGS)
)

(defcfun ("ImGui_EndDragDropTarget" end-drag-drop-target) :VOID)

(defcfun ("ImGui_GetDragDropPayload" get-drag-drop-payload) :POINTER)

(defcfun ("ImGui_BeginDisabled" begin-disabled) :VOID
  (disabled :BOOL)
)

(defcfun ("ImGui_EndDisabled" end-disabled) :VOID)

(defcfun ("ImGui_PushClipRect" push-clip-rect) :VOID
  (clip-rect-min VEC2)
  (clip-rect-max VEC2)
  (intersect-with-current-clip-rect :BOOL)
)

(defcfun ("ImGui_PopClipRect" pop-clip-rect) :VOID)

(defcfun ("ImGui_SetItemDefaultFocus" set-item-default-focus) :VOID)

(defcfun ("ImGui_SetKeyboardFocusHereEx" set-keyboard-focus-here-ex) :VOID
  (offset :INT)
)

(defcfun ("ImGui_SetNavCursorVisible" set-nav-cursor-visible) :VOID
  (visible :BOOL)
)

(defcfun ("ImGui_SetNextItemAllowOverlap" set-next-item-allow-overlap) :VOID)

(defcfun ("ImGui_IsItemHovered" is-item-hovered) :BOOL
  (flags HOVEREDFLAGS)
)

(defcfun ("ImGui_IsItemActive" is-item-active) :BOOL)

(defcfun ("ImGui_IsItemFocused" is-item-focused) :BOOL)

(defcfun ("ImGui_IsItemClickedEx" is-item-clicked-ex) :BOOL
  (mouse-button MOUSEBUTTON)
)

(defcfun ("ImGui_IsItemVisible" is-item-visible) :BOOL)

(defcfun ("ImGui_IsItemEdited" is-item-edited) :BOOL)

(defcfun ("ImGui_IsItemActivated" is-item-activated) :BOOL)

(defcfun ("ImGui_IsItemDeactivated" is-item-deactivated) :BOOL)

(defcfun ("ImGui_IsItemDeactivatedAfterEdit" is-item-deactivated-after-edit) :BOOL)

(defcfun ("ImGui_IsItemToggledOpen" is-item-toggled-open) :BOOL)

(defcfun ("ImGui_IsAnyItemHovered" is-any-item-hovered) :BOOL)

(defcfun ("ImGui_IsAnyItemActive" is-any-item-active) :BOOL)

(defcfun ("ImGui_IsAnyItemFocused" is-any-item-focused) :BOOL)

(defcfun ("ImGui_GetItemID" get-item-id) ID)

(defcfun ("ImGui_GetItemRectMin" get-item-rect-min) VEC2)

(defcfun ("ImGui_GetItemRectMax" get-item-rect-max) VEC2)

(defcfun ("ImGui_GetItemRectSize" get-item-rect-size) VEC2)

(defcfun ("ImGui_GetMainViewport" get-main-viewport) :POINTER)

(defcfun ("ImGui_GetBackgroundDrawList" get-background-draw-list) :POINTER)

(defcfun ("ImGui_GetForegroundDrawList" get-foreground-draw-list) :POINTER)

(defcfun ("ImGui_IsRectVisibleBySize" is-rect-visible-by-size) :BOOL
  (size VEC2)
)

(defcfun ("ImGui_IsRectVisible" is-rect-visible) :BOOL
  (rect-min VEC2)
  (rect-max VEC2)
)

(defcfun ("ImGui_GetTime" get-time) :DOUBLE)

(defcfun ("ImGui_GetFrameCount" get-frame-count) :INT)

(defcfun ("ImGui_GetDrawListSharedData" get-draw-list-shared-data) :POINTER)

(defcfun ("ImGui_GetStyleColorName" get-style-color-name) :STRING
  (idx COL)
)

(defcfun ("ImGui_SetStateStorage" set-state-storage) :VOID
  (storage :POINTER)
)

(defcfun ("ImGui_GetStateStorage" get-state-storage) :POINTER)

(defcfun ("ImGui_CalcTextSizeEx" calc-text-size-ex) VEC2
  (text :STRING)
  (text-end :STRING)
  (hide-text-after-double-hash :BOOL)
  (wrap-width :FLOAT)
)

(defcfun ("ImGui_ColorConvertU32ToFloat4" color-convert-u32to-float4) VEC4
  (in U32)
)

(defcfun ("ImGui_ColorConvertFloat4ToU32" color-convert-float4to-u32) U32
  (in VEC4)
)

(defcfun ("ImGui_ColorConvertRGBtoHSV" color-convert-rgbto-hsv) :VOID
  (r :FLOAT)
  (g :FLOAT)
  (b :FLOAT)
  (out-h :POINTER)
  (out-s :POINTER)
  (out-v :POINTER)
)

(defcfun ("ImGui_ColorConvertHSVtoRGB" color-convert-hsvto-rgb) :VOID
  (h :FLOAT)
  (s :FLOAT)
  (v :FLOAT)
  (out-r :POINTER)
  (out-g :POINTER)
  (out-b :POINTER)
)

(defcfun ("ImGui_IsKeyDown" is-key-down) :BOOL
  (key KEY)
)

(defcfun ("ImGui_IsKeyPressedEx" is-key-pressed-ex) :BOOL
  (key KEY)
  (repeat :BOOL)
)

(defcfun ("ImGui_IsKeyReleased" is-key-released) :BOOL
  (key KEY)
)

(defcfun ("ImGui_IsKeyChordPressed" is-key-chord-pressed) :BOOL
  (key-chord KEYCHORD)
)

(defcfun ("ImGui_GetKeyPressedAmount" get-key-pressed-amount) :INT
  (key KEY)
  (repeat-delay :FLOAT)
  (rate :FLOAT)
)

(defcfun ("ImGui_GetKeyName" get-key-name) :STRING
  (key KEY)
)

(defcfun ("ImGui_SetNextFrameWantCaptureKeyboard" set-next-frame-want-capture-keyboard) :VOID
  (want-capture-keyboard :BOOL)
)

(defcfun ("ImGui_Shortcut" shortcut) :BOOL
  (key-chord KEYCHORD)
  (flags INPUTFLAGS)
)

(defcfun ("ImGui_SetNextItemShortcut" set-next-item-shortcut) :VOID
  (key-chord KEYCHORD)
  (flags INPUTFLAGS)
)

(defcfun ("ImGui_SetItemKeyOwner" set-item-key-owner) :VOID
  (key KEY)
)

(defcfun ("ImGui_IsMouseDown" is-mouse-down) :BOOL
  (button MOUSEBUTTON)
)

(defcfun ("ImGui_IsMouseClickedEx" is-mouse-clicked-ex) :BOOL
  (button MOUSEBUTTON)
  (repeat :BOOL)
)

(defcfun ("ImGui_IsMouseReleased" is-mouse-released) :BOOL
  (button MOUSEBUTTON)
)

(defcfun ("ImGui_IsMouseDoubleClicked" is-mouse-double-clicked) :BOOL
  (button MOUSEBUTTON)
)

(defcfun ("ImGui_IsMouseReleasedWithDelay" is-mouse-released-with-delay) :BOOL
  (button MOUSEBUTTON)
  (delay :FLOAT)
)

(defcfun ("ImGui_GetMouseClickedCount" get-mouse-clicked-count) :INT
  (button MOUSEBUTTON)
)

(defcfun ("ImGui_IsMouseHoveringRectEx" is-mouse-hovering-rect-ex) :BOOL
  (r-min VEC2)
  (r-max VEC2)
  (clip :BOOL)
)

(defcfun ("ImGui_IsMousePosValid" is-mouse-pos-valid) :BOOL
  (mouse-pos :POINTER)
)

(defcfun ("ImGui_IsAnyMouseDown" is-any-mouse-down) :BOOL)

(defcfun ("ImGui_GetMousePos" get-mouse-pos) VEC2)

(defcfun ("ImGui_GetMousePosOnOpeningCurrentPopup" get-mouse-pos-on-opening-current-popup) VEC2)

(defcfun ("ImGui_IsMouseDragging" is-mouse-dragging) :BOOL
  (button MOUSEBUTTON)
  (lock-threshold :FLOAT)
)

(defcfun ("ImGui_GetMouseDragDelta" get-mouse-drag-delta) VEC2
  (button MOUSEBUTTON)
  (lock-threshold :FLOAT)
)

(defcfun ("ImGui_ResetMouseDragDeltaEx" reset-mouse-drag-delta-ex) :VOID
  (button MOUSEBUTTON)
)

(defcfun ("ImGui_GetMouseCursor" get-mouse-cursor) MOUSECURSOR)

(defcfun ("ImGui_SetMouseCursor" set-mouse-cursor) :VOID
  (cursor-type MOUSECURSOR)
)

(defcfun ("ImGui_SetNextFrameWantCaptureMouse" set-next-frame-want-capture-mouse) :VOID
  (want-capture-mouse :BOOL)
)

(defcfun ("ImGui_GetClipboardText" get-clipboard-text) :STRING)

(defcfun ("ImGui_SetClipboardText" set-clipboard-text) :VOID
  (text :STRING)
)

(defcfun ("ImGui_LoadIniSettingsFromDisk" load-ini-settings-from-disk) :VOID
  (ini-filename :STRING)
)

(defcfun ("ImGui_LoadIniSettingsFromMemory" load-ini-settings-from-memory) :VOID
  (ini-data :STRING)
  (ini-size :SIZE)
)

(defcfun ("ImGui_SaveIniSettingsToDisk" save-ini-settings-to-disk) :VOID
  (ini-filename :STRING)
)

(defcfun ("ImGui_SaveIniSettingsToMemory" save-ini-settings-to-memory) :STRING
  (out-ini-size :POINTER)
)

(defcfun ("ImGui_DebugTextEncoding" debug-text-encoding) :VOID
  (text :STRING)
)

(defcfun ("ImGui_DebugFlashStyleColor" debug-flash-style-color) :VOID
  (idx COL)
)

(defcfun ("ImGui_DebugStartItemPicker" debug-start-item-picker) :VOID)

(defcfun ("ImGui_DebugCheckVersionAndDataLayout" debug-check-version-and-data-layout) :BOOL
  (version-str :STRING)
  (sz-io :SIZE)
  (sz-style :SIZE)
  (sz-vec2 :SIZE)
  (sz-vec4 :SIZE)
  (sz-drawvert :SIZE)
  (sz-drawidx :SIZE)
)

(defcfun ("ImGui_DebugLog" debug-log) :VOID
  (fmt :STRING)
  &rest
)

(defcfun ("ImGui_DebugLogV" debug-log-v) :VOID
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGui_SetAllocatorFunctions" set-allocator-functions) :VOID
  (alloc-func MEMALLOCFUNC)
  (free-func MEMFREEFUNC)
  (user-data :POINTER)
)

(defcfun ("ImGui_GetAllocatorFunctions" get-allocator-functions) :VOID
  (p-alloc-func :POINTER)
  (p-free-func :POINTER)
  (p-user-data :POINTER)
)

(defcfun ("ImGui_MemAlloc" mem-alloc) :POINTER
  (size :SIZE)
)

(defcfun ("ImGui_MemFree" mem-free) :VOID
  (ptr :POINTER)
)

;; Manual helper function
(defcfun ("ImVector_Construct" vector-construct) :VOID
  (vector :POINTER)
)

;; Manual helper function
(defcfun ("ImVector_Destruct" vector-destruct) :VOID
  (vector :POINTER)
)

;; Manual helper function
(defcfun ("ImStr_FromCharStr" str-from-char-str) :POINTER
  (b :STRING)
)

(defcfun ("ImGuiStyle_ScaleAllSizes" style-scale-all-sizes) :VOID
  (self :POINTER)
  (scale-factor :FLOAT)
)

(defcfun ("ImGuiIO_AddKeyEvent" io-add-key-event) :VOID
  (self :POINTER)
  (key KEY)
  (down :BOOL)
)

(defcfun ("ImGuiIO_AddKeyAnalogEvent" io-add-key-analog-event) :VOID
  (self :POINTER)
  (key KEY)
  (down :BOOL)
  (v :FLOAT)
)

(defcfun ("ImGuiIO_AddMousePosEvent" io-add-mouse-pos-event) :VOID
  (self :POINTER)
  (x :FLOAT)
  (y :FLOAT)
)

(defcfun ("ImGuiIO_AddMouseButtonEvent" io-add-mouse-button-event) :VOID
  (self :POINTER)
  (button :INT)
  (down :BOOL)
)

(defcfun ("ImGuiIO_AddMouseWheelEvent" io-add-mouse-wheel-event) :VOID
  (self :POINTER)
  (wheel-x :FLOAT)
  (wheel-y :FLOAT)
)

(defcfun ("ImGuiIO_AddMouseSourceEvent" io-add-mouse-source-event) :VOID
  (self :POINTER)
  (source MOUSE-SOURCE)
)

(defcfun ("ImGuiIO_AddFocusEvent" io-add-focus-event) :VOID
  (self :POINTER)
  (focused :BOOL)
)

(defcfun ("ImGuiIO_AddInputCharacter" io-add-input-character) :VOID
  (self :POINTER)
  (c :UNSIGNED-INT)
)

(defcfun ("ImGuiIO_AddInputCharacterUTF16" io-add-input-character-utf16) :VOID
  (self :POINTER)
  (c WCHAR16)
)

(defcfun ("ImGuiIO_AddInputCharactersUTF8" io-add-input-characters-utf8) :VOID
  (self :POINTER)
  (str :STRING)
)

(defcfun ("ImGuiIO_SetKeyEventNativeDataEx" io-set-key-event-native-data-ex) :VOID
  (self :POINTER)
  (key KEY)
  (native-keycode :INT)
  (native-scancode :INT)
  (native-legacy-index :INT)
)

(defcfun ("ImGuiIO_SetAppAcceptingEvents" io-set-app-accepting-events) :VOID
  (self :POINTER)
  (accepting-events :BOOL)
)

(defcfun ("ImGuiIO_ClearEventsQueue" io-clear-events-queue) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiIO_ClearInputKeys" io-clear-input-keys) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiIO_ClearInputMouse" io-clear-input-mouse) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiInputTextCallbackData_DeleteChars" input-text-callback-data-delete-chars) :VOID
  (self :POINTER)
  (pos :INT)
  (bytes-count :INT)
)

(defcfun ("ImGuiInputTextCallbackData_InsertChars" input-text-callback-data-insert-chars) :VOID
  (self :POINTER)
  (pos :INT)
  (text :STRING)
  (text-end :STRING)
)

(defcfun ("ImGuiInputTextCallbackData_SelectAll" input-text-callback-data-select-all) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiInputTextCallbackData_ClearSelection" input-text-callback-data-clear-selection) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiInputTextCallbackData_HasSelection" input-text-callback-data-has-selection) :BOOL
  (self :POINTER)
)

(defcfun ("ImGuiPayload_Clear" payload-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiPayload_IsDataType" payload-is-data-type) :BOOL
  (self :POINTER)
  (type :STRING)
)

(defcfun ("ImGuiPayload_IsPreview" payload-is-preview) :BOOL
  (self :POINTER)
)

(defcfun ("ImGuiPayload_IsDelivery" payload-is-delivery) :BOOL
  (self :POINTER)
)

(defcfun ("ImGuiTextFilter_ImGuiTextRange_empty" text-filter-im-gui-text-range-empty) :BOOL
  (self :POINTER)
)

(defcfun ("ImGuiTextFilter_ImGuiTextRange_split" text-filter-im-gui-text-range-split) :VOID
  (self :POINTER)
  (separator :CHAR)
  (out :POINTER)
)

(defcfun ("ImGuiTextFilter_Draw" text-filter-draw) :BOOL
  (self :POINTER)
  (label :STRING)
  (width :FLOAT)
)

(defcfun ("ImGuiTextFilter_PassFilter" text-filter-pass-filter) :BOOL
  (self :POINTER)
  (text :STRING)
  (text-end :STRING)
)

(defcfun ("ImGuiTextFilter_Build" text-filter-build) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiTextFilter_Clear" text-filter-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiTextFilter_IsActive" text-filter-is-active) :BOOL
  (self :POINTER)
)

(defcfun ("ImGuiTextBuffer_begin" text-buffer-begin) :STRING
  (self :POINTER)
)

(defcfun ("ImGuiTextBuffer_end" text-buffer-end) :STRING
  (self :POINTER)
)

(defcfun ("ImGuiTextBuffer_size" text-buffer-size) :INT
  (self :POINTER)
)

(defcfun ("ImGuiTextBuffer_empty" text-buffer-empty) :BOOL
  (self :POINTER)
)

(defcfun ("ImGuiTextBuffer_clear" text-buffer-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiTextBuffer_resize" text-buffer-resize) :VOID
  (self :POINTER)
  (size :INT)
)

(defcfun ("ImGuiTextBuffer_reserve" text-buffer-reserve) :VOID
  (self :POINTER)
  (capacity :INT)
)

(defcfun ("ImGuiTextBuffer_c_str" text-buffer-c-str) :STRING
  (self :POINTER)
)

(defcfun ("ImGuiTextBuffer_append" text-buffer-append) :VOID
  (self :POINTER)
  (str :STRING)
  (str-end :STRING)
)

(defcfun ("ImGuiTextBuffer_appendf" text-buffer-appendf) :VOID
  (self :POINTER)
  (fmt :STRING)
  &rest
)

(defcfun ("ImGuiTextBuffer_appendfv" text-buffer-appendfv) :VOID
  (self :POINTER)
  (fmt :STRING)
  (args :POINTER)
)

(defcfun ("ImGuiStorage_Clear" storage-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiStorage_GetInt" storage-get-int) :INT
  (self :POINTER)
  (key ID)
  (default-val :INT)
)

(defcfun ("ImGuiStorage_SetInt" storage-set-int) :VOID
  (self :POINTER)
  (key ID)
  (val :INT)
)

(defcfun ("ImGuiStorage_GetBool" storage-get-bool) :BOOL
  (self :POINTER)
  (key ID)
  (default-val :BOOL)
)

(defcfun ("ImGuiStorage_SetBool" storage-set-bool) :VOID
  (self :POINTER)
  (key ID)
  (val :BOOL)
)

(defcfun ("ImGuiStorage_GetFloat" storage-get-float) :FLOAT
  (self :POINTER)
  (key ID)
  (default-val :FLOAT)
)

(defcfun ("ImGuiStorage_SetFloat" storage-set-float) :VOID
  (self :POINTER)
  (key ID)
  (val :FLOAT)
)

(defcfun ("ImGuiStorage_GetVoidPtr" storage-get-void-ptr) :POINTER
  (self :POINTER)
  (key ID)
)

(defcfun ("ImGuiStorage_SetVoidPtr" storage-set-void-ptr) :VOID
  (self :POINTER)
  (key ID)
  (val :POINTER)
)

(defcfun ("ImGuiStorage_GetIntRef" storage-get-int-ref) :POINTER
  (self :POINTER)
  (key ID)
  (default-val :INT)
)

(defcfun ("ImGuiStorage_GetBoolRef" storage-get-bool-ref) :POINTER
  (self :POINTER)
  (key ID)
  (default-val :BOOL)
)

(defcfun ("ImGuiStorage_GetFloatRef" storage-get-float-ref) :POINTER
  (self :POINTER)
  (key ID)
  (default-val :FLOAT)
)

(defcfun ("ImGuiStorage_GetVoidPtrRef" storage-get-void-ptr-ref) :POINTER
  (self :POINTER)
  (key ID)
  (default-val :POINTER)
)

(defcfun ("ImGuiStorage_BuildSortByKey" storage-build-sort-by-key) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiStorage_SetAllInt" storage-set-all-int) :VOID
  (self :POINTER)
  (val :INT)
)

(defcfun ("ImGuiListClipper_Begin" list-clipper-begin) :VOID
  (self :POINTER)
  (items-count :INT)
  (items-height :FLOAT)
)

(defcfun ("ImGuiListClipper_End" list-clipper-end) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiListClipper_Step" list-clipper-step) :BOOL
  (self :POINTER)
)

(defcfun ("ImGuiListClipper_IncludeItemByIndex" list-clipper-include-item-by-index) :VOID
  (self :POINTER)
  (item-index :INT)
)

(defcfun ("ImGuiListClipper_IncludeItemsByIndex" list-clipper-include-items-by-index) :VOID
  (self :POINTER)
  (item-begin :INT)
  (item-end :INT)
)

(defcfun ("ImGuiListClipper_SeekCursorForItem" list-clipper-seek-cursor-for-item) :VOID
  (self :POINTER)
  (item-index :INT)
)

(defcfun ("ImColor_SetHSV" color-set-hsv) :VOID
  (self :POINTER)
  (h :FLOAT)
  (s :FLOAT)
  (v :FLOAT)
  (a :FLOAT)
)

(defcfun ("ImColor_HSV" color-hsv) COLOR
  (h :FLOAT)
  (s :FLOAT)
  (v :FLOAT)
  (a :FLOAT)
)

(defcfun ("ImGuiSelectionBasicStorage_ApplyRequests" selection-basic-storage-apply-requests) :VOID
  (self :POINTER)
  (ms-io :POINTER)
)

(defcfun ("ImGuiSelectionBasicStorage_Contains" selection-basic-storage-contains) :BOOL
  (self :POINTER)
  (id ID)
)

(defcfun ("ImGuiSelectionBasicStorage_Clear" selection-basic-storage-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiSelectionBasicStorage_Swap" selection-basic-storage-swap) :VOID
  (self :POINTER)
  (r :POINTER)
)

(defcfun ("ImGuiSelectionBasicStorage_SetItemSelected" selection-basic-storage-set-item-selected) :VOID
  (self :POINTER)
  (id ID)
  (selected :BOOL)
)

(defcfun ("ImGuiSelectionBasicStorage_GetNextSelectedItem" selection-basic-storage-get-next-selected-item) :BOOL
  (self :POINTER)
  (opaque-it :POINTER)
  (out-id :POINTER)
)

(defcfun ("ImGuiSelectionBasicStorage_GetStorageIdFromIndex" selection-basic-storage-get-storage-id-from-index) ID
  (self :POINTER)
  (idx :INT)
)

(defcfun ("ImGuiSelectionExternalStorage_ApplyRequests" selection-external-storage-apply-requests) :VOID
  (self :POINTER)
  (ms-io :POINTER)
)

(defcfun ("ImDrawCmd_GetTexID" draw-cmd-get-tex-id) TEXTUREID
  (self :POINTER)
)

(defcfun ("ImDrawListSplitter_Clear" draw-list-splitter-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawListSplitter_ClearFreeMemory" draw-list-splitter-clear-free-memory) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawListSplitter_Split" draw-list-splitter-split) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (count :INT)
)

(defcfun ("ImDrawListSplitter_Merge" draw-list-splitter-merge) :VOID
  (self :POINTER)
  (draw-list :POINTER)
)

(defcfun ("ImDrawListSplitter_SetCurrentChannel" draw-list-splitter-set-current-channel) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (channel-idx :INT)
)

(defcfun ("ImDrawList_PushClipRect" draw-list-push-clip-rect) :VOID
  (self :POINTER)
  (clip-rect-min VEC2)
  (clip-rect-max VEC2)
  (intersect-with-current-clip-rect :BOOL)
)

(defcfun ("ImDrawList_PushClipRectFullScreen" draw-list-push-clip-rect-full-screen) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList_PopClipRect" draw-list-pop-clip-rect) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList_PushTexture" draw-list-push-texture) :VOID
  (self :POINTER)
  (tex-ref TEXTUREREF)
)

(defcfun ("ImDrawList_PopTexture" draw-list-pop-texture) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList_GetClipRectMin" draw-list-get-clip-rect-min) VEC2
  (self :POINTER)
)

(defcfun ("ImDrawList_GetClipRectMax" draw-list-get-clip-rect-max) VEC2
  (self :POINTER)
)

(defcfun ("ImDrawList_AddLineEx" draw-list-add-line-ex) :VOID
  (self :POINTER)
  (p1 VEC2)
  (p2 VEC2)
  (col U32)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddRectEx" draw-list-add-rect-ex) :VOID
  (self :POINTER)
  (p-min VEC2)
  (p-max VEC2)
  (col U32)
  (rounding :FLOAT)
  (flags DRAWFLAGS)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddRectFilledEx" draw-list-add-rect-filled-ex) :VOID
  (self :POINTER)
  (p-min VEC2)
  (p-max VEC2)
  (col U32)
  (rounding :FLOAT)
  (flags DRAWFLAGS)
)

(defcfun ("ImDrawList_AddRectFilledMultiColor" draw-list-add-rect-filled-multi-color) :VOID
  (self :POINTER)
  (p-min VEC2)
  (p-max VEC2)
  (col-upr-left U32)
  (col-upr-right U32)
  (col-bot-right U32)
  (col-bot-left U32)
)

(defcfun ("ImDrawList_AddQuadEx" draw-list-add-quad-ex) :VOID
  (self :POINTER)
  (p1 VEC2)
  (p2 VEC2)
  (p3 VEC2)
  (p4 VEC2)
  (col U32)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddQuadFilled" draw-list-add-quad-filled) :VOID
  (self :POINTER)
  (p1 VEC2)
  (p2 VEC2)
  (p3 VEC2)
  (p4 VEC2)
  (col U32)
)

(defcfun ("ImDrawList_AddTriangleEx" draw-list-add-triangle-ex) :VOID
  (self :POINTER)
  (p1 VEC2)
  (p2 VEC2)
  (p3 VEC2)
  (col U32)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddTriangleFilled" draw-list-add-triangle-filled) :VOID
  (self :POINTER)
  (p1 VEC2)
  (p2 VEC2)
  (p3 VEC2)
  (col U32)
)

(defcfun ("ImDrawList_AddCircleEx" draw-list-add-circle-ex) :VOID
  (self :POINTER)
  (center VEC2)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddCircleFilled" draw-list-add-circle-filled) :VOID
  (self :POINTER)
  (center VEC2)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
)

(defcfun ("ImDrawList_AddNgonEx" draw-list-add-ngon-ex) :VOID
  (self :POINTER)
  (center VEC2)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddNgonFilled" draw-list-add-ngon-filled) :VOID
  (self :POINTER)
  (center VEC2)
  (radius :FLOAT)
  (col U32)
  (num-segments :INT)
)

(defcfun ("ImDrawList_AddEllipseEx" draw-list-add-ellipse-ex) :VOID
  (self :POINTER)
  (center VEC2)
  (radius VEC2)
  (col U32)
  (rot :FLOAT)
  (num-segments :INT)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddEllipseFilledEx" draw-list-add-ellipse-filled-ex) :VOID
  (self :POINTER)
  (center VEC2)
  (radius VEC2)
  (col U32)
  (rot :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawList_AddTextEx" draw-list-add-text-ex) :VOID
  (self :POINTER)
  (pos VEC2)
  (col U32)
  (text-begin :STRING)
  (text-end :STRING)
)

(defcfun ("ImDrawList_AddTextImFontPtrEx" draw-list-add-text-im-font-ptr-ex) :VOID
  (self :POINTER)
  (font :POINTER)
  (font-size :FLOAT)
  (pos VEC2)
  (col U32)
  (text-begin :STRING)
  (text-end :STRING)
  (wrap-width :FLOAT)
  (cpu-fine-clip-rect :POINTER)
)

(defcfun ("ImDrawList_AddBezierCubic" draw-list-add-bezier-cubic) :VOID
  (self :POINTER)
  (p1 VEC2)
  (p2 VEC2)
  (p3 VEC2)
  (p4 VEC2)
  (col U32)
  (thickness :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawList_AddBezierQuadratic" draw-list-add-bezier-quadratic) :VOID
  (self :POINTER)
  (p1 VEC2)
  (p2 VEC2)
  (p3 VEC2)
  (col U32)
  (thickness :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawList_AddPolyline" draw-list-add-polyline) :VOID
  (self :POINTER)
  (points :POINTER)
  (num-points :INT)
  (col U32)
  (flags DRAWFLAGS)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_AddConvexPolyFilled" draw-list-add-convex-poly-filled) :VOID
  (self :POINTER)
  (points :POINTER)
  (num-points :INT)
  (col U32)
)

(defcfun ("ImDrawList_AddConcavePolyFilled" draw-list-add-concave-poly-filled) :VOID
  (self :POINTER)
  (points :POINTER)
  (num-points :INT)
  (col U32)
)

(defcfun ("ImDrawList_AddImageEx" draw-list-add-image-ex) :VOID
  (self :POINTER)
  (tex-ref TEXTUREREF)
  (p-min VEC2)
  (p-max VEC2)
  (uv-min VEC2)
  (uv-max VEC2)
  (col U32)
)

(defcfun ("ImDrawList_AddImageQuadEx" draw-list-add-image-quad-ex) :VOID
  (self :POINTER)
  (tex-ref TEXTUREREF)
  (p1 VEC2)
  (p2 VEC2)
  (p3 VEC2)
  (p4 VEC2)
  (uv1 VEC2)
  (uv2 VEC2)
  (uv3 VEC2)
  (uv4 VEC2)
  (col U32)
)

(defcfun ("ImDrawList_AddImageRounded" draw-list-add-image-rounded) :VOID
  (self :POINTER)
  (tex-ref TEXTUREREF)
  (p-min VEC2)
  (p-max VEC2)
  (uv-min VEC2)
  (uv-max VEC2)
  (col U32)
  (rounding :FLOAT)
  (flags DRAWFLAGS)
)

(defcfun ("ImDrawList_PathClear" draw-list-path-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList_PathLineTo" draw-list-path-line-to) :VOID
  (self :POINTER)
  (pos VEC2)
)

(defcfun ("ImDrawList_PathLineToMergeDuplicate" draw-list-path-line-to-merge-duplicate) :VOID
  (self :POINTER)
  (pos VEC2)
)

(defcfun ("ImDrawList_PathFillConvex" draw-list-path-fill-convex) :VOID
  (self :POINTER)
  (col U32)
)

(defcfun ("ImDrawList_PathFillConcave" draw-list-path-fill-concave) :VOID
  (self :POINTER)
  (col U32)
)

(defcfun ("ImDrawList_PathStroke" draw-list-path-stroke) :VOID
  (self :POINTER)
  (col U32)
  (flags DRAWFLAGS)
  (thickness :FLOAT)
)

(defcfun ("ImDrawList_PathArcTo" draw-list-path-arc-to) :VOID
  (self :POINTER)
  (center VEC2)
  (radius :FLOAT)
  (a-min :FLOAT)
  (a-max :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawList_PathArcToFast" draw-list-path-arc-to-fast) :VOID
  (self :POINTER)
  (center VEC2)
  (radius :FLOAT)
  (a-min-of-12 :INT)
  (a-max-of-12 :INT)
)

(defcfun ("ImDrawList_PathEllipticalArcToEx" draw-list-path-elliptical-arc-to-ex) :VOID
  (self :POINTER)
  (center VEC2)
  (radius VEC2)
  (rot :FLOAT)
  (a-min :FLOAT)
  (a-max :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawList_PathBezierCubicCurveTo" draw-list-path-bezier-cubic-curve-to) :VOID
  (self :POINTER)
  (p2 VEC2)
  (p3 VEC2)
  (p4 VEC2)
  (num-segments :INT)
)

(defcfun ("ImDrawList_PathBezierQuadraticCurveTo" draw-list-path-bezier-quadratic-curve-to) :VOID
  (self :POINTER)
  (p2 VEC2)
  (p3 VEC2)
  (num-segments :INT)
)

(defcfun ("ImDrawList_PathRect" draw-list-path-rect) :VOID
  (self :POINTER)
  (rect-min VEC2)
  (rect-max VEC2)
  (rounding :FLOAT)
  (flags DRAWFLAGS)
)

(defcfun ("ImDrawList_AddCallbackEx" draw-list-add-callback-ex) :VOID
  (self :POINTER)
  (callback DRAWCALLBACK)
  (userdata :POINTER)
  (userdata-size :SIZE)
)

(defcfun ("ImDrawList_AddDrawCmd" draw-list-add-draw-cmd) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList_CloneOutput" draw-list-clone-output) :POINTER
  (self :POINTER)
)

(defcfun ("ImDrawList_ChannelsSplit" draw-list-channels-split) :VOID
  (self :POINTER)
  (count :INT)
)

(defcfun ("ImDrawList_ChannelsMerge" draw-list-channels-merge) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList_ChannelsSetCurrent" draw-list-channels-set-current) :VOID
  (self :POINTER)
  (n :INT)
)

(defcfun ("ImDrawList_PrimReserve" draw-list-prim-reserve) :VOID
  (self :POINTER)
  (idx-count :INT)
  (vtx-count :INT)
)

(defcfun ("ImDrawList_PrimUnreserve" draw-list-prim-unreserve) :VOID
  (self :POINTER)
  (idx-count :INT)
  (vtx-count :INT)
)

(defcfun ("ImDrawList_PrimRect" draw-list-prim-rect) :VOID
  (self :POINTER)
  (a VEC2)
  (b VEC2)
  (col U32)
)

(defcfun ("ImDrawList_PrimRectUV" draw-list-prim-rect-uv) :VOID
  (self :POINTER)
  (a VEC2)
  (b VEC2)
  (uv-a VEC2)
  (uv-b VEC2)
  (col U32)
)

(defcfun ("ImDrawList_PrimQuadUV" draw-list-prim-quad-uv) :VOID
  (self :POINTER)
  (a VEC2)
  (b VEC2)
  (c VEC2)
  (d VEC2)
  (uv-a VEC2)
  (uv-b VEC2)
  (uv-c VEC2)
  (uv-d VEC2)
  (col U32)
)

(defcfun ("ImDrawList_PrimWriteVtx" draw-list-prim-write-vtx) :VOID
  (self :POINTER)
  (pos VEC2)
  (uv VEC2)
  (col U32)
)

(defcfun ("ImDrawList_PrimWriteIdx" draw-list-prim-write-idx) :VOID
  (self :POINTER)
  (idx DRAWIDX)
)

(defcfun ("ImDrawList_PrimVtx" draw-list-prim-vtx) :VOID
  (self :POINTER)
  (pos VEC2)
  (uv VEC2)
  (col U32)
)

(defcfun ("ImDrawList_PushTextureID" draw-list-push-texture-id) :VOID
  (self :POINTER)
  (tex-ref TEXTUREREF)
)

(defcfun ("ImDrawList_PopTextureID" draw-list-pop-texture-id) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList__SetDrawListSharedData" draw-list--set-draw-list-shared-data) :VOID
  (self :POINTER)
  (data :POINTER)
)

(defcfun ("ImDrawList__ResetForNewFrame" draw-list--reset-for-new-frame) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList__ClearFreeMemory" draw-list--clear-free-memory) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList__PopUnusedDrawCmd" draw-list--pop-unused-draw-cmd) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList__TryMergeDrawCmds" draw-list--try-merge-draw-cmds) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList__OnChangedClipRect" draw-list--on-changed-clip-rect) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList__OnChangedTexture" draw-list--on-changed-texture) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList__OnChangedVtxOffset" draw-list--on-changed-vtx-offset) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawList__SetTexture" draw-list--set-texture) :VOID
  (self :POINTER)
  (tex-ref TEXTUREREF)
)

(defcfun ("ImDrawList__CalcCircleAutoSegmentCount" draw-list--calc-circle-auto-segment-count) :INT
  (self :POINTER)
  (radius :FLOAT)
)

(defcfun ("ImDrawList__PathArcToFastEx" draw-list--path-arc-to-fast-ex) :VOID
  (self :POINTER)
  (center VEC2)
  (radius :FLOAT)
  (a-min-sample :INT)
  (a-max-sample :INT)
  (a-step :INT)
)

(defcfun ("ImDrawList__PathArcToN" draw-list--path-arc-to-n) :VOID
  (self :POINTER)
  (center VEC2)
  (radius :FLOAT)
  (a-min :FLOAT)
  (a-max :FLOAT)
  (num-segments :INT)
)

(defcfun ("ImDrawData_Clear" draw-data-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawData_AddDrawList" draw-data-add-draw-list) :VOID
  (self :POINTER)
  (draw-list :POINTER)
)

(defcfun ("ImDrawData_DeIndexAllBuffers" draw-data-de-index-all-buffers) :VOID
  (self :POINTER)
)

(defcfun ("ImDrawData_ScaleClipRects" draw-data-scale-clip-rects) :VOID
  (self :POINTER)
  (fb-scale VEC2)
)

(defcfun ("ImTextureData_Create" texture-data-create) :VOID
  (self :POINTER)
  (format TEXTURE-FORMAT)
  (w :INT)
  (h :INT)
)

(defcfun ("ImTextureData_DestroyPixels" texture-data-destroy-pixels) :VOID
  (self :POINTER)
)

(defcfun ("ImTextureData_GetPixels" texture-data-get-pixels) :POINTER
  (self :POINTER)
)

(defcfun ("ImTextureData_GetPixelsAt" texture-data-get-pixels-at) :POINTER
  (self :POINTER)
  (x :INT)
  (y :INT)
)

(defcfun ("ImTextureData_GetSizeInBytes" texture-data-get-size-in-bytes) :INT
  (self :POINTER)
)

(defcfun ("ImTextureData_GetPitch" texture-data-get-pitch) :INT
  (self :POINTER)
)

(defcfun ("ImTextureData_GetTexRef" texture-data-get-tex-ref) TEXTUREREF
  (self :POINTER)
)

(defcfun ("ImTextureData_GetTexID" texture-data-get-tex-id) TEXTUREID
  (self :POINTER)
)

(defcfun ("ImTextureData_SetTexID" texture-data-set-tex-id) :VOID
  (self :POINTER)
  (tex-id TEXTUREID)
)

(defcfun ("ImTextureData_SetStatus" texture-data-set-status) :VOID
  (self :POINTER)
  (status TEXTURE-STATUS)
)

(defcfun ("ImFontGlyphRangesBuilder_Clear" font-glyph-ranges-builder-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImFontGlyphRangesBuilder_GetBit" font-glyph-ranges-builder-get-bit) :BOOL
  (self :POINTER)
  (n :SIZE)
)

(defcfun ("ImFontGlyphRangesBuilder_SetBit" font-glyph-ranges-builder-set-bit) :VOID
  (self :POINTER)
  (n :SIZE)
)

(defcfun ("ImFontGlyphRangesBuilder_AddChar" font-glyph-ranges-builder-add-char) :VOID
  (self :POINTER)
  (c WCHAR)
)

(defcfun ("ImFontGlyphRangesBuilder_AddText" font-glyph-ranges-builder-add-text) :VOID
  (self :POINTER)
  (text :STRING)
  (text-end :STRING)
)

(defcfun ("ImFontGlyphRangesBuilder_AddRanges" font-glyph-ranges-builder-add-ranges) :VOID
  (self :POINTER)
  (ranges :POINTER)
)

(defcfun ("ImFontGlyphRangesBuilder_BuildRanges" font-glyph-ranges-builder-build-ranges) :VOID
  (self :POINTER)
  (out-ranges :POINTER)
)

(defcfun ("ImFontAtlas_AddFont" font-atlas-add-font) :POINTER
  (self :POINTER)
  (font-cfg :POINTER)
)

(defcfun ("ImFontAtlas_AddFontDefault" font-atlas-add-font-default) :POINTER
  (self :POINTER)
  (font-cfg :POINTER)
)

(defcfun ("ImFontAtlas_AddFontFromFileTTF" font-atlas-add-font-from-file-ttf) :POINTER
  (self :POINTER)
  (filename :STRING)
  (size-pixels :FLOAT)
  (font-cfg :POINTER)
  (glyph-ranges :POINTER)
)

(defcfun ("ImFontAtlas_AddFontFromMemoryTTF" font-atlas-add-font-from-memory-ttf) :POINTER
  (self :POINTER)
  (font-data :POINTER)
  (font-data-size :INT)
  (size-pixels :FLOAT)
  (font-cfg :POINTER)
  (glyph-ranges :POINTER)
)

(defcfun ("ImFontAtlas_AddFontFromMemoryCompressedTTF" font-atlas-add-font-from-memory-compressed-ttf) :POINTER
  (self :POINTER)
  (compressed-font-data :POINTER)
  (compressed-font-data-size :INT)
  (size-pixels :FLOAT)
  (font-cfg :POINTER)
  (glyph-ranges :POINTER)
)

(defcfun ("ImFontAtlas_AddFontFromMemoryCompressedBase85TTF" font-atlas-add-font-from-memory-compressed-base85ttf) :POINTER
  (self :POINTER)
  (compressed-font-data-base85 :STRING)
  (size-pixels :FLOAT)
  (font-cfg :POINTER)
  (glyph-ranges :POINTER)
)

(defcfun ("ImFontAtlas_RemoveFont" font-atlas-remove-font) :VOID
  (self :POINTER)
  (font :POINTER)
)

(defcfun ("ImFontAtlas_Clear" font-atlas-clear) :VOID
  (self :POINTER)
)

(defcfun ("ImFontAtlas_CompactCache" font-atlas-compact-cache) :VOID
  (self :POINTER)
)

(defcfun ("ImFontAtlas_SetFontLoader" font-atlas-set-font-loader) :VOID
  (self :POINTER)
  (font-loader :POINTER)
)

(defcfun ("ImFontAtlas_ClearInputData" font-atlas-clear-input-data) :VOID
  (self :POINTER)
)

(defcfun ("ImFontAtlas_ClearFonts" font-atlas-clear-fonts) :VOID
  (self :POINTER)
)

(defcfun ("ImFontAtlas_ClearTexData" font-atlas-clear-tex-data) :VOID
  (self :POINTER)
)

(defcfun ("ImFontAtlas_Build" font-atlas-build) :BOOL
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetTexDataAsAlpha8" font-atlas-get-tex-data-as-alpha8) :VOID
  (self :POINTER)
  (out-pixels :POINTER)
  (out-width :POINTER)
  (out-height :POINTER)
  (out-bytes-per-pixel :POINTER)
)

(defcfun ("ImFontAtlas_GetTexDataAsRGBA32" font-atlas-get-tex-data-as-rgba32) :VOID
  (self :POINTER)
  (out-pixels :POINTER)
  (out-width :POINTER)
  (out-height :POINTER)
  (out-bytes-per-pixel :POINTER)
)

(defcfun ("ImFontAtlas_SetTexID" font-atlas-set-tex-id) :VOID
  (self :POINTER)
  (id TEXTUREID)
)

(defcfun ("ImFontAtlas_SetTexIDImTextureRef" font-atlas-set-tex-idim-texture-ref) :VOID
  (self :POINTER)
  (id TEXTUREREF)
)

(defcfun ("ImFontAtlas_IsBuilt" font-atlas-is-built) :BOOL
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetGlyphRangesDefault" font-atlas-get-glyph-ranges-default) :POINTER
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetGlyphRangesGreek" font-atlas-get-glyph-ranges-greek) :POINTER
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetGlyphRangesKorean" font-atlas-get-glyph-ranges-korean) :POINTER
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetGlyphRangesJapanese" font-atlas-get-glyph-ranges-japanese) :POINTER
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetGlyphRangesChineseFull" font-atlas-get-glyph-ranges-chinese-full) :POINTER
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon" font-atlas-get-glyph-ranges-chinese-simplified-common) :POINTER
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetGlyphRangesCyrillic" font-atlas-get-glyph-ranges-cyrillic) :POINTER
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetGlyphRangesThai" font-atlas-get-glyph-ranges-thai) :POINTER
  (self :POINTER)
)

(defcfun ("ImFontAtlas_GetGlyphRangesVietnamese" font-atlas-get-glyph-ranges-vietnamese) :POINTER
  (self :POINTER)
)

(defcfun ("ImFontAtlas_AddCustomRect" font-atlas-add-custom-rect) FONTATLASRECTID
  (self :POINTER)
  (width :INT)
  (height :INT)
  (out-r :POINTER)
)

(defcfun ("ImFontAtlas_RemoveCustomRect" font-atlas-remove-custom-rect) :VOID
  (self :POINTER)
  (id FONTATLASRECTID)
)

(defcfun ("ImFontAtlas_GetCustomRect" font-atlas-get-custom-rect) :BOOL
  (self :POINTER)
  (id FONTATLASRECTID)
  (out-r :POINTER)
)

(defcfun ("ImFontAtlas_AddCustomRectRegular" font-atlas-add-custom-rect-regular) FONTATLASRECTID
  (self :POINTER)
  (w :INT)
  (h :INT)
)

(defcfun ("ImFontAtlas_GetCustomRectByIndex" font-atlas-get-custom-rect-by-index) :POINTER
  (self :POINTER)
  (id FONTATLASRECTID)
)

(defcfun ("ImFontAtlas_CalcCustomRectUV" font-atlas-calc-custom-rect-uv) :VOID
  (self :POINTER)
  (r :POINTER)
  (out-uv-min :POINTER)
  (out-uv-max :POINTER)
)

(defcfun ("ImFontAtlas_AddCustomRectFontGlyph" font-atlas-add-custom-rect-font-glyph) FONTATLASRECTID
  (self :POINTER)
  (font :POINTER)
  (codepoint WCHAR)
  (w :INT)
  (h :INT)
  (advance-x :FLOAT)
  (offset VEC2)
)

(defcfun ("ImFontAtlas_AddCustomRectFontGlyphForSize" font-atlas-add-custom-rect-font-glyph-for-size) FONTATLASRECTID
  (self :POINTER)
  (font :POINTER)
  (font-size :FLOAT)
  (codepoint WCHAR)
  (w :INT)
  (h :INT)
  (advance-x :FLOAT)
  (offset VEC2)
)

(defcfun ("ImFontBaked_ClearOutputData" font-baked-clear-output-data) :VOID
  (self :POINTER)
)

(defcfun ("ImFontBaked_FindGlyph" font-baked-find-glyph) :POINTER
  (self :POINTER)
  (c WCHAR)
)

(defcfun ("ImFontBaked_FindGlyphNoFallback" font-baked-find-glyph-no-fallback) :POINTER
  (self :POINTER)
  (c WCHAR)
)

(defcfun ("ImFontBaked_GetCharAdvance" font-baked-get-char-advance) :FLOAT
  (self :POINTER)
  (c WCHAR)
)

(defcfun ("ImFontBaked_IsGlyphLoaded" font-baked-is-glyph-loaded) :BOOL
  (self :POINTER)
  (c WCHAR)
)

(defcfun ("ImFont_IsGlyphInFont" font-is-glyph-in-font) :BOOL
  (self :POINTER)
  (c WCHAR)
)

(defcfun ("ImFont_IsLoaded" font-is-loaded) :BOOL
  (self :POINTER)
)

(defcfun ("ImFont_GetDebugName" font-get-debug-name) :STRING
  (self :POINTER)
)

(defcfun ("ImFont_GetFontBakedEx" font-get-font-baked-ex) :POINTER
  (self :POINTER)
  (font-size :FLOAT)
  (density :FLOAT)
)

(defcfun ("ImFont_CalcTextSizeAEx" font-calc-text-size-aex) VEC2
  (self :POINTER)
  (size :FLOAT)
  (max-width :FLOAT)
  (wrap-width :FLOAT)
  (text-begin :STRING)
  (text-end :STRING)
  (out-remaining :POINTER)
)

(defcfun ("ImFont_CalcWordWrapPosition" font-calc-word-wrap-position) :STRING
  (self :POINTER)
  (size :FLOAT)
  (text :STRING)
  (text-end :STRING)
  (wrap-width :FLOAT)
)

(defcfun ("ImFont_RenderCharEx" font-render-char-ex) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (size :FLOAT)
  (pos VEC2)
  (col U32)
  (c WCHAR)
  (cpu-fine-clip :POINTER)
)

(defcfun ("ImFont_RenderText" font-render-text) :VOID
  (self :POINTER)
  (draw-list :POINTER)
  (size :FLOAT)
  (pos VEC2)
  (col U32)
  (clip-rect VEC4)
  (text-begin :STRING)
  (text-end :STRING)
  (wrap-width :FLOAT)
  (flags DRAWTEXTFLAGS)
)

(defcfun ("ImFont_CalcWordWrapPositionA" font-calc-word-wrap-position-a) :STRING
  (self :POINTER)
  (scale :FLOAT)
  (text :STRING)
  (text-end :STRING)
  (wrap-width :FLOAT)
)

(defcfun ("ImFont_ClearOutputData" font-clear-output-data) :VOID
  (self :POINTER)
)

(defcfun ("ImFont_AddRemapChar" font-add-remap-char) :VOID
  (self :POINTER)
  (from-codepoint WCHAR)
  (to-codepoint WCHAR)
)

(defcfun ("ImFont_IsGlyphRangeUnused" font-is-glyph-range-unused) :BOOL
  (self :POINTER)
  (c-begin :UNSIGNED-INT)
  (c-last :UNSIGNED-INT)
)

(defcfun ("ImGuiViewport_GetCenter" viewport-get-center) VEC2
  (self :POINTER)
)

(defcfun ("ImGuiViewport_GetWorkCenter" viewport-get-work-center) VEC2
  (self :POINTER)
)

(defcfun ("ImGuiPlatformIO_ClearPlatformHandlers" platform-io-clear-platform-handlers) :VOID
  (self :POINTER)
)

(defcfun ("ImGuiPlatformIO_ClearRendererHandlers" platform-io-clear-renderer-handlers) :VOID
  (self :POINTER)
)

(defcfun ("ImGui_PushFont" push-font) :VOID
  (font :POINTER)
)

(defcfun ("ImGui_SetWindowFontScale" set-window-font-scale) :VOID
  (scale :FLOAT)
)

(defcfun ("ImGui_ImageImVec4" image-im-vec4) :VOID
  (tex-ref TEXTUREREF)
  (image-size VEC2)
  (uv0 VEC2)
  (uv1 VEC2)
  (tint-col VEC4)
  (border-col VEC4)
)

(defcfun ("ImGui_PushButtonRepeat" push-button-repeat) :VOID
  (repeat :BOOL)
)

(defcfun ("ImGui_PopButtonRepeat" pop-button-repeat) :VOID)

(defcfun ("ImGui_PushTabStop" push-tab-stop) :VOID
  (tab-stop :BOOL)
)

(defcfun ("ImGui_PopTabStop" pop-tab-stop) :VOID)

(defcfun ("ImGui_GetContentRegionMax" get-content-region-max) VEC2)

(defcfun ("ImGui_GetWindowContentRegionMin" get-window-content-region-min) VEC2)

(defcfun ("ImGui_GetWindowContentRegionMax" get-window-content-region-max) VEC2)

(defcfun ("ImGui_BeginChildFrameEx" begin-child-frame-ex) :BOOL
  (id ID)
  (size VEC2)
  (window-flags WINDOWFLAGS)
)

(defcfun ("ImGui_EndChildFrame" end-child-frame) :VOID)

(defcfun ("ImGui_ShowStackToolWindow" show-stack-tool-window) :VOID
  (p-open :POINTER)
)

(defcfun ("ImGui_ComboObsoleteEx" combo-obsolete-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (old-callback :POINTER)
  (user-data :POINTER)
  (items-count :INT)
  (popup-max-height-in-items :INT)
)

(defcfun ("ImGui_ListBoxObsoleteEx" list-box-obsolete-ex) :BOOL
  (label :STRING)
  (current-item :POINTER)
  (old-callback :POINTER)
  (user-data :POINTER)
  (items-count :INT)
  (height-in-items :INT)
)


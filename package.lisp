;;;; package.lisp

(defpackage #:cl-dear-imgui
  (:use #:cl #:cffi))

(defpackage #:cl-dear-imgui/ui
  (:use #:cl #:cffi)
  (:local-nicknames (#:imgui #:cl-dear-imgui))
  (:export #:make-ui

           #:push-compose-task
           #:with-ui-access
           #:compose-ui
           #:root-panel

           #:defpanel
           #:find-element
           #:hiddenp
           #:minimizedp
           #:on-close
           #:on-minimize
           #:on-restore
           #:on-move
           #:update-panel-position
           #:panel-position
           #:with-panel-position
           #:update-panel-size
           #:with-panel-dimensions
           #:panel-size
           #:add-panel
           #:remove-panel
           #:remove-all-panels
           #:minimize-panel
           #:restore-panel

           #:adopt

           #:name-of
           #:vertical-layout
           #:horizontal-layout
           #:button
           #:label
           #:text-edit
           #:combo-box
           #:color-box
           #:spacing
           #:color-picker
           #:float-property
           #:radio
           #:activated
           #:radio-group
           #:active-radio-button-of
           #:check-box
           #:checked
           #:notebook
           #:tab

           #:styled-group

           #:scroll-area

           #:make-button
           #:make-label
           #:make-spacing
           #:make-check-box
           #:make-combo-box
           #:make-color-box
           #:make-color-picker
           #:make-float-property
           #:make-radio
           #:make-radio-group
           #:make-vertical-layout
           #:make-horizontal-layout
           #:make-notebook
           #:make-tab
           #:make-scroll-area
           #:make-styled-group
           #:make-text-edit
           #:update-area-scroll-position
           #:with-area-scroll-position
           #:area-scroll-position

           #:text-of

           #:list-select
           #:list-select-text-item
           #:item-name-of
           #:item-selected-p
           #:select-item
           #:add-item
           #:clear

           #:menu-bar

           #:hide-widget
           #:show-widget))

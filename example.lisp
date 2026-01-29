;;;; example.lisp
;;;; Example usage of cl-dear-imgui with the CLOS wrapper

(ql:quickload :cl-dear-imgui)

(defpackage #:cl-dear-imgui-example
  (:use #:cl)
  (:local-nicknames (#:imgui #:cl-dear-imgui)))

(in-package #:cl-dear-imgui-example)

;;; Example 1: Basic window with widgets
(defun example-basic ()
  "Demonstrates basic ImGui usage with the wrapper."
  (imgui:initialize)

  (let ((counter 0)
        (slider-value 0.5)
        (text-buffer "Hello")
        (checkbox-state t)
        (color (imgui:make-color 0.5 0.3 0.8 1.0)))

    ;; Main loop (simplified - normally you'd integrate with your render loop)
    (loop repeat 100 do
      (imgui:new-frame)

      ;; Main window with automatic cleanup
      (imgui:with-window ("Example Window")
        ;; Text
        (imgui:text "Hello from Common Lisp!")
        (imgui:separator)

        ;; Button
        (when (imgui:button "Click me!" 120 30)
          (incf counter)
          (format t "Button clicked ~D times!~%" counter))

        (imgui:same-line)
        (imgui:text (format nil "Counter: ~D" counter))

        ;; Slider
        (setf slider-value
              (imgui:slider-float-simple "Slider" slider-value 0.0 1.0))

        ;; Checkbox
        (setf checkbox-state
              (imgui:checkbox-simple "Checkbox" checkbox-state))

        ;; Color editor
        (setf color
              (imgui:color-edit-simple "Color" color)))

      (imgui:render))

    (imgui:shutdown)))

;;; Example 2: Menu bars and popups
(defun example-menus ()
  "Demonstrates menu bars and popups."
  (imgui:initialize)

  (let ((show-popup nil))
    (loop repeat 100 do
      (imgui:new-frame)

      ;; Main menu bar
      (imgui:with-main-menu-bar ()
        (imgui:with-menu ("File")
          (when (imgui:menu-item "Open" "Ctrl+O" nil t)
            (format t "Open clicked~%"))
          (when (imgui:menu-item "Save" "Ctrl+S" nil t)
            (format t "Save clicked~%"))
          (imgui:separator)
          (when (imgui:menu-item "Show Popup" "" nil t)
            (setf show-popup t)
            (imgui:open-popup "Example Popup")))

        (imgui:with-menu ("Edit")
          (imgui:menu-item "Undo" "Ctrl+Z" nil nil)
          (imgui:menu-item "Redo" "Ctrl+Y" nil nil)))

      ;; Modal popup
      (when show-popup
        (imgui:with-popup-modal ("Example Popup")
          (imgui:text "This is a modal popup!")
          (imgui:separator)
          (when (imgui:button "Close" 120 0)
            (setf show-popup nil)
            (imgui:close-current-popup))))

      (imgui:render))

    (imgui:shutdown)))

;;; Example 3: Tree nodes and tables
(defun example-tree-table ()
  "Demonstrates tree nodes and tables."
  (imgui:initialize)

  (loop repeat 100 do
    (imgui:new-frame)

    (imgui:with-window ("Tree and Table Example")
      ;; Tree node
      (imgui:with-tree-node ("Tree Node" :flags :default-open)
        (imgui:text "Child item 1")
        (imgui:text "Child item 2")

        (imgui:with-tree-node ("Nested Node")
          (imgui:text "Nested child")))

      (imgui:separator)

      ;; Table
      (imgui:with-table ("Example Table" 3 :borders-v)
        (imgui:table-setup-column "Name")
        (imgui:table-setup-column "Age")
        (imgui:table-setup-column "City")
        (imgui:table-headers-row)

        (loop for (name age city) in '(("Alice" 25 "NYC")
                                       ("Bob" 30 "LA")
                                       ("Charlie" 35 "SF"))
              do (imgui:table-next-row)
                 (imgui:table-next-column)
                 (imgui:text name)
                 (imgui:table-next-column)
                 (imgui:text (format nil "~D" age))
                 (imgui:table-next-column)
                 (imgui:text city))))

    (imgui:render))

  (imgui:shutdown))

;;; Example 4: Styling with colors
(defun example-styling ()
  "Demonstrates custom styling."
  (imgui:initialize)

  (loop repeat 100 do
    (imgui:new-frame)

    (imgui:with-window ("Styling Example")
      ;; Colored text
      (imgui:text-colored imgui:*color-red* "Red text")
      (imgui:text-colored imgui:*color-green* "Green text")
      (imgui:text-colored imgui:*color-blue* "Blue text")

      (imgui:separator)

      ;; Custom button colors
      (imgui:with-style-color (:button imgui:*color-red*)
        (imgui:button "Red Button" 120 30))

      (imgui:with-style-color (:button imgui:*color-green*)
        (imgui:button "Green Button" 120 30))

      (imgui:with-style-color (:button (imgui:rgb 255 128 0))
        (imgui:button "Orange Button" 120 30)))

    (imgui:render))

  (imgui:shutdown))

;;; Example 5: Using vectors
(defun example-vectors ()
  "Demonstrates vector and color classes."
  (let ((pos (imgui:make-vec2 100.0 200.0))
        (size (imgui:make-vec2 400.0 300.0))
        (color (imgui:hex-color #xFF6B35)))

    (format t "Position: ~A~%" pos)
    (format t "Size: ~A~%" size)
    (format t "Color: ~A~%" color)

    ;; Access components
    (format t "X: ~,2F, Y: ~,2F~%" (imgui:vec2-x pos) (imgui:vec2-y pos))

    ;; Modify components
    (setf (imgui:vec2-x pos) 150.0)
    (format t "New position: ~A~%" pos)))

;;; Run all examples
(defun run-all-examples ()
  "Run all examples (note: simplified for demonstration)."
  (format t "~%=== Example 1: Basic ===~%")
  (example-basic)

  (format t "~%=== Example 2: Menus ===~%")
  (example-menus)

  (format t "~%=== Example 3: Tree/Table ===~%")
  (example-tree-table)

  (format t "~%=== Example 4: Styling ===~%")
  (example-styling)

  (format t "~%=== Example 5: Vectors ===~%")
  (example-vectors))

(format t "~%Example file loaded.~%")
(format t "Run (cl-dear-imgui-example:run-all-examples) to see demonstrations.~%")
(format t "Note: These are simplified examples. In a real application, you would~%")
(format t "integrate ImGui with your rendering loop (OpenGL, Vulkan, etc.)~%~%")

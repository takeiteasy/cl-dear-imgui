;;;; cl-dear-imgui.asd

(asdf:defsystem #:cl-dear-imgui
  :description "CFFI bindings for Dear ImGui (dcimgui)"
  :author "George Watson <gigolo@hotmail.co.uk>"
  :license "MIT"
  :version "0.1.0"
  :serial t
  :depends-on (#:cffi)
  :components ((:file "package")
               (:file "bindings")
               (:file "wrapper")
               (:file "shim")))

(asdf:defsystem #:cl-dear-imgui/generator
  :description "Generator for cl-dear-imgui bindings from dcimgui.json"
  :author "George Watson <gigolo@hotmail.co.uk>"
  :license "MIT"
  :version "0.1.0"
  :depends-on (#:com.inuoe.jzon)
  :components ((:file "generator")))

(asdf:defsystem #:cl-dear-imgui/ui
  :description "High-level immediate mode user interface library for imgui forked from bodge-ui"
  :author "George Watson <gigolo@hotmail.co.uk>"
  :license "MIT"
  :version "0.1.0"
  :depends-on (#:cl-dear-imgui
               #:3d-vectors)
  :serial t
  :components ((:file "ui")
               (:file "style")
               (:file "elements")
               (:file "layout")
               (:file "style-elements")
               (:file "panel")
               (:file "button")
               (:file "check-box")
               (:file "color-box")
               (:file "color-picker")
               (:file "combo-box")
               (:file "label")
               (:file "list-select")
               (:file "menu-bar")
               (:file "notebook")
               (:file "property")
               (:file "radio")
               (:file "scroll-area")
               (:file "spacing")
               (:file "text-edit")))
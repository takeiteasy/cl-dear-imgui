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
               (:file "shim")))

(asdf:defsystem #:cl-dear-imgui/generator
  :description "Generator for cl-dear-imgui bindings from dcimgui.json"
  :author "George Watson <gigolo@hotmail.co.uk>"
  :license "MIT"
  :version "0.1.0"
  :depends-on (#:com.inuoe.jzon)
  :components ((:file "generator")))
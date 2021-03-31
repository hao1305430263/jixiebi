
(cl:in-package :asdf)

(defsystem "demo1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "node_position" :depends-on ("_package_node_position"))
    (:file "_package_node_position" :depends-on ("_package"))
    (:file "sign_position" :depends-on ("_package_sign_position"))
    (:file "_package_sign_position" :depends-on ("_package"))
  ))

(cl:in-package :asdf)

(defsystem "wpm2_tutorials-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "keyboard" :depends-on ("_package_keyboard"))
    (:file "_package_keyboard" :depends-on ("_package"))
    (:file "pid_control" :depends-on ("_package_pid_control"))
    (:file "_package_pid_control" :depends-on ("_package"))
    (:file "sign_position" :depends-on ("_package_sign_position"))
    (:file "_package_sign_position" :depends-on ("_package"))
    (:file "voc_sign_publisher" :depends-on ("_package_voc_sign_publisher"))
    (:file "_package_voc_sign_publisher" :depends-on ("_package"))
  ))
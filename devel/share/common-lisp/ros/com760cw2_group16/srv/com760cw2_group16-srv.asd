
(cl:in-package :asdf)

(defsystem "com760cw2_group16-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "HomingSignal" :depends-on ("_package_HomingSignal"))
    (:file "_package_HomingSignal" :depends-on ("_package"))
    (:file "SetBugMode" :depends-on ("_package_SetBugMode"))
    (:file "_package_SetBugMode" :depends-on ("_package"))
  ))
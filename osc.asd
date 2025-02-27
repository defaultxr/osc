;; -*- mode: lisp -*-

(in-package #:cl-user)

(asdf:defsystem osc
  :name "osc"
  :author "nik gaffney <nik@fo.am>"
  :licence "GPL v3"
  :description "The Open Sound Control protocol aka OSC"
  :version "0.7"
  :depends-on (:usocket)
  :components
  ((:file "osc" :depends-on ("osc-data" "osc-time"))
   (:file "osc-data" :depends-on ("package"))
   (:file "osc-dispatch" :depends-on ("osc"))
   (:file "osc-time" :depends-on ("package"))
   (:file "osc-tests" :depends-on ("osc"))
   (:file "package")
   (:module "devices"
    :if-feature :sbcl
    :depends-on ("package" "osc-data")
    :components
            ((:file "socket-functions")
             (:file "device")
             (:file "transmitter"
              :depends-on ("device"
                           "socket-functions"))
             (:file "listening-device"
              :depends-on ("transmitter"))
             (:file "dispatching-device"
              :depends-on ("listening-device"))
             (:file "client"
              :depends-on ("dispatching-device"))
             (:file "server" :depends-on ("client"))))))

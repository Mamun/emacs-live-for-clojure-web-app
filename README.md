###Emacs live pack for clojure workflow

Start, stop server and switch cljs repl 

### install

(add-live-packs "~/.emacs-live-packs/" '("clojure-workflow"))


### Usage

1. Create a file with dev.clj
2. Define fn with start, stop and cljs
3. Key binding {:f9 start :f8 stop :f10 cljs-repl f11 clj-repl }


### dev.clj

(ns dev
  (:use
   [server]
   [clojure.pprint :only [print-table]])
  (:require [zme.system :as sys]
            [cljs.repl.browser] ))

(defonce the-system nil)

(defn start
  "Start current development system."
  []
  (alter-var-root #'the-system (constantly (sys/system)))
  (alter-var-root #'the-system server-start ))

(defn stop
  "stop development system."
  []
  (when the-system
    (alter-var-root #'the-system
                    (fn [s] (when s
                             (server-stop s)
                             (sys/stop) )))))

(defn go []
  (stop)
  (start))

(defn cljs-repl []
  (cemerick.piggieback/cljs-repl
   :repl-env (doto
               (cljs.repl.browser/repl-env :cport 9000)
               (cljs.repl/-setup))))

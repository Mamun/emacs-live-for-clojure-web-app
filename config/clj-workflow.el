(live-add-pack-lib "nrepl")
(require 'nrepl )

(setq repl 0)
;0 = clojure and 1 = clojurescript

(defun switch-repl ()
  (interactive)
  (if (= repl 0)
      (progn
        (message "please wait, repl will switch for ClojureScript")
        (nrepl-interactive-eval " (do
                                     (require 'cljs.repl.browser)
                                     (cemerick.piggieback/cljs-repl
                                            :repl-env (doto
                                              (cljs.repl.browser/repl-env :cport 9000)
                                              (cljs.repl/-setup))))")
        (nrepl-set-ns "cljs.user")
        (setq repl 1))
    (progn
      (message "please wait, repl will switch for Clojure")
      (nrepl-interactive-eval ":cljs/quit" )
      (nrepl-set-ns "user")
      (setq repl 0))))


(defun dev-start ()
  "Evaluate the current buffer's namespace form."
  (interactive)
  (if (= repl 0)
      (progn
        (message "Server is strarting...")
        (nrepl-interactive-eval "(do
                                 (require 'dev)
                                 (dev/command-execute :start)) " ))
      (message "Please switch to clojure repl")))


(defun dev-stop ()
  "Evaluate the current buffer's namespace form."
  (interactive)
  (if (= repl 0)
      (progn
        (message "Server is stoping...." )
        (nrepl-interactive-eval "(do (require 'dev)
                                   (dev/command-execute :stop)) " ))
      (message "Please switch to clojure repl")))


(defun app-event ()
  "Evaluate the current buffer's namespace form."
  (interactive)
  (if (= repl 0)
      (progn
        (message "New event send to app" )
        (nrepl-interactive-eval "(do (require 'dev)
                                   (dev/command-execute :event)) " ))
    (progn
      (message "Please switch to clojure repl"))))


(eval-after-load 'nrepl
  '(progn
     (global-set-key (kbd "C-<f11>") 'switch-repl)
     (global-set-key (kbd "<f11>") 'app-event )
     (global-set-key (kbd "<f9>") 'dev-start )
     (global-set-key (kbd "C-<f9>") 'dev-stop )))

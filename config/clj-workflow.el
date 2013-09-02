(live-add-pack-lib "nrepl")
(require 'nrepl )

(defun dev-start ()
    "Evaluate the current buffer's namespace form."
      (interactive)
      (message "Server is strarting...")
      (nrepl-interactive-eval "(do
                                 (require 'dev)
                                 (dev/start)) " ))

(defun dev-stop ()
    "Evaluate the current buffer's namespace form."
      (interactive)
      (message "Server is stoping...." )
      (nrepl-interactive-eval "(do (require 'dev)
                                   (dev/stop)) " ))


(global-set-key (kbd "<f9>") 'dev-start )
(global-set-key (kbd "<f8>") 'dev-stop )
;(global-set-key (kbd "<f10>") 'cljs )
                                        ;(global-set-key (kbd "<f11>") 'cljs-quit )

(setq repl "clj")

(defun repl-switch ()
  (interactive)
  (if (string-equal repl "cljs")
      (progn
	(message "please wait, repl will switch to clj-repl")
	 (setq repl "clj")
 
        (nrepl-interactive-eval ":cljs/quit" )
	(nrepl-set-ns "user")
        (setq repl "clj")
        )
    (progn
      (message "please wait, repl will switch to cljs-repl")
      (setq repl "cljs")
      (nrepl-interactive-eval "
			      (do (require 'cljs.repl.browser)
			      (cemerick.piggieback/cljs-repl
                                :repl-env (doto	
					    (cljs.repl.browser/repl-env :cport 9000)
					    (cljs.repl/-setup))))" )
      (nrepl-set-ns "cljs.user")
     
      )
    )
  )

(eval-after-load 'nrepl
	   '(progn
	      (global-set-key (kbd "<f11>") 'repl-switch )))


;(global-set-key (kbd "<f11>") 'repl-switch )

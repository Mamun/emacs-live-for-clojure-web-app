(live-add-pack-lib "nrepl")
(require 'nrepl )
;; Place your bindings here.

;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)


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


(defun cljs ()
      "Evaluate the current buffer's namespace form."
      (interactive)
      (message "repl switch to cljs repl")
      (nrepl-interactive-eval "(do (require 'dev)
                                   (dev/cljs-repl))" )
      (nrepl-set-ns "cljs.user"))


(defun cljs-quit ()
        "Evaluate the current buffer's namespace form."
     (interactive)
     (message "cljs repl exit")
     (nrepl-interactive-eval ":cljs/quit" )
     (nrepl-set-ns "user"))


(global-set-key (kbd "<f9>") 'dev-start )
(global-set-key (kbd "<f8>") 'dev-stop )
(global-set-key (kbd "<f10>") 'cljs )
(global-set-key (kbd "<f11>") 'cljs-quit )




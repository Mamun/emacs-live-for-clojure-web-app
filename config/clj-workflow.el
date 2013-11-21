(live-add-pack-lib "nrepl")
(require 'nrepl )

(setq repl 0)
;0 = clojure and 1 = clojurescript

(defun switch-repl ()
  (interactive)
  (progn
    (nrepl-interactive-eval "(do  (command-handler :C-F11)) " )
    (nrepl-set-ns "cljs.user")))


(defun dev-start ()
  "Evaluate the current buffer's namespace form."
  (interactive)
  (nrepl-interactive-eval "(do (command-handler :F9)) " ))


(defun dev-stop ()
  "Evaluate the current buffer's namespace form."
  (interactive)
  (nrepl-interactive-eval "(do (command-handler :C-F9)) " ))


(defun app-event ()
  "Evaluate the current buffer's namespace form."
  (interactive)
  (nrepl-set-ns (nrepl-interactive-eval " (command-handler :event) " ))
  )


(eval-after-load 'nrepl
  '(progn
     (global-set-key (kbd "C-<f11>") 'switch-repl)
     (global-set-key (kbd "<f11>") 'app-event )
     (global-set-key (kbd "<f9>") 'dev-start )
     (global-set-key (kbd "C-<f9>") 'dev-stop )))

###Emacs live pack for clojure and clojure script web app

Start, stop server and switch cljs repl 

### install

Download this pluging to emacs live packs.

Add this pack to .emacs-live.el. 

(add-live-packs "~/.emacs-live-packs/" '("clojure-workflow"))


### Usage

1. lein new web-app hello
2. Open project using emacs-live.
3. Start repl.  
4. Press key to start and stop server. Key binding {:f9 start-server :C-f9 stop-server :C-f11 for repl switch }


### License


Copyright © 2013 Abdullah Al Mamun

Distributed under the Eclipse Public License, the same as Clojure.

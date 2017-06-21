(live-add-pack-lib "distel/elisp")
(live-add-pack-lib "distel-completion")

(require 'distel)
(require 'auto-complete-distel)


(distel-setup)

;; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
;; default node name to emacs@localhost
(setq inferior-erlang-machine-options '("-sname" "emacs"))
;; tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol
       (concat
        "emacs@"
        ;; Mac OS X uses "name.local" instead of "name", this should work
        ;; pretty much anywhere without having to muck with NetInfo
        ;; ... but I only tested it on Mac OS X.
	(car (split-string (shell-command-to-string "hostname"))))))

(add-to-list 'ac-sources 'auto-complete-distel)

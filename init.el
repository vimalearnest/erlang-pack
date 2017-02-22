(live-add-pack-lib "company-mode")
(live-add-pack-lib "distel/elisp")
(live-add-pack-lib "distel-completion")
(live-add-pack-lib "flycheck")
(live-add-pack-lib "flycheck-tip")

(add-to-list 'load-path "/Users/vimalearnest/erlang/curr/lib/tools-2.7.2/emacs")
(setq erlang-root-dir "/Users/vimalearnest/erlang/curr")
(setq exec-path (cons "/Users/vimalearnest/erlang/curr/bin" exec-path))
(setq erlang-man-root-dir "<erl-dir>/man")
(require 'erlang-start)

(require 'flycheck)
(require 'flycheck-tip)
(require 'company)

(flycheck-define-checker erlang-otp
       "An Erlang syntax checker using the Erlang interpreter."
       :command ("erlc" "-o" temporary-directory "-Wall"
                                   "-I" "../include" "-I" "../../include"
                                   "-I" "../../../include" source)
       :modes 'erlang-mode
       :error-patterns
                ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
                (error line-start (file-name) ":" line ": " (message) line-end)))

(add-hook 'erlang-mode-hook
          (lambda ()
            (flycheck-select-checker 'erlang-otp)
	    (flycheck-tip-use-timer 'verbose) 
            (flycheck-mode)))

(require 'distel)
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

(add-hook 'after-init-hook 'global-company-mode)

(require 'company-distel)
(add-to-list 'company-backends 'company-distel)

(add-hook 'erlang-mode-hook
   (lambda ()
     (cscope-minor-mode)
     (setq company-backends '(company-distel))))

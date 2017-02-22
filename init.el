(live-load-config-file "distel.el")
(live-load-config-file "flycheck.el")

(add-to-list 'load-path "/Users/vimalearnest/erlang/curr/lib/tools-2.7.2/emacs")
(setq erlang-root-dir "/Users/vimalearnest/erlang/curr")
(setq exec-path (cons "/Users/vimalearnest/erlang/curr/bin" exec-path))
(setq erlang-man-root-dir "<erl-dir>/man")
(require 'erlang-start)

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'erlang-mode-hook
          (lambda ()
            (flycheck-select-checker 'erlang-otp)
	    (flycheck-tip-use-timer 'verbose) 
            (flycheck-mode)
	    (cscope-minor-mode)
            (setq company-backends '(company-distel))))))


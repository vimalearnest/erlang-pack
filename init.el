(live-load-config-file "distel.el")
(live-load-config-file "flycheck.el")

(add-to-list 'load-path "~/erlang/curr/lib/tools-2.7.2/emacs")
(setq erlang-root-dir "~/erlang/curr")
(setq exec-path (cons "~/erlang/curr/bin" exec-path))
(setq erlang-man-root-dir "~/erlang/curr/man")
(require 'erlang-start)

(add-hook 'erlang-mode-hook
          (lambda ()
            (flycheck-select-checker 'erlang-otp)
            (flycheck-mode)
	    (if (display-graphic-p)
              (flycheck-pos-tip-mode)
              (flycheck-popup-tip-mode))
	    (cscope-minor-mode)
            (auto-complete-mode)))

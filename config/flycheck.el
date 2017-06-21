(live-add-pack-lib "flycheck")
(live-add-pack-lib "flycheck-pos-tip")
(live-add-pack-lib "flycheck-popup-tip")

(require 'flycheck)
(require 'flycheck-popup-tip)
(require 'flycheck-pos-tip)

(flycheck-define-checker erlang-otp
  "An Erlang syntax checker using the Erlang interpreter."
  :command ("erlc" "-o" temporary-directory "-Wall"
            "-I" "../include" "-I" "../../include"
            "-I" "../../../include" source)
  :modes 'erlang-mode
  :error-patterns
         ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
          (error line-start (file-name) ":" line ": " (message) line-end)))


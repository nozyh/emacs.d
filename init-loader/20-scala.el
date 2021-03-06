(require 'scala-mode)

(add-hook
 'scala-mode-hook
 '(lambda ()
    (local-set-key (kbd "RET") '(lambda ()
      (interactive)
      (newline-and-indent)
      (scala-indent:insert-asterisk-on-multiline-comment)))

    ;; sbt-find-definitions is a command that tries to find (with grep)
    ;; the definition of the thing at point.
    (local-set-key (kbd "M-.") 'sbt-find-definitions)

    ;; use sbt-run-previous-command to re-compile your code after changes
    (local-set-key (kbd "C-x '") 'sbt-run-previous-command)

    (local-set-key (kbd "M-'") 'next-error)

    ;; (require 'whitespace)
    ;; ;; clean-up whitespace at save
    ;; (make-local-variable 'before-save-hook)
    ;; (add-hook 'before-save-hook 'whitespace-cleanup)
    ;; ;; (whitespace-mode)
    ))

(require 'sbt-mode)

(add-hook
 'sbt-mode-hook
 '(lambda ()
    ;; compilation-skip-threshold tells the compilation minor-mode
    ;; which type of compiler output can be skipped. 1 = skip info
    ;; 2 = skip info and warnings.
    ;; (setq compilation-skip-threshold 1)

    ;; Bind C-a to 'comint-bol when in sbt-mode. This will move the
    ;; cursor to just after prompt.
    (local-set-key (kbd "C-a") 'comint-bol)

    ;; Bind M-RET to 'comint-accumulate. This will allow you to add
    ;; more than one line to scala console prompt before sending it
    ;; for interpretation. It will keep your command history cleaner.
    (local-set-key (kbd "M-RET") 'comint-accumulate)
    ))

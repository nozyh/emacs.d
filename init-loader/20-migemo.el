(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

;; Set your installed path
(if (file-exists-p "/usr/local/share/migemo/utf-8/migemo-dict")
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-dictionary "/home/noji/local/share/migemo/utf-8/migemo-dict")
)


(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)

(define-key isearch-mode-map (kbd "M-m") 'migemo-toggle)

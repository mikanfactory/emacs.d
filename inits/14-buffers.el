;; tempbuf
(require-or-install 'tempbuf)
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'ag-mode-hook    'turn-on-tempbuf-mode)

;; auto-save-buffers
(require-or-install 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-include-regexps '(".+"))
(setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
(setq auto-save-buffers-enhanced-quiet-save-p t)
(auto-save-buffers-enhanced t)

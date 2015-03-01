;; tempbuf
(require-or-install 'tempbuf)
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'ag-mode-hook    'turn-on-tempbuf-mode)

;; auto-save-buffers
(require-or-install 'auto-save-buffers)
(run-with-idle-timer 0.2 t 'auto-save-buffers)


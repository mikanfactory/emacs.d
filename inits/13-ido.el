;; ido
;; Use for find-file, kill-buffer, dired
(require-or-install 'ido)
(ido-mode t)
(global-set-key (kbd "C-x C-f") 'ido-find-file)

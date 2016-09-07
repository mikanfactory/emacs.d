;; ido
(autoload-do-load 'ido-mode)
(autoload-do-load 'ido-find-file)

(ido-mode t)
(global-set-key (kbd "C-x C-f") 'ido-find-file)

;; ido
;; find-file,kill-buffer,dired用に使う
(require 'ido)
(ido-mode t)
(global-set-key (kbd "C-x C-f") 'ido-find-file)

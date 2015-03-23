(defvar *emacs-config-directory* (file-name-directory load-file-name))

;; cask
(require 'cask)
(cask-initialize)

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load
 (expand-file-name "inits/" *emacs-config-directory*))
(package-refresh-contents)

;; I never use C-x C-c
(defalias 'exit 'save-buffers-kill-emacs)

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

(add-to-list 'load-path "~/.emacs.d/elisp")

(global-set-key (kbd "C-m") 'newline-and-indent)
(keyboard-translate ?\C-h ?\C-?)
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-c a") 'beginning-of-buffer)
(define-key global-map (kbd "C-c e") 'end-of-buffer)
(define-key global-map (kbd "C-;") 'comment-dwim)
(define-key global-map (kbd "\C-t") 'other-window)

(add-to-list 'default-frame-alist '(foreground-color . "brack"))

(require 'color-theme)
(color-theme-initialize)
(setq custom-theme-load-path nil)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq molokai-theme-kit t)

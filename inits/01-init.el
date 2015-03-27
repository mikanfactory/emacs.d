(defun mac-os-p ()
  (member window-system '(mac ns)))
(defun linuxp ()
  (eq window-system 'x))

;; Prevent omitting a long nested list.
(setq eval-expression-print-level nil)

;; exec-path
(-each (reverse
        (split-string
         (substring (shell-command-to-string "echo $PATH") 0 -1) ":"))
  (lambda (val) (add-to-list 'exec-path val)))

;; Don't kill *scratch*
(defun unkillable-scratch-buffer ()
  (if (string= (buffer-name (current-buffer)) "*scratch*")
      (progn
        (delete-region (point-min) (point-max))
        nil)
    t))
(add-hook 'kill-buffer-query-functions 'unkillable-scratch-buffer)

;; Use UTF-8
(prefer-coding-system 'utf-8)

;; Don't show start-up-messages.
(setq inhibit-startup-message t)
(setq initial-major-mode 'emacs-lisp-mode)

;; Use tab as spaces
(setq-default tab-width 2 indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

;; Don't use dialog box.
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;; Show key strokes in minibuffer quickly.
(setq echo-keystrokes 0.1)

;; Clipboard
(setq x-select-enable-clipboard t)

(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;; Don't use scroll-bar, menu-bar, toolbar.
(toggle-scroll-bar nil)
(menu-bar-mode 0)
(tool-bar-mode 0)

(setq-default require-final-newline nil)
(setq require-final-newline nil)

;; Prevent beeping.
(setq ring-bell-function 'ignore)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; Don't distinguish capital-case from small-case in file completion.
(setq completion-ignore-case t)

;; Auto reload buffer if file changed.
(global-auto-revert-mode 1)

;; If there are same name in buffer, identify them by each brackets.
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


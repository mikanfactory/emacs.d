(defun mac-os-p ()
  (member window-system '(mac ns)))
(defun linuxp ()
  (eq window-system 'x))

;; Prevent omitting a long nested list.
(setq eval-expression-print-level nil)

;; exec-path
(defvar shell-path-cache "~/.emacs.d/.shell")

(defun save-shell-path (shell-path)
  (with-temp-buffer
    (delete-region (point-min) (point-max))
    (insert (format "%s" shell-path))
    (write-file shell-path-cache)))

(defun read-shell-path ()
  (with-temp-buffer
    (insert-file-contents shell-path-cache)
    (format "%s" (read (buffer-string)))))

(defun set-exec-shell-path (shell-path)
  (setenv "PATH" shell-path)
  (setq exec-path (split-string shell-path path-separator)))

(defun set-exec-shell-path-from-command ()
  (interactive)
  (let* ((shell-raw-str (shell-command-to-string
                         "$SHELL --login -i -c 'echo $PATH'"))
         (shell-path (replace-regexp-in-string
                      "[ \t\n]*$" "" shell-raw-str)))
    (save-shell-path shell-path)
    (set-exec-shell-path shell-path)))

;; Set exec-path from cache if it existed.
(if (f-exists? shell-path-cache)
    (set-exec-shell-path (read-shell-path))
  (set-exec-shell-path-from-command))

;; Don't kill *scratch*.
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

;; Use tab as spaces.
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

;; Delete tailing whitespace.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

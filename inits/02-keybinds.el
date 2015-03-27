(when (mac-os-p)
  (setq ns-command-modifier 'meta)
  (setq ns-alternate-modifier 'super)
  (setq mac-pass-command-to-system nil))
(when (linuxp)
  (setq x-super-keysym 'meta)
  (setq x-meta-keysym 'super))

(define-key global-map (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-m") 'newline-and-indent)

;; Never use C-x C-c
(global-unset-key (kbd "C-x C-c"))
(defalias 'exit 'save-buffers-kill-emacs)

(define-prefix-command 'window 'windmove-map)
(global-set-key (kbd "C-w") 'windmove-map)
(define-key windmove-map "h" 'windmove-left)
(define-key windmove-map "j" 'windmove-down)
(define-key windmove-map "k" 'windmove-up)
(define-key windmove-map "l" 'windmove-right)
(define-key windmove-map "v" 'split-window-vertically)
(define-key windmove-map "n" 'split-window-horizontally)

(defun split-window-conditional ()
  (interactive)
  (if (> (* (window-height) 2) (window-width))
      (split-window-vertically)
    (split-window-horizontally)))
(define-key windmove-map "s" 'split-window-conditional)

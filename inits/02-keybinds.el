(define-key global-map (kbd "RET") 'newline-and-indent)

;; Can't use C-h in helm search
;; when (global-set-key "\C-h" 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-m") 'newline-and-indent)

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

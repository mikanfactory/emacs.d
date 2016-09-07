(require 'evil)
(require 'redo+)
(evil-mode t)

(custom-set-variables '(evil-shift-width 2))

;; emacs keybinds
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-visual-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-f") 'forward-char)
(define-key evil-insert-state-map (kbd "C-b") 'backward-char)
(define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)

;; enable C-h while evil-search, evil-ex
(defmacro add-hook-fn (name &rest body)
  `(add-hook ,name #'(lambda () ,@body)))
(add-hook-fn 'isearch-mode-hook
             (define-key key-translation-map (kbd "C-h") (kbd "<DEL>")))
(add-hook-fn 'isearch-mode-end-hook
             (define-key key-translation-map (kbd "C-h") (kbd "C-h")))

;; window operation
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)

(require 'evil-anzu)

(require 'evil-surround)
(global-evil-surround-mode t)

(require 'evil-matchit)
(global-evil-matchit-mode t)

(require 'evil-visualstar)
(global-evil-visualstar-mode t)

(require 'evil-exchange)
(evil-exchange-install)

(require 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "r"   'helm-recentf
  "f"   'helm-ls-git-ls
  "b"   'helm-buffers-list
  "s"   'ag
  "d"   'dired
  "v"   'dash-at-point
  "ee"  'ensime-show-all-errors-and-warnings
  "ew"  'ensime-print-errors-at-point
  "yn"  'yas-new-snippet
  "ye"  'yas-visit-snippet-file
  "qr"  'quickrun
  "mst" 'magit-status)

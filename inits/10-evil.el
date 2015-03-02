(require-or-install 'evil)
(require-or-install 'redo+)
(evil-mode t)

;; emacs keybinds
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-f") 'forward-char)
(define-key evil-insert-state-map (kbd "C-b") 'backward-char)
(define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)

;; window operation
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)

(require-or-install 'evil-surround)     
(global-evil-surround-mode t)          

(require-or-install 'evil-matchit)
(global-evil-matchit-mode t)

(require-or-install 'evil-visualstar)
(global-evil-visualstar-mode t)

(require-or-install 'evil-jumper)
(global-evil-jumper-mode t)

(require-or-install 'evil-exchange)
(evil-exchange-install)

(require-or-install 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "r" 'helm-recentf
  "f" 'helm-ls-git-ls
  "b" 'helm-buffers-list
  "s" 'ag
  "yn" 'yas-new-snippet
  "yv" 'yas-visit-snippet-file
  )

;; (defun require-or-install-evil-plugins (plugins)
;;   (or (require (car plugins) nil t)
;;       (progn
;;         (package-install-with-refresh 'evil-plugins)
;;         (loop for plugin in plugins
;;               do (require plugin)))))

;; (require-or-install-evil-plugins '(evil-little-word
;;                                    evil-mode-line
;;                                    evil-operator-moccur))
                                   

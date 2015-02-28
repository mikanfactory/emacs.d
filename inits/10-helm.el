;; helm, helm-ag, helm-flycheck, helm-c-yasnippet
(add-to-list 'load-path "~/.emacs.d/elisp/helm")
(add-to-list 'load-path "~/.emacs.d/elisp/helm/helm-ag")
(add-to-list 'load-path "~/.emacs.d/elisp/helm/helm-flycheck")
(add-to-list 'load-path "~/.emacs.d/elisp/helm/helm-c-yasnippet")

(require 'helm-config)
(require 'helm-ls-git)
(require 'helm-ag)
(require 'helm-c-yasnippet)

(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-, u b")   'helm-for-files)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-, u f") 'helm-ls-git-ls)

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))
;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB")
  'helm-execute-persistent-action)
;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB")
  'helm-execute-persistent-action)

(setq helm-buffer-max-length 50)
(global-set-key (kbd "C-M-z") 'helm-resume)


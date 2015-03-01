;; helm, helm-ag, helm-flycheck, helm-c-yasnippet
(add-to-list 'load-path "~/.emacs.d/elisp/helm")
(add-to-list 'load-path "~/.emacs.d/elisp/helm/helm-ag")

(require-or-install 'helm-config)
(require-or-install 'helm-ls-git)
(require-or-install 'helm-ag)

(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)

(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate) ad-do-it))

(setq helm-buffer-max-length 30)

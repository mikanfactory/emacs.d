;; helm, helm-ag
(require-or-install 'helm)
(require-or-install 'helm-ls-git)
(require-or-install 'helm-ag)

(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; Emulate 'kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  (kill-new (buffer-substring (point) (field-end))))

;; Execute command only if CANDIDATE exists
(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  (when (file-exists-p candidate) ad-do-it))

(setq helm-buffer-max-length 50)

;; Show full path name of candidates
(setq helm-ff-transformer-show-only-basename nil)

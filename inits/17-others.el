;; gist
(require-or-install 'gist)

;; wdired
(require-or-install 'wdired)
(define-key dired-mode-map "w" 'wdired-change-to-wdired-mode)

;; quickrun
(require-or-install 'quickrun)

;; recentf
(require-or-install 'recentf)
(require-or-install 'recentf-ext)

(setq recentf-max-saved-items 2000)
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer
      (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode t)

;; smartparens
(require-or-install-by-package-name 'smartparens 'smartparens-config)
(require-or-install-by-package-name 'smartparens 'smartparens-ruby)
(smartparens-global-mode t)

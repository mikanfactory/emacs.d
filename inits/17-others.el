;; gist
(require 'gist)

;; wdired
(require 'wdired)
(define-key dired-mode-map "w" 'wdired-change-to-wdired-mode)

;; quickrun
(require 'quickrun)

;; recentf
(require 'recentf)
(require 'recentf-ext)

(setq recentf-max-saved-items 2000)
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer
      (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode t)

;; smartparens
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode t)

;; memolist
(require 'memolist)

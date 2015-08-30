;; gist
(require 'gist)

;; wdired
(require 'wdired)
(define-key dired-mode-map "w" 'wdired-change-to-wdired-mode)

;; quickrun
(require 'quickrun)
(quickrun-add-command "node"
                      '((:command . "node")
                        (:exec    . ("%c %s")))
                      :default "javascript")

(quickrun-set-default "javascript" "node")

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

;; howdoi
(require 'howdoi)

;; dash-at-point
(require 'dash-at-point)

;; flycheck
(require 'flycheck)
(require 'flycheck-package)

;; tramp
(require 'tramp)


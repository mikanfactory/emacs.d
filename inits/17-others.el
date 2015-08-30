;; gist
(require 'gist)

;; wdired
(require 'wdired)
(define-key dired-mode-map "w" 'wdired-change-to-wdired-mode)

;; quickrun
(require 'quickrun)
(setq quickrun-timeout-seconds nil)
(-each '(("python"     "python")
         ("javascript" "node")
         ("ruby"       "ruby"))
  (-lambda ((lang cmd))
    (lexical-let ((name (concat "timer-" cmd)))
      (quickrun-add-command name
                            `((:command . ,cmd)
                              (:exec    . ("time %c %s")))
                            :default lang)
      (quickrun-set-default lang name))))

;; recentf
(require 'recentf)
(require 'recentf-ext)

(setq recentf-max-saved-items 200)
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


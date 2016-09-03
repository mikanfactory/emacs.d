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
    (let ((name (concat "timer-" cmd)))
      (quickrun-add-command name
                            `((:command . ,cmd)
                              (:exec    . ("time %c %s")))
                            :default lang)
      (quickrun-set-default lang name))))

;; recentf
(require 'recentf)
(require 'recentf-ext)

(setq recentf-max-saved-items 1000)
(setq recentf-exclude '(".recentf"))
;; (setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer
      (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode t)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;; memolist
(require 'memolist)

;; flycheck
(require 'flycheck)
(require 'flycheck-package)

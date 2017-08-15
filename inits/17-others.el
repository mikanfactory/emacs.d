;; wdired
(with-eval-after-load 'dired
  (require 'wdired)
  (define-key dired-mode-map "w" 'wdired-change-to-wdired-mode))

;; quickrun
(with-eval-after-load 'quickrun
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
        (quickrun-set-default lang name)))))

;; sql/bigquery
(quickrun-add-command "sql/bq" '((:command . "bq query --dry_run --use_legacy_sql=false")
                                 (:exec    . ("cat %s | %c")))
                      :default "sql"
                      :mode 'sql-mode)
(quickrun-set-default "sql" "sql/bq")

;; recentf
(require 'recentf)
(require 'recentf-ext)

(setq recentf-max-saved-items 1000)
(setq recentf-exclude '("recentf"))
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer
      (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode t)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;; memolist
(with-eval-after-load 'memolist
  (custom-set-variables '(memolist-memo-directory "~/Dropbox/1writer")))

;; flycheck
(with-eval-after-load 'flycheck
  (flycheck-package-setup)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq flycheck-disabled-checkers
        (append flycheck-disabled-checkers '(javascript-jshint javascript-jscs))))

;; company-dict
(require 'company-dict)
(setq company-dict-dir (concat *emacs-config-directory* "dict/"))
(add-to-list 'company-backends 'company-dict)

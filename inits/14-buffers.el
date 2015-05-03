;; tempbuf
(require 'tempbuf)
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'ag-mode-hook    'turn-on-tempbuf-mode)
(add-hook 'magit-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'gist-mode-hook  'turn-on-tempbuf-mode)

;; auto-save-buffers
(require 'auto-save-buffers-enhanced)
(setq max-specpdl-size 6000) ;; Avoid 'Variable binding depth exceeds' error.
(setq auto-save-buffers-enhanced-include-regexps '(".+"))
(setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
(setq auto-save-buffers-enhanced-quiet-save-p t)
(auto-save-buffers-enhanced t)
(auto-save-buffers-enhanced-include-only-checkout-path t)

;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
(push '("*Kill Ring*"   :height 0.4) popwin:special-display-config)
(push '("*quickrun*"    :height 0.3) popwin:special-display-config)
(push '("^\*helm .+\*$" :regexp t)   popwin:special-display-config)
(push '("*helm-ag*"     :height 0.4) popwin:special-display-config)
(push '("*Backtrace*"   :height 0.4) popwin:special-display-config)
(push '("*Buffer List*" :height 0.4) popwin:special-display-config)
(push '("*Warnigs*"     :height 0.4) popwin:special-display-config)
(push '("*Completions*" :height 0.4) popwin:special-display-config)
(push '("*Message*"     :height 0.4) popwin:special-display-config)
(push '("*undo-tree*"   :height 0.4) popwin:special-display-config)

(setq max-specpdl-size 6000)
(setq max-lisp-eval-depth 1000)

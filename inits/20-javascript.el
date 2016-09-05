(require 'web-mode)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-comment-style 2)

(require 'js2-mode)
(custom-set-variables '(js2-basic-offset 2))

;; Get along with flycheck
(setq js2-include-browser-externs nil)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-highlight-external-variables nil)
(setq js2-include-jslint-globals nil)

(require 'company-tern)
(add-hook 'js2-mode-hook 'tern-mode)
(add-to-list 'company-backends 'company-tern)

;; flycheck setting
(flycheck-add-mode 'javascript-eslint 'web-mode)

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlint)))

(setq flycheck-checkers '(javascript-eslint))

;; Use project eslint-file or default it
(defvar eslint-file-name ".eslintrc.json")

(defun exist-eslint-file? (path)
  (f-exists? (f-expand eslint-file-name path)))

(defun executable-eslint-file ()
  (f--traverse-upwards (exist-eslint-file? it) (f-dirname (f-this-file))))

(defun javascript-flycheck-setting ()
  (setq flycheck-eslintrc (executable-eslint-file (f-this-file)))
  (add-hook 'js2-mode-hook 'flycheck-mode))

(add-hook 'js2-mode-hook 'javascript-flycheck-setting)

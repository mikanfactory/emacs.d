(with-eval-after-load 'web-mode
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-comment-style 2))

(add-hook 'web-mode-hook 'tern-mode)
(add-hook 'web-mode-hook 'flycheck-mode)
(add-hook 'web-mode-hook 'eslint-hook)

(with-eval-after-load 'js2-mode
  (setq js2-basic-offset 2)
  (setq js2-include-browser-externs nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-highlight-external-variables nil)
  (setq js2-include-jslint-globals nil))

;; flycheck setting
;; Use project eslint-file or default it
(defvar eslint-file-name ".eslintrc.js")

(defun exist-eslint-file? (path)
  (f-exists? (f-expand eslint-file-name path)))

(defun executable-eslint-dir ()
  (f--traverse-upwards (exist-eslint-file? it) (f-dirname (f-this-file))))

(defun eslint-hook ()
  (setq flycheck-eslintrc (f-join (executable-eslint-dir) eslint-file-name)))

(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook 'eslint-hook)

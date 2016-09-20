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

(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook 'eslint-hook)

(with-eval-after-load 'typescript-mode
  (setq typescript-indent-level 2))

(add-hook 'typescript-mode-hook 'tern-mode)
(add-hook 'typescript-mode-hook 'flycheck-mode)
(add-hook 'typescript-mode-hook 'eslint-hook)

;; flycheck setting
;; Use project eslint-file or default it
(defvar eslint-file-names '(".eslintrc.js" ".eslintrc" ".eslintrc.json"))

(defun exist-eslint-file? (path)
  (-any? (lambda (name)
           (f-exists? (f-expand name path)))
         eslint-file-names))

(defun project-eslint-file-name (path)
  (-reduce-from (lambda (acc name)
                  (if (f-exists? (f-expand name path))
                      name
                    acc)) nil eslint-file-names))

(defun executable-eslint-dir ()
  (f--traverse-upwards (exist-eslint-file? it) (f-dirname (f-this-file))))

(defun eslint-hook ()
  (-if-let (exe-dir (executable-eslint-dir))
      (setq flycheck-eslintrc (f-join exe-dir (project-eslint-file-name exe-dir)))))

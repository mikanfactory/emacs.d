(defvar *elpa-directory*
  (expand-file-name "elpa" *emacs-config-directory*))

(defvar *snippets-directory*
  (expand-file-name "snippets/"
                    (car (directory-files *elpa-directory*
                                          t
                                          "yasnippet"))))

(require-or-install 'yasnippet)
(setq yas-snippet-dirs *snippets-directory*)
(yas-global-mode t)

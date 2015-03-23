(defvar *elpa-directory*
  (expand-file-name "elpa" *emacs-config-directory*))

(defvar *snippets-directory*
  (expand-file-name "snippets/"
                    (car (directory-files *elpa-directory*
                                          t
                                          "yasnippet"))))

(require 'yasnippet)
(setq yas-snippet-dirs *snippets-directory*)
(yas-global-mode t)

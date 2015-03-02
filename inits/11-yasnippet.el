(require-or-install 'yasnippet)
(setq yas-snippet-dirs
      (expand-file-name "snippets/"
                        (car (directory-files
                              (expand-file-name "elpa" *emacs-config-directory*)
                              t
                              "yasnippet"))))
(yas-global-mode t)

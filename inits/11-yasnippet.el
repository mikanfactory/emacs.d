(require 'yasnippet)
(defvar *snippets-directory*
  (expand-file-name "snippets/" *emacs-config-directory*))
(setq yas-snippet-dirs (list *snippets-directory*))
(yas-global-mode t)

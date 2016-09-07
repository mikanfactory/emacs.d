(with-eval-after-load 'go-mode
  (setq gofmt-command "goimports"))

(defun my/go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq tab-width 4))

(add-hook 'go-mode-hook 'my/go-mode-hook)

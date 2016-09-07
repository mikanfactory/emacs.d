(with-eval-after-load 'python-mode
  (setq python-indent-offset 4))

(add-hook 'python-mode-hook 'flycheck-mode)

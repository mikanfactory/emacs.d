(with-eval-after-load 'python-mode
  (setq python-indent-offset 4))

(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'my/python-hook)

(defun my/python-hook ()
  (define-key evil-normal-state-map (kbd "M-.") 'jedi:goto-definition))

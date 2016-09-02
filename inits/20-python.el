(setq python-indent-offset 4)
(setq jedi:complete-on-dot t)  

(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'jedi:setup)

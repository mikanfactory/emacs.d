(setq python-indent-offset 4)
(setq jedi:complete-on-dot t)  
(setq python-shell-interpreter "/usr/local/bin/ipython")

(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'jedi:setup)

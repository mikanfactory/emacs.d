(setq python-indent-offset 4)
(setq jedi:complete-on-dot t)

(require 'company-jedi)
(add-to-list 'company-backends 'company-jedi)

(setq flycheck-checkers '(python-flake8))
(add-hook 'python-mode-hook 'flycheck-mode)

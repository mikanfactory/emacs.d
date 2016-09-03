(setq python-indent-offset 4)
(setq jedi:complete-on-dot t)  

(require 'company-jedi)
(add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook 'flycheck-mode)

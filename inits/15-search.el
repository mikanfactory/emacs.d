(require 'ag)
(require 'wgrep)
(require 'wgrep-ag)

(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(define-key ag-mode-map (kbd "w") 'wgrep-change-to-wgrep-mode)

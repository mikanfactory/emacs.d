(require-or-install 'ag)
(require-or-install 'wgrep)
(require-or-install 'wgrep-ag)

(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(define-key ag-mode-map (kbd "w") 'wgrep-change-to-wgrep-mode)

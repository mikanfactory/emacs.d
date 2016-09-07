(with-eval-after-load 'ag
  (require 'wgrep)
  (require 'wgrep-ag)
  (define-key ag-mode-map (kbd "w") 'wgrep-change-to-wgrep-mode))

(add-hook 'ag-mode-hook 'wgrep-ag-setup)

(require 'ag)
(require 'wgrep)
(require 'wgrep-ag)

(define-key global-map (kbd "M-s") 'ag)

(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)

;; zshのpathを読み込む
(let* ((zshpath (shell-command-to-string
         "/usr/bin/env zsh -c 'printenv PATH'"))
       (pathlst (split-string zshpath ":")))
  (setq exec-path pathlst)
  (setq eshell-path-env zshpath)
  (setenv "PATH" zshpath))


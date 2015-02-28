(require 'rainbow-delimiters)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
;; (add-to-list 'rainbow-delimiters-ignore-modes 'fundamental-mode) ;helmとの干渉回避
(custom-set-faces '(rainbow-delimiters-depth-1-face ((t (:foreground "#586e75"))))) ;文字列の色と被るため,変更
;; (global-rainbow-delimiters-mode 1)

(require 'wdired nil t)
;; diredバッファで r を押すとwdiredを起動する
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "<C-tab>") 'other-window)

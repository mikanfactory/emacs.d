(require 'clojure-mode)
(require 'cider)

(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-buffer-name-show-port t)

(require 'ac-cider)
(add-hook 'cideer-repl-mode-hook 'ac-cider-setup)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))


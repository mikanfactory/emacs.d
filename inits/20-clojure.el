(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/clojure"))
(require 'clojure-mode)

(require 'cider)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-buffer-name-show-port t)

(autoload 'ac-nrepl "ac-nrepl" nil t)
(add-hook 'cideer-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

;; (require '4clojure)


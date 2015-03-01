;; Use Clozure CL
(setq inferior-lisp-program "ccl")
(require-or-install 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

(require-or-install 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))



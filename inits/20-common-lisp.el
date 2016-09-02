;; Use clozure common lisp
(setq inferior-lisp-program "ccl")

(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

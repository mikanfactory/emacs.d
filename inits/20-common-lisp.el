;; Use clozure common lisp
(setq inferior-lisp-program "ccl")

(with-eval-after-load 'slime
  (slime-setup '(slime-repl slime-fancy slime-banner)))

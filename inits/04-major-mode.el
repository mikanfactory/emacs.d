(-each '((emacs-lisp-mode . "\\.el$")
         (emacs-lisp-mode . "Cask$")
         (lisp-mode . "\\.\\(cl\\|lisp\\)$")
         (scheme-mode . "\\.scm$")
         (clojure-mode . "\\.clj$")
         (js2-mode . "\\.js$")
         (web-mode . "\\.jsx$")
         (ruby-mode . "\\.rb$")
         (css-mode . "\\.css$")
         (scss-mode . "\\.scss$")
         (yatex-mode . "\\.tex$")
         (markdown-mode . "\\.\\(md\\|markdown\\)$"))
  (lambda (dlist) (add-to-list 'auto-mode-alist
                                (cons (rest dlist) (first dlist)))))



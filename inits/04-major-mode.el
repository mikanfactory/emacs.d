(-each '((emacs-lisp-mode "\\.el$")
         (emacs-lisp-mode "Cask$")
         (lisp-mode "\\.\\(cl\\|lisp\\)$")
         (scheme-mode "\\.scm$")
         (clojure-mode "\\.clj$")
         (js2-mode "\\.js$")
         (web-mode "\\.jsx$")
         (ruby-mode "\\.rb$")
         (php-mode "\\.php$")
         (web-mode "\\html$")
         (css-mode "\\.css$")
         (web-mode "\\.twig$")
         (web-mode "\\.ect$")
         (scss-mode "\\.scss$")
         (yatex-mode "\\.tex$")
         (markdown-mode "\\.\\(md\\|markdown\\)$"))
  (-lambda ((mode ext)) (add-to-list 'auto-mode-alist (cons ext mode))))


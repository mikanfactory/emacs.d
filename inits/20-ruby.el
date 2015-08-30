(setq ruby-insert-encoding-magic-comment nil)

(require 'inf-ruby)
(setq inf-ruby-default-implementation "pry")

(add-hook 'ruby-mode-hook 'flycheck-mode)

(require 'rspec-mode)
(rspec-install-snippets)
(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))

(ad-activate 'rspec-compile)

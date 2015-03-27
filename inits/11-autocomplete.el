;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; Select complement candidate by C-n/C-p
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(setq ac-use-fuzzy t)
(setq ac-use-comphist t) 
(setq ac-ignore-case nil) 

(defvar my-ac-sources
  '(ac-source-yasnippet
    ac-source-abbrev
    ac-source-dictionary
    ac-source-words-in-same-mode-buffers))

(-each '(emacs-lisp-mode-hook
         lisp-mode-hook
         scheme-mode-hook
         clojure-mode-hook
         js-mode-hook
         coffee-mode-hook
         ruby-mode-hook
         html-mode-hook
         css-mode-hook
         scss-mode-hook)
  (lambda (val) (setq-default ac-sources my-ac-sources)))

(defadvice ac-word-candidates (after remove-word-contain-japanese activate)
  (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
    (setq ad-return-value
          (remove-if contain-japanese ad-return-value))))

;; eldoc
(require 'eldoc)
(require 'eldoc-extension)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

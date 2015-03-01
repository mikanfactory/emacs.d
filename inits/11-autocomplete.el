;; auto-complete
(require-or-install 'auto-complete-config)
(require-or-install 'fuzzy)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/ac-dict")
(ac-config-default)
;; Select complement candidate by C-n/C-p
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(setq ac-use-comphist t) 
(setq ac-ignore-case nil) 

(defadvice ac-word-candidates (after remove-word-contain-japanese activate)
  (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
    (setq ad-return-value
          (remove-if contain-japanese ad-return-value))))

;; eldoc
(require-or-install 'eldoc)
(require-or-install 'eldoc-extension)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)



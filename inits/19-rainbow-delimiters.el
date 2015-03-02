(require-or-install 'rainbow-delimiters)
(add-hook 'js-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ruby-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;; Customized by "M-x customize-group rainbow-delimiters"
(custom-set-variables
 '(rainbow-delimiters-max-face-count 12))
(custom-set-faces
 '(rainbow-delimiters-depth-1-face  ((t (:foreground "#E0604E"))))
 '(rainbow-delimiters-depth-2-face  ((t (:foreground "#E0604E"))))
 '(rainbow-delimiters-depth-3-face  ((t (:foreground "#E48A767"))))
 '(rainbow-delimiters-depth-4-face  ((t (:foreground "#E48A767"))))
 '(rainbow-delimiters-depth-5-face  ((t (:foreground "#9FC369"))))
 '(rainbow-delimiters-depth-6-face  ((t (:foreground "#9FC369"))))
 '(rainbow-delimiters-depth-7-face  ((t (:foreground "#64A7C8"))))
 '(rainbow-delimiters-depth-8-face  ((t (:foreground "#64A7C8"))))
 '(rainbow-delimiters-depth-9-face  ((t (:foreground "#C3C2D5"))))
 '(rainbow-delimiters-depth-10-face ((t (:foreground "#C3C2D5"))))
 '(rainbow-delimiters-depth-11-face ((t (:foreground "#FFDFDF"))))
 '(rainbow-delimiters-depth-12-face ((t (:foreground "#FFDFDF"))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face)))))

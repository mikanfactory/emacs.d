;; company-mode
(require 'company)
(global-company-mode +1)
(set-face-attribute 'company-scrollbar-fg nil :background "orange")
(set-face-attribute 'company-scrollbar-bg nil :background "gray40")
(set-face-attribute 'company-tooltip nil :foreground "black"
                    :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil :foreground "black"
                    :background "lightgrey")
(set-face-attribute 'company-tooltip-selection nil :foreground "black"
                    :background "steelblue")
(set-face-attribute 'company-preview-common nil :background nil
                    :foreground "lightgrey" :underline t)
(set-face-attribute 'company-tooltip-common-selection nil :foreground "white"
                    :background "steelblue")

;; Select complement candidate by C-n/C-p
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map [tab] 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "C-w") nil)
(define-key company-search-map (kbd "C-w") nil)
(define-key company-active-map (kbd "C-h") nil)
(define-key company-search-map (kbd "C-h") nil)

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(setq company-dabbrev-downcase nil)     ; case sensitive

;; jedi
(add-to-list 'company-backends 'company-jedi)

;; tern
(add-to-list 'company-backends 'company-tern)

;; company
(add-to-list 'company-backends 'company-go)

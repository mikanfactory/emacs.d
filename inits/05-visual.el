;; Display line number.
(global-linum-mode t)
(setq linum-delay t)
(setq linum-format "%3d ")

(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))
(setq show-paren-delay 0.125)
(set-frame-parameter nil 'alpha 100)

;; Highlight current line.
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; region color
(transient-mark-mode t)
(set-face-background 'region "Blue")

;; Highlight a pair bracket.
(show-paren-mode t)

;; font
(set-face-attribute 'default nil
                    :family "ricty"
                    :height 165)
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "ricty"))


;; Highlight all symbol which cursor on.
(require-or-install 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)


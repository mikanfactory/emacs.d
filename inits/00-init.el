;; 画面の設定
(setq inhibit-startup-message t)        ;; 起動画面を表示しない
(global-linum-mode t)                   ;; 行番号を常に表示する
(setq linum-delay t)
(setq linum-format "%3d ")
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))
(setq show-paren-delay 0.125)
(set-frame-parameter nil 'alpha 100)

(setq-default tab-width 2)              ;; インデントの深さを2にする
(setq-default indent-tabs-mode nil)     ;; タブをスペースで扱う

;; 文字コードの指定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; クリップボードからの文字化け対策
(set-clipboard-coding-system 'utf-8)
(setq x-select-enable-clipboard t)

;; フォント
(set-face-attribute 'default nil
                    :family "ricty"
                    :height 165)
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "ricty"))

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; ファイルが #! から始まる場合、+xを付けて保存する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; バッファの自動読み込み
(global-auto-revert-mode 1)

;; 同名ファイルのバッファ名の識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; 現在行のハイライト
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

;; リージョンの色を設定
(transient-mark-mode t)
(set-face-background 'region "Blue")

;; スクロールバーを使わない
(toggle-scroll-bar nil)
;; メニューバーを使わない
(menu-bar-mode 0)
;; ツールバーを使わない
(tool-bar-mode 0)

;; ウィンドウの切り替え
(defun other-window-or-split (val)
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window val))
;; 画面遷移は C-w h,j,k,l
(global-set-key (kbd "<C-tab>") (lambda () (interactive) (other-window-or-split 1)))
(global-set-key (kbd "<C-S-tab>") (lambda () (interactive) (other-window-or-split -1)))

;;kill-ring
(setq kill-ring-max 20)

;; wordwrap
;; (setq-default word-wrap t)

;; 最後に改行を入れる
(setq require-final-newline t)

;; 行末の空白を削除
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 対応するカッコをハイライト
(show-paren-mode t)


;; (eval-when-compile
  ;; (require 'cl))
;; 
;; (defun mac-os-p ()
  ;; (member window-system '(mac ns)))
;; (defun linuxp ()
  ;; (eq window-system 'x))
;; 
;; (defadvice kill-sexp (around kill-sexp-and-fixup activate)
  ;; (if (and (not (bolp)) (eolp))
      ;; (progn
        ;; (forward-char)
        ;; (fixup-whitespace)
        ;; (backward-char)
        ;; (kill-line))
    ;; ad-do-it))
;; 
;; (defmacro appendf (list &rest lists)
  ;; `(setq ,list (append ,list ,@lists)))
;; 
;; ;; Prevent omitting a long nested list.
;; (setq eval-expression-print-level nil)
;; 
;; ;; exec-path
;; (loop for x in (reverse
                ;; (split-string (substring (shell-command-to-string "echo $PATH") 0 -1) ":"))
      ;; do (add-to-list 'exec-path x))
;; 
;; ;; Don't kill *scratch*
;; (defun unkillable-scratch-buffer ()
  ;; (if (string= (buffer-name (current-buffer)) "*scratch*")
      ;; (progn
        ;; (delete-region (point-min) (point-max))
        ;; nil)
    ;; t))
;; (add-hook 'kill-buffer-query-functions 'unkillable-scratch-buffer)
;; 
;; ;; Use UTF-8.
;; (prefer-coding-system 'utf-8)
;; 
;; (setq inhibit-startup-message t)
;; (setq initial-scratch-message "")
;; (setq initial-major-mode 'emacs-lisp-mode)
;; 
;; (setq-default tab-width 2
              ;; indent-tabs-mode nil)
;; 
;; (fset 'yes-or-no-p 'y-or-n-p)
;; 
;; ;; Don't use dialog box.
;; (setq use-dialog-box nil)
;; (defalias 'message-box 'message)
;; 
;; ;; Show key strokes in minibuffer quickly.
;; (setq echo-keystrokes 0.1)
;; 
;; ;; Clipboard
;; (setq x-select-enable-clipboard t)
;; 
;; (setq scroll-conservatively 35
      ;; scroll-margin 0
      ;; scroll-step 1)
;; 
;; (setq-default require-final-newline nil)
;; (setq require-final-newline nil)
;; 
;; ;; Prevent beeping.
;; (setq ring-bell-function 'ignore)
;; 
;; (setq make-backup-files nil)
;; (setq auto-save-default nil)

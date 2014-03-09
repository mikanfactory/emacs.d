;; ------------------------------------------------------------------------
;; @ general

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)


;; パスの設定
(add-to-list 'load-path "~/.emacs.d/elisp")

;; 画面の設定
(require 'color-theme)
(color-theme-initialize)
(setq custom-theme-load-path nil)
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/themes")
(load-theme 'monokai t)

(global-linum-mode t)                   ;; 行番号を常に表示する
(setq-default tab-width 2)              ;; インデントの深さを2にする
(setq-default indent-tabs-mode nil)     ;; タブをスペースで扱う

;; 文字コードの指定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)


;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)


;; ファイルが #! から始まる場合、+xを付けて保存する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; ------------------------------------------------------------------------
;; @ modeline


;; ------------------------------------------------------------------------
;; @ key bind


(global-set-key (kbd "C-m") 'newline-and-indent)
(keyboard-translate ?\C-h ?\C-?)
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-c a") 'beginning-of-buffer)
(define-key global-map (kbd "C-c e") 'end-of-buffer)
(define-key global-map (kbd "C-;") 'comment-dwim)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "C-/") 'undo)

;; EmacsではC-g C-/ でredoができる
;; (define-key global-map (kbd "C-.") 'redo)

;; ------------------------------------------------------------------------
;; @ elip

;; ------------------------------------------------------------------------
;; @ auto-complete.el

;; auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
         "~/.emacs.d/elisp/ac-dict")
  (ac-config-default))

;; C-n/C-p で補完候補を選択
(setq ac-use-menu-map t)
;; デフォルトで設定済み
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)


;; ------------------------------------------------------------------------
;; @ auto-install.el

;; auto-installの設定
;; ちょっと重いので、普段は外しておく
;; (when (require 'auto-install nil t)
;;   ;; インストールディレクトリを設定する
;;   ;; 初期値は ~/.emacs.d/auto-install/
;;   (setq auto-install-directory "~/.emacs.d/elisp")

;;   ;; EmacsWiki に登録されている elisp の名前を取得する
;;   (auto-install-update-emacswiki-package-name t)

;;   ;; 必要であればプロキシの設定を行う
;;   ;; (setq url-proxy-services '(("http" . "localhost:8080")))

;;   ;; install-elisp の関数を利用可能にする
;;   (auto-install-compatibility-setup))

;; ------------------------------------------------------------------------
;; @ package.el

;; MELPA、Marmaladeの設定
;; package.elはEmacs24に標準で入っている
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; パッケージ情報の更新
(package-refresh-contents)

;; ------------------------------------------------------------------------
;; @ anything.el

(when (require 'anything-startup nil t)
  (global-set-key (kbd "C-x b") 'anything))


;; ------------------------------------------------------------------------
;; @ yasnippet.el

(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
  "~/.emacs.d/elisp/yasnippet/snippets"
  ))
(yas-global-mode 1)

;; 単語展開キーバインド
(custom-set-variables '(yas-trigger-key "TAB"))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; ------------------------------------------------------------------------
;; @ ruby-mode.el

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda () (inf-ruby-keys)))

;; ------------------------------------------------------------------------
;; @ ruby-electric.el

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; ------------------------------------------------------------------------
;; @ haml-mode.el

;; Haml-mode
(require 'haml-mode)

;; ;; ------------------------------------------------------------------------
;; ;; @ emacs-rails.el
(defun try-complete-abbrev (old)
    (if (expand-abbrev) t nil))
(setq hippie-expand-try-functions-list
            '(try-complete-abbrev
                      try-complete-file-name
                              try-expand-dabbrev))
(setq rails-use-mongrel t)
(require 'cl)
(require 'rails)

;; ;; ------------------------------------------------------------------------
;; ;; @ ruby-block.el

(require 'ruby-block)
(ruby-block-mode t)
;; ミニバッファに表示し, かつ, オーバレイする.
(setq ruby-block-highlight-toggle t)

;; ;; ------------------------------------------------------------------------
;; ;; @ inf-ruby.el

;; (autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
;; (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)


;; ;; ------------------------------------------------------------------------
;; ;; @ rinari.el

;; ;; Interactively Do Things (highly recommended, but not strictly required)
;; (require 'ido)
;; (ido-mode t)
;; ;; Rinari
;; (add-to-list 'load-path "~/path/to/your/elisp/rinari")
;; (require 'rinari)

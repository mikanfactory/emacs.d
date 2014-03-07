;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)


;; パスの設定
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")

;; キーバインドの設定
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


;; 画面の設定
(add-to-list 'default-frame-alist '(foreground-color . "brack"))
(require 'color-theme)
(color-theme-initialize)
(setq custom-theme-load-path nil)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq molokai-theme-kit t)

;; 行番号を常に表示する
(global-linum-mode t)


;; 文字コードの指定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)


;; ファイルが #! から始まる場合、+xを付けて保存する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs.d/elisp/ac-dict")
  (ac-config-default))

;; C-n/C-p で補完候補を選択
(setq ac-use-menu-map t)
;; デフォルトで設定済み
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)


;; auto-installの設定
;; ちょっと重いので、普段は外しておく
;; (when (require 'auto-install nil t)	
  ;; インストールディレクトリを設定する
  ;; 初期値は ~/.emacs.d/auto-install/
  ;; (setq auto-install-directory "~/.emacs.d/elisp")
  
  ;; EmacsWiki に登録されている elisp の名前を取得する
  ;; (auto-install-update-emacswiki-package-name t)

  ;; 必要であればプロキシの設定を行う
  ;; (setq url-proxy-services '(("http" . "localhost:8080")))

  ;; install-elisp の関数を利用可能にする
  ;; (auto-install-compatibility-setup))


;; anythingの設定
;; ちょっと重いので外す
;; (when (require 'anything-startup nil t)
;;   (global-set-key (kbd "C-x b") 'anything))


;; yasnippetの設定
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


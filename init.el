;; ----------------------------------------------------------------
;; @ General
;; ----------------------------------------------------------------
;; パスの設定
(add-to-list 'load-path "~/.emacs.d/elisp")

;; ----------------------------------------------------------------
;; @ evil-mode
;; ----------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp/evil")
(require 'evil)
(evil-mode 1)

;; ----------------------------------------------------------------
;; @ redo+
;; ----------------------------------------------------------------
(require 'redo+)

;; ----------------------------------------------------------------
;; @ other key-bind
;; ----------------------------------------------------------------
(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-m") 'newline-and-indent)

;; ----------------------------------------------------------------
;; 設定
;; ----------------------------------------------------------------
;; rbenvで入れたrubyを使う
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

;; 画面の設定
(setq inhibit-startup-message t)        ;; 起動画面を表示しない
(global-linum-mode t)                   ;; 行番号を常に表示する
(setq linum-delay t)
(setq linum-format "%3d ")
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))
(setq show-paren-delay 0.125)
(set-frame-parameter nil 'alpha 100)

;; raliscasts
(require 'color-theme)
(color-theme-initialize)
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/themes")
(color-theme-railscasts)

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

;; ----------------------------------------------------------------
;; @ modeline
;; ----------------------------------------------------------------
;; モードラインに行番号表示
(line-number-mode t)
;; モードラインに列番号表示
(column-number-mode t)

;; モードラインの割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)

(when my-lines-page-mode
  (setq my-mode-line-format "%d")
  (if size-indication-mode
      (setq my-mode-line-format (concat my-mode-line-format " of %%I")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
         (setq my-mode-line-format (concat my-mode-line-format " (%%l,%%c)")))
        ((eq line-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
        ((eq column-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " C%%c"))))
  (setq mode-line-position
        '(:eval (format my-mode-line-format
                        (count-lines (point-max) (point-min))))))
(interactive "F")

;; ----------------------------------------------------------------
;; @ mode
;; ----------------------------------------------------------------
;; ----------------------------------------------------------------
;; @ slime
;; ----------------------------------------------------------------
;; clispをデフォルトのCommon Lisp処理系に設定
;; Clozure CLの場合はccl
;; (setq inferior-lisp-program "clisp")
(setq inferior-lisp-program "ccl")
;; ~/.emacs.d/slimeをload-pathに追加
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/slime"))
;; SLIMEのロード
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

(setq auto-mode-alist
      (cons (cons "\\.cl$" 'lisp-mode) auto-mode-alist))

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; ----------------------------------------------------------------
;; @ rainbow delimiters
;; ----------------------------------------------------------------
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/rainbow-delimiters"))
(require 'rainbow-delimiters)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
;; (add-to-list 'rainbow-delimiters-ignore-modes 'fundamental-mode) ;helmとの干渉回避
(custom-set-faces '(rainbow-delimiters-depth-1-face ((t (:foreground "#586e75"))))) ;文字列の色と被るため,変更
;; (global-rainbow-delimiters-mode 1)

;; ----------------------------------------------------------------
;; @ gosh-mode
;; ----------------------------------------------------------------
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

;; ----------------------------------------------------------------
;; @ clojure-mode, cider-mode, ac-nrepl
;; ----------------------------------------------------------------
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/clojure"))
(require 'clojure-mode)

(require 'cider)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-buffer-name-show-port t)

(autoload 'ac-nrepl "ac-nrepl" nil t)
(add-hook 'cideer-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

;; (require '4clojure)

;; ----------------------------------------------------------------
;; @ elisp
;; ----------------------------------------------------------------
;; ----------------------------------------------------------------
;; @ yasnippet
;; ----------------------------------------------------------------
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-c i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-c i v") 'yas-visit-snippet-file)

;; ----------------------------------------------------------------
;; @ auto-complete
;; ----------------------------------------------------------------
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

;; ----------------------------------------------------------------
;; @ auto-install
;; ----------------------------------------------------------------
;; ;; auto-installの設定
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

;; ----------------------------------------------------------------
;; @ package
;; ----------------------------------------------------------------
;; MELPA、Marmaladeの設定
;; package.elはEmacs24に標準で入っている
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
;; (package-initialize)

;; パッケージ情報の更新
;; (package-refresh-contents)

;; ----------------------------------------------------------------
;; @ Uniquify
;; ----------------------------------------------------------------
(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; ----------------------------------------------------------------
;; @ tempbuf
;; ----------------------------------------------------------------
(require 'tempbuf)
;; ファイルを開いたら自動的にtempbufを有効にする
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'ag-mode-hook 'turn-on-tempbuf-mode)

;; ----------------------------------------------------------------
;; @ auto-save-buffers
;; ----------------------------------------------------------------
(require 'auto-save-buffers)
;; アイドル2秒で保存
(run-with-idle-timer 0.2 t 'auto-save-buffers)

;; ----------------------------------------------------------------
;; @ helm, helm-ag, helm-c-yasnippet, hel(setq helm-buffer-max-length 50)
;; ----------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp/helm")
(add-to-list 'load-path "~/.emacs.d/elisp/helm/helm-ag")
(add-to-list 'load-path "~/.emacs.d/elisp/helm/helm-flycheck")
(add-to-list 'load-path "~/.emacs.d/elisp/helm/helm-c-yasnippet")

(require 'helm-config)
(require 'helm-ls-git)
(require 'helm-ag)
(require 'helm-c-yasnippet)

(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-, u b")   'helm-for-files)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-, u f") 'helm-ls-git-ls)

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))
;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB")
  'helm-execute-persistent-action)
;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB")
  'helm-execute-persistent-action)

(setq helm-buffer-max-length 50)
(global-set-key (kbd "C-M-z") 'helm-resume)

;; ----------------------------------------------------------------
;; @ ido
;; ----------------------------------------------------------------
;; find-file,kill-buffer,dired用に使う
(require 'ido)
(ido-mode t)
(global-set-key (kbd "C-x C-f") 'ido-find-file)

;; ----------------------------------------------------------------
;; @ yasnippet
;; ----------------------------------------------------------------
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;; 単語展開キーバインド
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(ag-reuse-buffers (quote nil))
 '(ag-reuse-window (quote nil))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "73fe242ddbaf2b985689e6ec12e29fab2ecd59f765453ad0e93bc502e6e478d6" default)))
 '(magit-use-overlays nil)
 '(yas-trigger-key "TAB"))

;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-c i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-c i v") 'yas-visit-snippet-file)

;; ----------------------------------------------------------------
;; @ recentf
;; ----------------------------------------------------------------
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1)
  (require 'recentf-ext))

;; ----------------------------------------------------------------
;; @ wgrep
;; ----------------------------------------------------------------
(require 'wgrep nil t)

;; ----------------------------------------------------------------
;; @ ag, wgrep_ag
;; ----------------------------------------------------------------
(require 'ag)

(define-key global-map (kbd "M-s") 'ag)

(require 'wgrep-ag)
(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)

;; zshのpathを読み込む
(let* ((zshpath (shell-command-to-string
         "/usr/bin/env zsh -c 'printenv PATH'"))
       (pathlst (split-string zshpath ":")))
  (setq exec-path pathlst)
  (setq eshell-path-env zshpath)
  (setenv "PATH" zshpath))

;; ----------------------------------------------------------------
;; @ wdired
;; ----------------------------------------------------------------
(require 'wdired nil t)
;; diredバッファで r を押すとwdiredを起動する
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "<C-tab>") 'other-window)

;; ----------------------------------------------------------------
;; @ popwin.le
;; ----------------------------------------------------------------
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
(push '("*Kill Ring*"   :height 0.4) popwin:special-display-config)
(push '("^\*helm .+\*$" :regexp t)   popwin:special-display-config)
(push '("*helm-ag*"     :height 0.4) popwin:special-display-config)
(push '("*Backtrace*"   :height 0.4) popwin:special-display-config)
(push '("*Buffer List*" :height 0.4) popwin:special-display-config)
(push '("*Warnigs*"     :height 0.4) popwin:special-display-config)
(push '("*Completions*" :height 0.4) popwin:special-display-config)
(push '("*Message*"     :height 0.4) popwin:special-display-config)
(push '("*undo-tree*"   :height 0.4) popwin:special-display-config)

(setq max-specpdl-size 6000)
(setq max-lisp-eval-depth 1000)

;; ----------------------------------------------------------------
;; @ auto-heghlight-symbol
;; ----------------------------------------------------------------
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;; ----------------------------------------------------------------
;; @ YaTex 
;; ----------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp/yatex")
;; YaTeX mode
(setq auto-mode-alist
    (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq tex-command "platex")
(setq dviprint-command-format "dvipdfmx %s")
;; use Preview.app
(setq dvi2-command "open -a Preview")
(setq bibtex-command "pbibtex")

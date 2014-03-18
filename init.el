;; @ General
;; ----------------------------------------------------------------

;; パスの設定
(add-to-list 'load-path "~/.emacs.d/elisp")

;; 画面の設定
(setq inhibit-startup-message t)        ;; 起動画面を表示しない
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

;; ----------------------------------------------------------------
;; @ key bind

(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-;") 'comment-dwim) ;Can't use on terminal
(global-set-key (kbd "C-t") 'other-window)
(global-set-key (kbd "C-/") 'undo)
(global-set-key (kbd "C-x C-_") 'redo)
(global-set-key (kbd "M-s") 'goto-line)
(global-set-key (kbd "M-:") 'dabbrev-expand)
(global-set-key (kbd "M-i") 'imenu)

;; (defun ask-before-exit ()
;;   (if ))
;; (global-unset-key (kbd "C-z"))

;; key-chord.el
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)    ;許容範囲は0.04秒
(key-chord-mode 1)

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
;; @ emmet-mode

(require 'emmet-mode)
;; ----------------------------------------------------------------
;; @ scss-mode

(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)))
(add-hook 'scss-mode-hook
          '(lambda() (scss-custom)))

;; ----------------------------------------------------------------
;; @ ruby-mode

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq ruby-deep-indent-paren-style nil)
             (electric-pair-mode t)
             (electric-indent-mode t)
             (electric-layout-mode t)
             (setq electric-pair-pairs '(
                                         (?\| . ?\|)
                                         ))))

;; ----------------------------------------------------------------
;; @ elisp-mode

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (electric-layout-mode t)
             (electric-pair-mode t)
             (electric-indent-mode t)
             (setq electric-pair-pairs '(
                                         (?\| . ?\|)
                                         ))))

;; ----------------------------------------------------------------
;; @ gosh-mode

(setq scheme-program-name "gosh")

;; ----------------------------------------------------------------
;; @ arduino-mode

(require 'arduino-mode)
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode.")

;; ----------------------------------------------------------------
;; @ org-mode

(require 'org)
(add-hook 'org-mode-hook
          '(lambda() (org-src-fontify-buffer)))

;; ソースコードから実行できる
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t) (ruby . t)))

;; メール
(add-hook 'mail-mode-hook 'turn-on-orgtbl)

;; ToDo
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
        (sequence "APPT(a)" "|" "DONE(x)" "CANCEL(x)")))


;; org-remember
(key-chord-define-global "io" 'org-remember)
(org-remember-insinuate)
(setq org-directory "~/memo/")
(setq org-default-notes-file (expand-file-name "memo.org" org-directory))
(setq org-remember-templates
      '(("Note" ?n "** %?\n %i\n %a\n %t" nil "Inbox")
        ("ToDo" ?t "** TODO %?\n %i\n %a\n %t" nil "Inbox")))

;; ----------------------------------------------------------------
;; @ elisp
;; ----------------------------------------------------------------
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

;; ;; ----------------------------------------------------------------
;; ;; @ auto-install.el

;; ;; auto-installの設定
;; ;; ちょっと重いので、普段は外しておく
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
;; @ package.el

;; MELPA、Marmaladeの設定
;; package.elはEmacs24に標準で入っている
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; パッケージ情報の更新
(package-refresh-contents)

;; ----------------------------------------------------------------
;; @ sequential-command.el

(require 'sequential-command-config)
(sequential-command-setup-keys)

;; ----------------------------------------------------------------
;; @ uniquify.el

(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; ----------------------------------------------------------------
;; @ tempbuf.el

(require 'tempbuf)
;; ファイルを開いたら自動的にtempbufを有効にする
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;; diredバッファに対してtempbufを有効にする
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;; ----------------------------------------------------------------
;; @ auto-save-buffers.el

(require 'auto-save-buffers)
;; アイドル2秒で保存
(run-with-idle-timer 2 t 'auto-save-buffers)

;; ----------------------------------------------------------------
;; @ bm.el

(setq-default bm-buffer-persistence nil)
(setq bm-restore-repository-on-load t)
(require 'bm)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hooks 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(global-set-key (kbd "M-SPC") 'bm-toggle)
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)

;; ----------------------------------------------------------------
;; @ open-junk-file.el

(require 'open-junk-file)
(setq open-junk-file-format "~/memo/junk/%Y-%m-%d-%H%M%S.")
(key-chord-define-global "jk" 'open-junk-file)

;; ----------------------------------------------------------------
;; @ anything.el

(when (require 'anything-startup nil t)
  (global-set-key (kbd "C-x b") 'anything))

;;kill-ring 
(setq kill-ring-max 20)
(setq anything-kill-ring-threshold 5)
(global-set-key "\M-y" 'anything-show-kill-ring)

;; ----------------------------------------------------------------
;; @ yasnippet.el

(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        "~/.emacs.d/elisp/yasnippet/snippets" 
        ))
(yas-global-mode 1)

;; 単語展開キーバインド
(custom-set-variables
 '(custom-safe-themes (quote ("73fe242ddbaf2b985689e6ec12e29fab2ecd59f765453ad0e93bc502e6e478d6" default)))
 '(yas-trigger-key "TAB"))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; ----------------------------------------------------------------
;; @ recentf.el

(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1)
  (require 'recentf-ext))

;; ----------------------------------------------------------------
;; @ undo-hist.el

(when (require 'undohist nil t)
    (undohist-initialize))

;; ----------------------------------------------------------------
;; @ undotree.el
;; C-x u で起動

(when (require 'undo-tree nil t)
    (global-undo-tree-mode))

;; ----------------------------------------------------------------
;; @ redo+.el

(require 'redo+)
(setq undo-no-redo t)
(setq undo-limit 60000)
(setq undo-strong-limit 600000)

;; ----------------------------------------------------------------
;; @ pbcopy.el

(require 'pbcopy)
(turn-on-pbcopy)

;; ----------------------------------------------------------------
;; @ smartchr.el

(require 'smartchr)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (progn
               (local-set-key (kbd "H") (smartchr '("H" " => ")))
               (local-set-key (kbd "I") (smartchr '("I" " |`!!'|" "|")))
               (local-set-key (kbd "E") (smartchr '("E" "=" "==" " == ")))
               )))

;; ----------------------------------------------------------------
;; @ wgrep.el

(require 'wgrep nil t)

;; ----------------------------------------------------------------
;; @ wdired.el

(require 'wdired nil t)
;; diredバッファで r を押すとwdiredを起動する
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; ----------------------------------------------------------------
;; @ popwin.le

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
(push '("*Kill Ring*" :height 0.4) popwin:special-display-config)
(push '("*anything*" :height 0.4) popwin:special-display-config)
(push '("*Backtrace*" :height 0.4) popwin:special-display-config)
(push '("*Warnigs*" :height 0.4) popwin:special-display-config)
(push '("*Completions*" :height 0.4) popwin:special-display-config)
(push '("*Message*" :height 0.4) popwin:special-display-config)
(push '("*undo-tree*" :height 0.4) popwin:special-display-config)
;; (push '(dired-mode :position top) popwin:special-display-config)

;; ----------------------------------------------------------------
;; @ auto-heghlight-symbol.el

(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;; ----------------------------------------------------------------
;; @ highlight-symbol.el

(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1")) ;; 使いたい色を設定、repeatしてくれる

;; 適宜keybindの設定
(global-unset-key "\C-o")
(global-set-key (kbd "C-o" ) 'highlight-symbol-at-point)
(global-set-key (kbd "M-o") 'highlight-symbol-remove-all)

;; ----------------------------------------------------------------
;; @ anzu.el

(require 'anzu)

(global-anzu-mode +1)
(setq anzu-search-threshold 1000)
(setq anzu-minimum-input-length 3)

(global-set-key (kbd "M-r") 'anzu-query-replace)
(global-set-key (kbd "M-R") 'anzu-query-replace-regexp)

;; ----------------------------------------------------------------
;; @ smartrep.el expand-region.el multiple-cursors.el

(add-to-list 'load-path "~/.emacs.d/elisp/expand-region/")
(add-to-list 'load-path "~/.emacs.d/elisp/multiple-cursors/")

(require 'smartrep)
(require 'expand-region)
(require 'multiple-cursors)

(global-unset-key "\C-]")
(global-set-key (kbd "C-]") 'er/expand-region)
(global-set-key (kbd "M-]") 'er/contract-region) 

(declare-function smartrep-define-key "smartrep")

(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)

(global-unset-key "\C-l")

(smartrep-define-key global-map "C-l"
  '(("C-l"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'mc/reverse-regions)))

;; ----------------------------------------------------------------
;; @ magit.el

(add-to-list 'load-path "~/.emacs.d/elisp/magit")
(require 'magit)

;; ----------------------------------------------------------------
;; @ bufhistory.el

(require 'bufhistory)
(bufhistory-mode 1)

;; ----------------------------------------------------------------
;; @ git-gutter-fringe

(require 'git-gutter-fringe)

;; If you enable global minor mode
(global-git-gutter-mode t)

;; If you enable git-gutter-mode for some modes
(add-hook 'ruby-mode-hook 'git-gutter-mode)

(global-set-key (kbd "C-c C-t") 'git-gutter:toggle)
(global-set-key (kbd "C-c v h") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-c p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-c n") 'git-gutter:next-hunk)

;; ----------------------------------------------------------------
;; @ Ruby on Rails
;; ----------------------------------------------------------------
;; @ ruby-block.el

(require 'ruby-block)
(ruby-block-mode t)
;; ミニバッファに表示し, かつ, オーバレイする.
(setq ruby-block-highlight-toggle t)

;; ----------------------------------------------------------------
;; @ ruby-end.el
(require 'ruby-end)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (abbrev-mode 1)
             (electric-pair-mode t)
             (electric-indent-mode t)
             (electric-layout-mode t)))

;; ----------------------------------------------------------------
;; @ rcodetools.el

(require 'rcodetools)
(define-key ruby-mode-map (kbd "C-c C-d") 'xmp)

;; ----------------------------------------------------------------
;; @ ido.el rinari.el

(require 'ido)
(ido-mode t)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(when (boundp 'confirm-nonexistent-file-or-buffer)
  (setq confirm-nonexistent-file-or-buffer nil))
(global-set-key (kbd "C-x f") 'ido-find-file-other-window)

(require 'rinari)
(add-hook 'ruby-mode-hook
          (lambda () (rinari-launch)))

;; ----------------------------------------------------------------
;; @ rhtml-mode.el

(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

;; ----------------------------------------------------------------
;; @ flycheck.el, flycheck-color-mode-line

(add-hook 'ruby-mode-hook 'flycheck-mode)

(require 'flycheck-color-mode-line)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

;; flymake
(smartrep-define-key
    global-map "M-g" '(("M-n" . 'flymake-goto-next-error)
                       ("M-p" . 'flymake-goto-prev-error)))

;; ----------------------------------------------------------------
;; @ Re-open read-only files as root automagically

(defun th-rename-tramp-buffer ()
  (when (file-remote-p (buffer-file-name))
    (rename-buffer
     (format "%s:%s"
             (file-remote-p (buffer-file-name) 'method)
             (buffer-name)))))

(add-hook 'find-file-hook
          'th-rename-tramp-buffer)

(defadvice find-file (around th-find-file activate)
  "Open FILENAME using tramp's sudo method if it's read-only."
  (if (and (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat "File "
                             (ad-get-arg 0)
                             " is read-only.  Open it as root? ")))
      (th-find-file-sudo (ad-get-arg 0))
    ad-do-it))

(defun th-find-file-sudo (file)
  "Opens FILE with root privileges."
  (set-buffer (find-file (concat "/sudo::" file))))


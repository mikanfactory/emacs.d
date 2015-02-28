;; ----------------------------------------------------------------
;; @ General
;; ----------------------------------------------------------------
;; パスの設定 & init-loader
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

(add-to-list 'load-path "~/.emacs.d/elisp")


;; ----------------------------------------------------------------
;; @ mode
;; ----------------------------------------------------------------
;; ----------------------------------------------------------------
;; @ elisp
;; ----------------------------------------------------------------
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


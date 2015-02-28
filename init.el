(defvar *emacs-config-directory* (file-name-directory load-file-name))

(add-to-list 'load-path "~/.emacs.d/elisp")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun package-install-with-refresh (package)
  (unless (assq package package-alist)
    (package-refresh-contents))
  (unless (package-installed-p package)
    (package-install package)))

(defun require-or-install (package)
  (or (require package nil t)
      (progn
        (package-install-with-refresh package)
        (require package))))

;; init-loader
(require-or-install 'init-loader)

(setq init-loader-show-log-after-init nil)

(init-loader-load
 (expand-file-name "inits/" *emacs-config-directory*))

(package-refresh-contents)

;; el-get
(defvar *el-get-directory*
  (expand-file-name "el-get/el-get" *emacs-config-directory*))

(add-to-list 'load-path *el-get-directory*)

;; Unless el-get doesn't exist, install it.
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))


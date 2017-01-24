(with-eval-after-load 'go-mode
  (set-go-path)
  (add-company-go-to-laod-path)
  (require 'company-go)
  (setq gofmt-command "goimports"))

(defun set-go-path ()
  (let* ((shell-raw-str (shell-command-to-string
                         "$SHELL --login -i -c 'echo $GOPATH'"))
         (go-path (replace-regexp-in-string
                   "[ \t\n]*$" "" shell-raw-str)))
    (setenv "GOPATH" go-path)))

(defun add-company-go-to-laod-path ()
  (add-to-list 'load-path
               (substitute-in-file-name
                "$GOPATH/src/github.com/nsf/gocode/emacs-company")))

(defun my/go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (define-key evil-normal-state-map (kbd "M-.") 'godef-jump)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2)
  (setq tab-width 2))

(add-hook 'go-mode-hook 'my/go-mode-hook)
(add-hook 'go-mode-hook 'flycheck-mode)

(with-eval-after-load 'go-mode
  (setq gofmt-command "goimports")
  (set-go-path))

(defun set-go-path ()
  (let* ((shell-raw-str (shell-command-to-string
                         "$SHELL --login -i -c 'echo $GOPATH'"))
         (go-path (replace-regexp-in-string
                   "[ \t\n]*$" "" shell-raw-str)))
    (print go-path)
    (setenv "GOPATH" go-path)))

(defun my/go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq tab-width 4))

(add-hook 'go-mode-hook 'my/go-mode-hook)
(add-hook 'go-mode-hook 'flycheck-mode)

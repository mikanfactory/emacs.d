;;; -*- lexical-binding: t -*-
;; ctags-update
(require 'ctags-update)
(setq ctags-update-command "/usr/local/bin/ctags")
(setq ctags-update-delay-seconds (* 3 60))
(-each '(emacs-lisp-mode-hook
         lisp-mode-hook
         ruby-mode-hook
         python-mode-hook
         js2-mode-hook)
  (-lambda (hook) (add-hook hook 'turn-on-ctags-auto-update-mode)))

;; Make new tags in project root directory.
(defvar command-alist '(("rb" . "ripper-tags -e -R -V -f TAGS")
                          ("lisp" . "etags")
                          ("el" . "etags")
                          ("js" . "etags")
                          ("py" . "etags")))

(defvar project-root-name ".git")

(defun project-root-path? (path)
  (f-exists? (f-expand project-root-name path)))

(defun find-project-root ()
  (or (f--traverse-upwards (project-root-path? it)
                           (f-dirname (f-this-file)))
      (user-error "Could not find project root. Please make and retry.")))

(defun find-tags-command (ext)
  (-if-let (command (cdr (assoc ext command-alist)))
      command
      (user-error (format "Command for %s does not exist." ext))))

(defun make-new-tags ()
  (interactive)
  (lexical-let* ((ext (f-ext (f-this-file)))
                 (regexp (format "\\.%s$" ext))
                 (project-root (find-project-root))
                 (command (find-tags-command ext)))
    (when (and command project-root)
      (let ((default-directory (concat project-root "/")))
        (if (string= command "etags")
            (compile (format "find %s -type f 2>/dev/null | grep \"%s\" | xargs etags" "." regexp))
          (compile command))))))

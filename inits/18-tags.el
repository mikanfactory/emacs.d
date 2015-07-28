;;; -*- lexical-binding: t -*-
;; ctags-update
(require 'ctags-update)
(setq ctags-update-command "/usr/local/bin/ctags")
(-each '(emacs-lisp-mode-hook
         lisp-mode-hook
         ruby-mode-hook
         python-mode-hook
         js2-mode-hook)
  (-lambda (hook) (add-hook hook 'turn-on-ctags-auto-update-mode)))

;; Make new tags in project root directory.
(defvar *command-alist* '(("rb" . "ripper-tags -e -R -V -f TAGS")
                          ("el" . "etags")
                          ("js" . "etags")
                          ("py" . "etags")))

(defun project-root-path? (path)
  (f-exists? (f-expand ".git" path)))

(defun find-project-root ()
  (let ((path (f--up (or (f-root? it)
                         (project-root-path? it))
                     (f-this-file))))
    (if (f-root? path)
        (error "Project root was not found. Please make and retry.")
        path)))

(defun find-tags-command (ext)
  (-if-let (command (cdr (assoc ext *command-alist*)))
      command
      (error (format "Command for %s does not exist." ext))))

(defun make-new-tags ()
  (interactive)
  (lexical-let* ((ext (f-ext (f-this-file)))
                 (regexp (format "\\.%s$" ext))
                 (current-dir (f-dirname (f-this-file)))
                 (command (find-tags-command ext)))
    (when command
      (-when-let (project-root (find-project-root))
        (if (string= command "etags")
            (run-etags-command regexp project-root current-dir)
            (run-original-command command project-root current-dir))))))

(defun run-etags-command (regexp project-root current-dir)
  (shell-cd project-root)
  (shell-command
   (format "find %s -type f 2>/dev/null | grep \"%s\" | xargs etags"
           "." regexp))          
  (shell-cd current-dir))

(defun run-original-command (command project-root current-dir)
  (shell-cd project-root)
  (shell-command command)
  (shell-cd current-dir))

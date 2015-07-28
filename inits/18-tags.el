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
                          ("el" . "etags -R *.el")
                          ("js" . "etags -R *.js")
                          ("py" . "etags -R *.py")))

(defun project-root-path? (path)
  (f-exists? (f-expand ".git" path)))

(defun find-project-root ()
  (let ((path (f--up (or (f-root? it)
                         (project-root-path? it)
                     (f-this-file)))))
    (if (f-root? path)
        (error "Project root was not found. Please make and retry.")
        path)))

(defun find-tags-command (ext)
  (-if-let (command (cdr (assoc ext *command-alist*)))
      command
      (error (format "Command for %s does not exist." ext))))

(defun make-new-tags ()
  (interactive)
  (let ((ext (f-ext (f-this-file)))
        (current-dir (f-dirname (f-this-file))))
    (-when-let (command (find-tags-command ext))
      (-when-let (project-root (find-project-root))
        (shell-cd project-root)
        (async-shell-command command "*Messages*" "*Warnings*")
        (shell-cd current-dir)))))


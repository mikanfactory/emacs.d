(require 'web-mode)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-comment-style 2)

(require 'js2-mode)
(custom-set-variables '(js2-basic-offset 2))
(add-hook 'javascript-mode-hook 'flycheck-mode)

;; (defgroup mocha nil
;;   "Run mocha quickly"
;;   :prefix "mocha"
;;   :group 'languages)

;; (defcustom mocha-reporter "spec"
;;   "Used in reporter option"
;;   :type 'string
;;   :group 'mocha)

;; (defcustom mocha-project-root-specifier "node_modules"
;;   "Search this directory as a project root"
;;   :type 'string
;;   :group 'mocha)

;; (defvar mocha-previous-command nil
;;   "Previously hit command")

;; (defvar mocha-previous-directory nil
;;   "Previous directory which hit command in last time")

;; (defvar mocha-describe-regexp "describe[\s\t()]+'\\([a-z|A-Z|1-9|#_?!()]*\\)'[,\s\t]+"
;;   "match describe function")

;; (defun mocha-project-root-path (file)
;;   "Return project root path specified by `mocha-project-root-specifier'"
;;   (or (f--traverse-upwards (f-exists? (f-expand mocha-project-root-specifier it))
;;                            (f-dirname file))
;;       (user-error "Could not find project root. Please make it and retry.")))

;; (defun mocha-executable-path (file project-root)
;;   "Return path where mocha file left"
;;   (or (executable-find "mocha")
;;       (executable-find (f-join project-root "node_modules" ".bin" "mocha"))
;;       (user-error "Could not find `mocha.js'. Please install and retry.")))

;; (defun* mocha-make-minimum-command (exec-path &optional (opt nil opt-supplied-p))
;;   "Return command like `mocha --reporter spec'"
;;   (append (list exec-path (format "--reporter %s" mocha-reporter))
;;           opt))

;; (defun mocha-grep-option (target)
;;   "Return mocha's grep option like `-g Array#filter'"
;;   (list "-g" (format "'%s'" target)))

;; (defun* mocha-make-command (file exec-path &optional (opt nil opt-supplied-p))
;;   "Return complete command like `mocha --reporter spec -g Array#filter'"
;;   (s-join " "
;;           (append (mocha-make-minimum-command exec-path) opt (list file))))

;; (defun mocha-cd-and-run-command (destination command)
;;   "Change directory to project root and run mocha"
;;   (let ((default-directory (f-slash destination)))
;;     (compile command)))

;; ;;;###autoload
;; (defun mocha-run-this-file ()
;;   "Run only this file"
;;   (interactive)
;;   (lexical-let* ((file (f-this-file))
;;                  (project-root (mocha-project-root-path file))
;;                  (exec-path (mocha-executable-path file project-root))
;;                  (command (mocha-make-command file exec-path)))
;;     (setq mocha-previous-command command)
;;     (setq mocha-previous-directory (f-dirname file))
;;     (compile command)))

;; ;;;###autoload
;; (defun mocha-run-at-point ()
;;   "Run only nearest pointer"
;;   (interactive)
;;   (lexical-let* ((file (f-this-file))
;;                  (project-root (mocha-project-root-path file))
;;                  (exec-path (mocha-executable-path file project-root)))
;;     (save-excursion
;;       (end-of-line)
;;       (or (re-search-backward mocha-describe-regexp nil t)
;;           (user-error "Could not find spec before this point."))
;;       (lexical-let* ((target (match-string 1))
;;                      (command (mocha-make-command
;;                                file exec-path (mocha-grep-option target))))
;;         (setq mocha-previous-command command)
;;         (setq mocha-previous-directory (f-dirname file))
;;         (compile command)))))

;; ;;;###autoload
;; (defun mocha-run-all-test ()
;;   "Run all spec file belongs to project root"
;;   (interactive)
;;   (lexical-let* ((file (f-this-file))
;;                  (project-root (mocha-project-root-path file))
;;                  (exec-path (mocha-executable-path file project-root))
;;                  (command (mocha-make-command "" exec-path)))
;;     (setq mocha-previous-command command)
;;     (setq mocha-previous-directory project-root)
;;     (mocha-cd-and-run-command project-root command)))

;; ;;;###autoload
;; (defun mocha-run-previous-process ()
;;   "Rerun command"
;;   (interactive)
;;   (lexical-let ((previous-dir mocha-previous-directory)
;;                 (previous-command mocha-previous-command))
;;     (if (and previous-dir previous-command)
;;         (mocha-cd-and-run-command previous-dir previous-command)
;;       (user-error "Could not find previous process. Please run other command."))))

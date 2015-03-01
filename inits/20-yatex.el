(require-or-install 'yatex)
(setq tex-command "platex")
(setq dviprint-command-format "dvipdfmx %s")

;; use Preview.app
(setq dvi2-command "open -a Preview")
(setq bibtex-command "pbibtex")

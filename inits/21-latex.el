;; yatex-mode
(with-eval-after-load 'yatex
  (setq tex-command "platex")
  (setq dviprint-command-format "dvipdfmx %s")
  (setq dvi2-command "open -a Preview")
  (setq bibtex-command "pbibtex"))

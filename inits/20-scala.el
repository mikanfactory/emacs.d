(require 'ensime)
(require 'sbt-mode)
(require 'scala-mode)
(setq ensime-startup-snapshot-notification nil)

(add-hook 'scala-mode-hook 'ensime)
(add-hook 'scala-mode-hook 'flycheck-mode)

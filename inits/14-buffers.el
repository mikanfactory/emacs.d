;; tempbuf
(require 'tempbuf)
;; ファイルを開いたら自動的にtempbufを有効にする
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'ag-mode-hook 'turn-on-tempbuf-mode)

;; auto-save-buffers
(require 'auto-save-buffers)
;; アイドル2秒で保存
(run-with-idle-timer 0.2 t 'auto-save-buffers)


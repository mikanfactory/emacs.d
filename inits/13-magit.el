(require 'magit)

(setq magit-last-seen-setup-instructions "1.4.0")

;; evil keybinds
;; (evil-set-initial-state 'magit-log-edit-mode 'insert)
;; (evil-set-initial-state 'git-commit-mode 'insert)
;; (evil-set-initial-state 'magit-commit-mode 'motion)
;; (evil-set-initial-state 'magit-status-mode 'motion)
;; (evil-set-initial-state 'magit-log-mode 'motion)
;; (evil-set-initial-state 'magit-wassup-mode 'motion)
;; (evil-set-initial-state 'magit-mode 'motion)
;; (evil-set-initial-state 'git-rebase-mode 'motion)

;; (evil-define-key 'motion git-rebase-mode-map
;;   "c" 'git-rebase-pick
;;   "r" 'git-rebase-reword
;;   "s" 'git-rebase-squash
;;   "e" 'git-rebase-edit
;;   "f" 'git-rebase-fixup
;;   "y" 'git-rebase-insert
;;   "d" 'git-rebase-kill-line
;;   "u" 'git-rebase-undo
;;   "x" 'git-rebase-exec
;;   (kbd "<return>") 'git-rebase-show-commit
;;   "\M-n" 'git-rebase-move-line-down
;;   "\M-p" 'git-rebase-move-line-up)

;; (evil-define-key 'motion magit-commit-mode-map
;;   "\C-c\C-b" 'magit-show-commit-backward
;;   "\C-c\C-f" 'magit-show-commit-forward)

;; (evil-define-key 'motion magit-status-mode-map
;;   "\C-f" 'evil-scroll-page-down
;;   "\C-b" 'evil-scroll-page-up
;;   "." 'magit-mark-item
;;   "=" 'magit-diff-with-mark
;;   "C" 'magit-add-log
;;   "I" 'magit-ignore-item-locally
;;   "S" 'magit-stage-all
;;   "U" 'magit-unstage-all
  
;;   "X" 'magit-reset-working-tree
;;   "d" 'magit-discard-item
;;   "i" 'magit-ignore-item
;;   "s" 'magit-stage-item
;;   "u" 'magit-unstage-item
;;   "z" 'magit-key-mode-popup-stashing)

;; (evil-define-key 'motion magit-log-mode-map
;;   "." 'magit-mark-item
;;   "=" 'magit-diff-with-mark
;;   "e" 'magit-log-show-more-entries)

;; (evil-define-key 'motion magit-wazzup-mode-map
;;   "." 'magit-mark-item
;;   "=" 'magit-diff-with-mark
;;   "i" 'magit-ignore-item)

;; (evil-set-initial-state 'magit-branch-manager-mode 'motion)
;; (evil-define-key 'motion magit-branch-manager-mode-map
;;   "a" 'magit-add-remote
;;   "c" 'magit-rename-item
;;   "d" 'magit-discard-item
;;   "o" 'magit-create-branch
;;   "v" 'magit-show-branches
;;   "T" 'magit-change-what-branch-tracks)

;; (evil-define-key 'motion magit-mode-map
;;   "\M-1" 'magit-show-level-1-all
;;   "\M-2" 'magit-show-level-2-all
;;   "\M-3" 'magit-show-level-3-all
;;   "\M-4" 'magit-show-level-4-all
;;   "\M-H" 'magit-show-only-files-all
;;   "\M-S" 'magit-show-level-4-all
;;   "\M-h" 'magit-show-only-files
;;   "\M-s" 'magit-show-level-4
;;   "!" 'magit-key-mode-popup-running
;;   "$" 'magit-process
;;   "+" 'magit-diff-larger-hunks
;;   "-" 'magit-diff-smaller-hunks
;;   "=" 'magit-diff-default-hunks
;;   "/" 'evil-search-forward
;;   ":" 'evil-ex
;;   ";" 'magit-git-command
;;   "?" 'evil-search-backward
;;   "<" 'magit-key-mode-popup-stashing
;;   "A" 'magit-cherry-pick-item
;;   "B" 'magit-key-mode-popup-bisecting
;;   "D" 'magit-revert-item
;;   "E" 'magit-ediff
;;   "F" 'magit-key-mode-popup-pulling
;;   "G" 'evil-goto-line
;;   "H" 'magit-rebase-step
;;   "J" 'magit-key-mode-popup-apply-mailbox
;;   "K" 'magit-key-mode-popup-dispatch
;;   "L" 'magit-add-change-log-entry
;;   "M" 'magit-key-mode-popup-remoting
;;   "N" 'evil-search-previous
;;   "P" 'magit-key-mode-popup-pushing
;;   "Q" 'magit-quit-session
;;   "R" 'magit-refresh-all
;;   "S" 'magit-stage-all
;;   "U" 'magit-unstage-all
;;   "W" 'magit-diff-working-tree
;;   "X" 'magit-reset-working-tree
;;   "Y" 'magit-interactive-rebase
;;   "Z" 'magit-key-mode-popup-stashing
;;   "a" 'magit-apply-item
;;   "b" 'magit-key-mode-popup-branching
;;   "c" 'magit-key-mode-popup-committing
;;   "e" 'magit-diff
;;   "f" 'magit-key-mode-popup-fetching
;;   "g?" 'magit-describe-item
;;   "g$" 'evil-end-of-visual-line
;;   "g0" 'evil-beginning-of-visual-line
;;   "gE" 'evil-backward-WORD-end
;;   "g^" 'evil-first-non-blank-of-visual-line
;;   "g_" 'evil-last-non-blank
;;   "gd" 'evil-goto-definition
;;   "ge" 'evil-backward-word-end
;;   "gg" 'evil-goto-first-line
;;   "gj" 'evil-next-visual-line
;;   "gk" 'evil-previous-visual-line
;;   "gm" 'evil-middle-of-visual-line
;;   "h" 'magit-key-mode-popup-rewriting
;;   "j" 'magit-goto-next-section
;;   "k" 'magit-goto-previous-section
;;   "l" 'magit-key-mode-popup-logging
;;   "m" 'magit-key-mode-popup-merging
;;   "n" 'evil-search-next
;;   "o" 'magit-key-mode-popup-submodule
;;   "p" 'magit-cherry
;;   "q" 'magit-mode-quit-window
;;   "r" 'magit-refresh
;;   "t" 'magit-key-mode-popup-tagging
;;   "v" 'magit-revert-item
;;   "w" 'magit-wazzup
;;   "x" 'magit-reset-head
;;   "y" 'magit-copy-item-as-kill
;;   ;z  position current line
;;   " " 'magit-show-item-or-scroll-up
;;   "\d" 'magit-show-item-or-scroll-down
;;   "\t" 'magit-visit-item
;;   (kbd "<return>")   'magit-toggle-section
;;   (kbd "C-<return>") 'magit-dired-jump
;;   (kbd "<backtab>")  'magit-expand-collapse-section
;;   (kbd "C-x 4 a")    'magit-add-change-log-entry-other-window
;;   (kbd "\M-d") 'magit-copy-item-as-kill)

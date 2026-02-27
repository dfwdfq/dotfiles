;;#function name: verse-insert
;;#arguments: none
;;#description: insert verse in org mode.
;;#.
(defun verse-insert ()
  "Insert verse in org mode"
  (interactive)
  (insert "#+BEGIN_VERSE\n\n#+END_VERSE")
  (forward-line -1))

;;#function name: source-insert
;;#arguments: none
;;#description: insert source block in org mode.
;;#.
(defun source-insert ()
  "Insert source in org mode"
  (interactive)
  (insert "#+BEGIN_SRC\n\n#+END_SRC")
  (forward-line -2))

(require 'org)
;;#keybinding: M-v v
;;#description: insert verse in org-mode.
;;#.
(define-key org-mode-map (kbd "M-v v") #'verse-insert)
;;#keybinding: M-v c
;;#description: insert source in org-mode.
;;#.
(define-key org-mode-map (kbd "M-v c") #'source-insert)

(provide 'org-extras)

(defun verse-insert ()
  "Insert verse in org mode"
  (interactive)
  (insert "#+BEGIN_VERSE\n\n#+END_VERSE")
  (forward-line -1))

(defun source-insert ()
  "Insert source in org mode"
  (interactive)
  (insert "#+BEGIN_SRC\n\n#+END_SRC")
  (forward-line -2))

(require 'org)
(define-key org-mode-map (kbd "M-v v") #'verse-insert)
(define-key org-mode-map (kbd "M-v c") #'source-insert)

(provide 'org-extras)

(defun tag-line-p (s)
  (string-prefix-p "#+TAGS:" s))
(defun tag-line-or-nil (s)
  (if (tag-line-p s) s nil))      
(defun note-read-tag-line (f)
  (let ((lines (with-temp-buffer
		 (insert-file-contents f nil 0 400)
		 (split-string (buffer-string) "\n" t))))
    (if (<= (length lines) 2)
	nil
      (tag-line-or-nil (nth 2 lines)))))
(defun note-tags (f)
  (let ((tl (note-read-tag-line f)))
    (if (null tl)
	'()
      (cdr
       (split-string
	tl " ")))))

(provide 'notes)

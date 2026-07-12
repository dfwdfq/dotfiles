(load (expand-file-name "~/.config/emacs/lisp/docs.el"))
(load (expand-file-name "~/.config/emacs/lisp/notes.el"))
(require 'docs)
(require 'notes)




(defun get-longest (ls)
  (let
      ((max-len (car (sort (mapcar #'length ls) '>))))
    (seq-find
     #'(lambda (x)
	 (= max-len (length x)))
     ls)))
(defun get-shortest (ls)
  (let
      ((min-len (car (sort (mapcar #'length ls) '<))))
    (seq-find
     #'(lambda (x)
	 (= min-len (length x)))
     ls)))
(defun make-green (s)
  (concat "=" s "="))
(defun dirs-names (ls)  
  (mapcar
   #'(lambda (x)
       (file-name-nondirectory x))
   ls))



(defvar category-dirs-names (dirs-names category-dirs))
(defvar special-dirs-names (dirs-names special-dirs))
(defvar all-dirs-names (list-unite category-dirs-names special-dirs-names))

(defun max-len (lss)
  (length (get-longest all-dirs-names)))



(defvar tags-all-raw
  (list-utils-flatten (mapcar
		       #'note-tags
		       all-org-files)))
(defun tag-freq-count (tag)
  (seq-count
   #'(lambda (x)
       (if (string= x tag) t nil))
   tags-all-raw))

(defvar tags
  (let* ((vals (seq-uniq tags-all-raw))
	 (pairs (mapcar
		 #'(lambda (tag)
		     (cons tag (tag-freq-count tag)))
		 vals)))
    (cdr
     (sort
      pairs
      (lambda (x y) (> (cdr x) (cdr y)))))))

(defun high-freq-p (e)
  (> (cdr e) 50))
(defun med-freq-p (e)
  (and 
   (> (cdr e) 20)
   (not (high-freq-p e))))
(defun low-freq-p (e)
  (and
   (not (high-freq-p e))
   (not (med-freq-p e))))

(defvar high-freq-tags
  (seq-filter #'high-freq-p tags))
(defvar med-freq-tags
  (seq-filter #'med-freq-p tags))
(defvar low-freq-tags
  (seq-filter #'low-freq-p tags))

(defun ABS (n)
    (if (<= n 0)
	(* n -1)
      n))
(defun align (s ls)
  (concat (if (= (length s) max-len) " " " ")
  (make-string
   (ABS (- (max-len ls) (length s)))
   ?\s)))
(defun align-tag (tag)
  (if (string= tag ":category:")
      (make-string 4 ?\s)
      (make-string 5 ?\s)))

(defun full-dir-path (s)
  (expand-file-name s "~/docs/"))
(defun insert-dir-size (s)
  (concat
   " "
   (number-to-string (dir-length (full-dir-path s)))
   "n"))
(defun insert-dir-link (s)
  (concat
   "[[" (full-dir-path s) "]"
   "[OPEN]]" ))

(defun insert-list (ls tag)
  (mapcar
   #'(lambda (x) (insert "** "
			 x
			 (align x ls)
			 (make-green tag)
			 (align-tag tag)
 			 (insert-dir-link x)
			 "   "
			 (insert-dir-size x)
			 "\n"
			 ))
   ls))
(defun insert-tags-list (ls)
  (mapcar
   #'(lambda (x)
       (insert "  - "
	       (car x)
;;	       (align (car x))
	       " :: used "
	       (number-to-string (cdr x))
	       " /times/\n"))
   ls))

(defun insert-common-info ()
  (interactive)
  (let ((count (number-to-string (total-amount))))
    (insert "- total notes amount :: " count "\n")
    (insert "* Directories \n")
    (insert-list category-dirs-names ":category:")
    (insert-list special-dirs-names ":special:")
;;    (insert "* Tags \n")
;;    (insert "** High frequency \n")
    ;(setq max-len (length (get-longest (mapcar #'car high-freq-tags))))
;;    (insert-tags-list high-freq-tags)
    )) 
    


(defun manage-diary ()
  "Create a buffer for diary management"
  (interactive)
    (let ((buf (get-buffer-create "*diary-manager*")))
    (switch-to-buffer buf)
    (goto-char (point-min))    
    (erase-buffer)
    (message "getting your shit together once more!")
    (insert-common-info)
    (org-mode)))

(provide 'diary-buffer)

(load (expand-file-name "~/.config/emacs/lisp/docs.el"))
(require 'docs)


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
(defvar all-dirs-names (seq-concatenate 'list category-dirs-names special-dirs-names))
(defvar max-len (length (get-longest all-dirs-names)))
(defvar min-len (length (get-shortest all-dirs-names)))

(defun ABS (n)
    (if (<= n 0)
	(* n -1)
      n))
(defun align (s)
  (concat (if (= (length s) max-len) " " " ")
  (make-string
   (ABS (- max-len (length s)))
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
			 (align x)
			 (make-green tag)
			 (align-tag tag)
 			 (insert-dir-link x)
			 "   "
			 (insert-dir-size x)
			 "\n"
			 ))
   ls))

(defun insert-common-info ()
  (interactive)
  (let ((count (number-to-string (total-amount))))
    (insert "- total notes amount :: " count "\n")
    (insert "* Directories \n")
    (insert-list category-dirs-names ":category:")
    (insert-list special-dirs-names ":special:")
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

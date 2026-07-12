(defconst root-dir "~/docs" "the diary entrance")
(defconst org-file-regex  ".*\.org" "matches any org file")

(defun conv-to-full-paths (root lst)
  "append to each element root directory"
  (mapcar
   (lambda (x)
     (concat root "/" x))
   lst))
(defun root-dir-files ()
  "get content of root directory"
  (conv-to-full-paths
   root-dir
   (directory-files root-dir)))

(defun bad-dir-p (dir-name)
  "matches . .. .git"
  (or
   (string-suffix-p "/." dir-name)
   (string-suffix-p "/.." dir-name)
   (string-suffix-p "/.git" dir-name)))
(defun good-dir-p (dir-name)
  "evals t if given name indicates regular dir"
  (and
   (not (bad-dir-p dir-name))
   (file-directory-p dir-name)))
(defun sub-dirs (dir-content)
  "returns list of subdirectories"
  (seq-filter
   #'good-dir-p
   dir-content))

(defun category-p (s)
  (or
   (string-suffix-p "idea" s)
   (string-suffix-p "personal" s)
   (string-suffix-p "philosophy" s)
   (string-suffix-p "tech" s)
   (string-suffix-p "job" s)))

(defvar sub-root-dirs (sub-dirs (root-dir-files)) "accesible directories to work with")
(defvar category-dirs (seq-filter
		       #'category-p
		       sub-root-dirs))
(defvar special-dirs (seq-filter
		      #'(lambda (x) (not (category-p x)))
		      sub-root-dirs))

			    

(defun sub-dir-p (name sub-dirs)
  "t if name in sub-dirs"
  (seq-find
   #'(lambda (x)
       (string= x name))
   sub-dirs))
(defun dir-length (dir-name)
  "returns amount of org files in given directory"
  (length
   (directory-files-recursively dir-name org-file-regex)))
(defun total-amount ()
    "returns total amount of org files in diary"
  (seq-reduce
   #'+
   (mapcar
    #'dir-length
    sub-root-dirs)
   0))

(provide 'docs)

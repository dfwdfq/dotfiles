;;#function name: create-note
;;#arguments: none
;;#description: interactively create org note.
;;#.
(defun create-note ()
  "Ask user for filename and and title."
  (interactive)
  (let* ((filename (read-string "Enter filename: " "new-note.org"))
	 (title    (read-string "Enter title:"))
	 (type     (read-string "Enter type[personal|tech|philosophy|job|idea]:"))
	 (default-dir (concat "~/docs/" type)))

    
    ;; Add .org extension if not present
    (unless (string-match "\\.[a-zA-Z]+$" filename)
      (setq filename (concat filename ".org")))
    ;; Create file in specified directory
    (find-file (expand-file-name filename default-dir))
    (insert "#+title: " title "\n")
    (insert "#+date: " (format-time-string "%Y-%m-%d %H:%M") "\n")
    (insert "#+TAGS: ")))

(defun create-daily-note ()
  (interactive)
  (find-file
   (expand-file-name
    (concat
     (format-time-string "%Y-%m-%d")
     ".org") "~/docs/daily")))

(defun create-todo ()
  "Ask user for todo list filename."
  (interactive)
  (let* ((filename (read-string "Enter filename (no .org):"))
	 (title filename)
	 (default-dir "~/docs/todos/"))

        ;; Add .org extension if not present
    (unless (string-match "\\.[a-zA-Z]+$" filename)
      (setq filename (concat filename ".org")))

    (find-file (expand-file-name filename default-dir))
    (insert "#+title: " title "\n")
    (insert "#+date: " (format-time-string "%Y-%m-%d %H:%M") "\n")))

(defun open-inbox ()
  "open todos/inbox.org"
  (interactive)
  (find-file "~/docs/todos/inbox.org"))
    

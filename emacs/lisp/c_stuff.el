;;#function name: create-source-header
;;#arguments: none
;;#description: create header file and associated source file.
;;#.
(defun create-source-header ()
  "Create header file and associated source file."
  (interactive)
  (let* ((filename (read-string "Enter file name (no .h): "))
         (c-file (concat filename ".c"))
         (h-file (concat filename ".h"))
         (guard-var (concat (upcase filename) "_H")))
    
    (find-file c-file)
    (insert "#include \"" h-file "\"\n\n")
    (save-buffer)
    
    (find-file h-file)
    (insert "#ifndef " guard-var "\n")
    (insert "#define " guard-var "\n\n")
    (insert "#endif /* " guard-var " */\n")
    (save-buffer)))

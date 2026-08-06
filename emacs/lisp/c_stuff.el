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

(use-package company-c-headers
  :ensure t
  :after company)
(defun my-c-autosuggest-setup ()
  (set (make-local-variable 'company-backends)
       '((company-c-headers   
          company-clang       
          company-keywords    
          company-dabbrev-code)
         company-dabbrev))) 


(add-hook 'c-mode-hook #'my-c-autosuggest-setup)
(add-hook 'c++-mode-hook #'my-c-autosuggest-setup)

(setq company-idle-delay 0.1)          
(setq company-minimum-prefix-length 2) 

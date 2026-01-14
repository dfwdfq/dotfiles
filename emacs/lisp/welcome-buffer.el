(defvar welcome-logo
  '("\u2804\u2804\u2804\u28b0\u28e7\u28fc\u28ef\u2804\u28f8\u28e0\u28f6\u28f6\u28e6\u28fe\u2804\u2804\u2804\u2804\u2840\u2804\u2880\u28ff\u28ff\u2804\u2804\u2804\u28b8\u2847\u2804\u2804"
    "\u2804\u2804\u2804\u28fe\u28ff\u283f\u283f\u2836\u283f\u28bf\u28ff\u28ff\u28ff\u28ff\u28e6\u28e4\u28c4\u2880\u2845\u28a0\u28fe\u28db\u2849\u2804\u2804\u2804\u2838\u2880\u28ff\u2804"
    "\u2804\u2804\u2880\u284b\u28e1\u28f4\u28f6\u28f6\u2840\u2804\u2804\u2819\u28bf\u28ff\u28ff\u28ff\u28ff\u28ff\u28f4\u28ff\u28ff\u28ff\u2883\u28e4\u28c4\u28c0\u28e5\u28ff\u28ff\u2804"
    "\u2804\u2804\u28b8\u28c7\u283b\u28ff\u28ff\u28ff\u28e7\u28c0\u2880\u28e0\u284c\u28bb\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u283f\u283f\u283f\u28ff\u28ff\u28ff\u2804"
    "\u2804\u2880\u28b8\u28ff\u28f7\u28e4\u28e4\u28e4\u28ec\u28d9\u28db\u28bf\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u287f\u28ff\u28ff\u284d\u2804\u2804\u2880\u28e4\u28c4\u2809\u280b\u28f0"
    "\u2804\u28fc\u28d6\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28bf\u28ff\u28ff\u28ff\u28ff\u28ff\u2887\u28ff\u28ff\u2877\u2836\u2836\u28bf\u28ff\u28ff\u2807\u2880\u28e4"
    "\u2818\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28fd\u28ff\u28ff\u28ff\u2847\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28f7\u28f6\u28e5\u28f4\u28ff\u2857"
    "\u2880\u2808\u28bf\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u285f\u2804"
    "\u28b8\u28ff\u28e6\u28cc\u28db\u28fb\u28ff\u28ff\u28e7\u2819\u281b\u281b\u286d\u2805\u2812\u2826\u282d\u28ed\u287b\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u287f\u2803\u2804"
    "\u2818\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u2846\u2804\u2804\u2804\u2804\u2804\u2804\u2804\u2804\u2839\u2808\u288b\u28fd\u28ff\u28ff\u28ff\u28ff\u28f5\u28fe\u2803\u2804"
    "\u2804\u2818\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u2804\u28f4\u28ff\u28f6\u28c4\u2804\u28f4\u28f6\u2804\u2880\u28fe\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u2803\u2804\u2804"
    "\u2804\u2804\u2808\u283b\u28ff\u28ff\u28ff\u28ff\u28ff\u28ff\u2844\u28bb\u28ff\u28ff\u28ff\u2804\u28ff\u28ff\u2840\u28fe\u28ff\u28ff\u28ff\u28ff\u28db\u281b\u2801\u2804\u2804\u2804"
    "\u2804\u2804\u2804\u2804\u2808\u281b\u28bf\u28ff\u28ff\u28ff\u2801\u281e\u28bf\u28ff\u28ff\u2844\u28bf\u28ff\u2847\u28f8\u28ff\u28ff\u283f\u281b\u2801\u2804\u2804\u2804\u2804\u2804"
    "\u2804\u2804\u2804\u2804\u2804\u2804\u2804\u2809\u283b\u28ff\u28ff\u28fe\u28e6\u2859\u283b\u28f7\u28fe\u28ff\u2803\u283f\u280b\u2801\u2804\u2804\u2804\u2804\u2804\u2880\u28e0\u28f4"
    "\u28ff\u28ff\u28ff\u28f6\u28f6\u28ee\u28e5\u28d2\u2832\u28ae\u28dd\u287f\u28ff\u28ff\u2846\u28ff\u287f\u2803\u2804\u2804\u2804\u2804\u2804\u2804\u2804\u28e0\u28f4\u28ff\u28ff\u28ff")
  "ASCII art logo for welcome screen.")


(defun create-note ()
  "Ask user for filename and and title."
  (interactive)
  (let* ((filename (read-string "Enter filename: " "new-note.org"))
	 (title    (read-string "Enter title:"))
	 (type     (read-string "Enter type[personal|tech|philosophy]:"))
	 (default-dir (concat "~/docs/" type)))

    
    ;; Add .org extension if not present
    (unless (string-match "\\.[a-zA-Z]+$" filename)
      (setq filename (concat filename ".org")))
    ;; Create file in specified directory
    (find-file (expand-file-name filename default-dir))
    (insert "#+title: " title "\n")
    (insert "#+date: " (format-time-string "%Y-%m-%d %H:%M") "\n")
    
    (kill-buffer "*Welcome*")))

(defun make-button (text action)
  "Create a button that works when point is on it."
  (let ((start (point)))
    (insert text)
    (put-text-property start (point) 'keymap
                       (let ((map (make-sparse-keymap)))
                         (define-key map [return] action)
                         (define-key map (kbd "C-m") action)
                         map))
    (put-text-property start (point) 'face '(:foreground "magenta" :underline t :weight bold))
    (put-text-property start (point) 'help-echo "Press RET to create new file")
    ;; Make the button writable for keymap to work, even in read-only buffer
    (put-text-property start (point) 'read-only nil)
    (put-text-property start (point) 'front-sticky '(read-only))
    (put-text-property start (point) 'rear-nonsticky '(read-only))))

(defun display-welcome-buffer ()
  "Display welcome buffer with centered ASCII art and buttons."
  (interactive)
  ;; Simple condition: only show welcome if no files were opened
  (when (equal (buffer-name) "*scratch*")
    (let* ((logo-lines welcome-logo)
           (logo-width (apply 'max (mapcar 'string-width logo-lines)))
           (window-width (window-body-width))
           (padding (/ (- window-width logo-width) 2))
           (buf (get-buffer-create "*Welcome*")))

      ;; Build and show buffer
      (with-current-buffer buf
        (let ((inhibit-read-only t))
          (erase-buffer)
          
          ;; Insert centered logo
          (dolist (line logo-lines)
            (insert (make-string (max 0 padding) ? ) line "\n"))
          
          ;; Add spacing and centered buttons
          (insert "\n\n")
          (let ((button-padding (max 0 (/ (- window-width 20) 2)))) ; Adjust for button width
	    
            (insert (make-string button-padding ? ))
            (make-button "[Write Org Note]" #'create-note)
            (insert "\n")
	    (insert (make-string button-padding ? ))
	    (make-button "[Open .emacs]" #'open-config)

	    

	    ;;(insert (make-string button-padding ? ))
            ;;(make-button "[See Dot Files]" #'dotfiles-manager)

            ;; Position cursor on the first button
            (goto-char (point-min))
            (forward-line (length logo-lines))
            (forward-line 2)  ; Move past the empty lines
            (forward-char button-padding))

          (face-remap-add-relative 'default :foreground "magenta")

          ;; Make buffer read-only but allow buttons to work
          (read-only-mode 1)))

      (switch-to-buffer buf))))


(provide 'welcome-buffer)
;;; welcome-buffer.el ends here

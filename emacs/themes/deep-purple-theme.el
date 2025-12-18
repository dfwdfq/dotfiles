(deftheme deep-purple
  "A deep purple theme with dark background and bright foreground")

(let (
      ;; Base colors
      (bg-primary   "#0a0a15")
      (bg-secondary "#1a1a2e")
      (bg-tertiary  "#3a3a55")
      (fg-primary   "#f8f8ff")
      (fg-secondary "#e0e0ff")
      (fg-tertiary  "#a8a8d0")
      
      ;; Accent colors - matching your Kitty theme
      (purple-light "#e7cfff")
      (purple-med   "#c097ff")
      (purple-dark  "#9d6bff")
      (pink         "#ff6b9c")
      (pink-light   "#ff9db8")
      (green        "#6bff9c")
      (green-light  "#9dffb8")
      (yellow       "#ffd46b")
      (yellow-light "#ffe79d")
      (cyan         "#6bd8ff")
      (cyan-light   "#9de7ff")
      (magenta      "#ff6bff")
      (magenta-light "#ff9dff")
      (white        "#ffffff")
      )

  (custom-theme-set-faces
   'deep-purple
   
   ;; Basic faces
   `(default ((t (:background ,bg-primary :foreground ,fg-primary))))
   `(cursor ((t (:background ,purple-light))))
   `(highlight ((t (:background ,bg-tertiary))))
   `(region ((t (:background ,bg-tertiary :foreground ,white))))
   `(fringe ((t (:background ,bg-primary))))
   `(mode-line ((t (:background ,bg-tertiary :foreground ,fg-primary :box nil))))
   `(mode-line-inactive ((t (:background ,bg-secondary :foreground ,fg-tertiary :box nil))))
   `(header-line ((t (:background ,bg-secondary :foreground ,fg-primary))))
   `(minibuffer-prompt ((t (:foreground ,purple-light :weight bold))))

   ;; Syntax highlighting
   `(font-lock-comment-face ((t (:foreground ,fg-tertiary :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,fg-tertiary))))
   `(font-lock-string-face ((t (:foreground ,green-light))))
   `(font-lock-doc-face ((t (:foreground ,green))))
   `(font-lock-keyword-face ((t (:foreground ,pink :weight bold))))
   `(font-lock-builtin-face ((t (:foreground ,magenta))))
   `(font-lock-function-name-face ((t (:foreground ,cyan))))
   `(font-lock-variable-name-face ((t (:foreground ,yellow))))
   `(font-lock-type-face ((t (:foreground ,purple-med))))
   `(font-lock-constant-face ((t (:foreground ,purple-light))))
   `(font-lock-warning-face ((t (:foreground ,pink :weight bold))))

   ;; UI elements
   `(link ((t (:foreground ,cyan :underline t))))
   `(link-visited ((t (:foreground ,magenta :underline t))))
   `(button ((t (:foreground ,cyan :underline t))))
   `(widget-field ((t (:background ,bg-secondary :foreground ,fg-primary))))
   `(success ((t (:foreground ,green))))
   `(warning ((t (:foreground ,yellow))))
   `(error ((t (:foreground ,pink))))
   
   ;; Search and matching
   `(isearch ((t (:background ,purple-dark :foreground ,white))))
   `(lazy-highlight ((t (:background ,bg-tertiary :foreground ,yellow))))
   `(match ((t (:background ,purple-dark :foreground ,white))))

   ;; Line numbers
   `(line-number ((t (:background ,bg-primary :foreground ,fg-tertiary))))
   `(line-number-current-line ((t (:background ,bg-primary :foreground ,purple-light :weight bold))))

   ;; Org-mode
   `(org-level-1 ((t (:foreground ,pink :height 1.3 :weight bold))))
   `(org-level-2 ((t (:foreground ,purple-light :height 1.2 :weight bold))))
   `(org-level-3 ((t (:foreground ,cyan :height 1.1 :weight bold))))
   `(org-level-4 ((t (:foreground ,green :weight bold))))
   `(org-level-5 ((t (:foreground ,yellow :weight bold))))
   `(org-link ((t (:foreground ,cyan :underline t))))
   `(org-code ((t (:foreground ,green-light))))
   `(org-verbatim ((t (:foreground ,green-light))))
   `(org-todo ((t (:foreground ,pink :weight bold))))
   `(org-done ((t (:foreground ,green :weight bold))))
   `(org-date ((t (:foreground ,purple-med))))
   `(org-special-keyword ((t (:foreground ,fg-tertiary))))
   `(org-block ((t (:background ,bg-secondary :foreground ,fg-secondary))))
   `(org-block-begin-line ((t (:background ,bg-tertiary :foreground ,fg-tertiary))))
   `(org-block-end-line ((t (:background ,bg-tertiary :foreground ,fg-tertiary))))

   ;; Company (completion)
   `(company-tooltip ((t (:background ,bg-secondary :foreground ,fg-primary))))
   `(company-tooltip-selection ((t (:background ,purple-dark :foreground ,white))))
   `(company-tooltip-common ((t (:foreground ,cyan))))
   `(company-tooltip-annotation ((t (:foreground ,yellow))))
   `(company-scrollbar-bg ((t (:background ,bg-tertiary))))
   `(company-scrollbar-fg ((t (:background ,purple-med))))

   ;; Ivy/Selectrum (completion)
   `(ivy-current-match ((t (:background ,purple-dark :foreground ,white))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,fg-tertiary))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,cyan))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground ,green))))
   `(ivy-minibuffer-match-face-4 ((t (:foreground ,yellow))))

   ;; Which-key
   `(which-key-key-face ((t (:foreground ,cyan))))
   `(which-key-group-description-face ((t (:foreground ,pink))))
   `(which-key-command-description-face ((t (:foreground ,fg-primary))))
   `(which-key-separator-face ((t (:foreground ,fg-tertiary))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,pink))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,cyan))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,purple-light))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,magenta))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,pink-light))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,cyan-light))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,green-light))))

   ;; Show-paren
   `(show-paren-match ((t (:background ,purple-dark :foreground ,white :weight bold))))
   `(show-paren-mismatch ((t (:background ,pink :foreground ,white))))

   ;; Dired
   `(dired-directory ((t (:foreground ,cyan :weight bold))))
   `(dired-flagged ((t (:foreground ,pink))))
   `(dired-symlink ((t (:foreground ,purple-light))))

   ;; Magit
   `(magit-section-heading ((t (:foreground ,yellow :weight bold))))
   `(magit-branch-local ((t (:foreground ,cyan))))
   `(magit-branch-remote ((t (:foreground ,green))))
   `(magit-diff-added ((t (:background ,bg-secondary :foreground ,green))))
   `(magit-diff-removed ((t (:background ,bg-secondary :foreground ,pink))))
   `(magit-diff-added-highlight ((t (:background ,bg-tertiary :foreground ,green))))
   `(magit-diff-removed-highlight ((t (:background ,bg-tertiary :foreground ,pink))))

   ;; Terminal colors (for ansi-term)
   `(term-color-black ((t (:background ,bg-primary :foreground ,bg-primary))))
   `(term-color-red ((t (:background ,pink :foreground ,pink))))
   `(term-color-green ((t (:background ,green :foreground ,green))))
   `(term-color-yellow ((t (:background ,yellow :foreground ,yellow))))
   `(term-color-blue ((t (:background ,purple-med :foreground ,purple-med))))
   `(term-color-magenta ((t (:background ,magenta :foreground ,magenta))))
   `(term-color-cyan ((t (:background ,cyan :foreground ,cyan))))
   `(term-color-white ((t (:background ,fg-primary :foreground ,fg-primary))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'deep-purple)
(provide 'deep-purple-theme)

;; Disable the menu bar
(menu-bar-mode -1)

(global-display-line-numbers-mode 1)

;; Global font lock
(global-font-lock-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(defun open-config ()
  (interactive)
  (find-file "~/.config/emacs/init.el"))


(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme 'deep-purple t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(corfu racket-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; Define a macro to move to the beginning of the buffer
(fset 'move-to-beginning-of-buffer
   (lambda () "Move to the beginning of the buffer" (interactive)
     (goto-char (point-min))))

;; Define a macro to move to the end of the buffer
(fset 'move-to-end-of-buffer
   (lambda () "Move to the end of the buffer" (interactive)
     (goto-char (point-max))))

;; Bind C-x-a to move to the beginning of the buffer
(global-set-key (kbd "C-x a") 'move-to-beginning-of-buffer)

;; Bind C-x-e to move to the end of the buffer
(global-set-key (kbd "C-x e") 'move-to-end-of-buffer)

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


(add-to-list 'load-path "~/.config/emacs/lisp")  
(require 'welcome-buffer)

;; Display welcome buffer on startup
(add-hook 'emacs-startup-hook #'display-welcome-buffer)

(setq inhibit-startup-screen t)

(set-face-attribute 'default nil :height 210)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(fullscreen . maximized))


;;set up backup files
(setq backup-dir "~/.config/.emacs/backups/")
(setq backup-directory-alist
      `((".*" . ,(expand-file-name backup-dir))))

(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name backup-dir) t)))

;;load my stuff for working in C
(load "~/.config/emacs/lisp/c_stuff.el")


(setq scheme-program-name "~/tinyscheme-1.42/scheme")
(setq auto-mode-alist (cons '("\\.rkt\\'" . scheme-mode) auto-mode-alist))

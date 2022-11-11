
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'evil)
(require 'undo-tree)
(evil-set-undo-system 'undo-tree)
(global-undo-tree-mode)
(evil-mode 1)
(require 'evil-commentary)
(evil-commentary-mode)
(require 'evil-paredit)
(add-hook 'lisp-mode-hook 'evil-paredit-mode)
(require 'ac-slime)
(require 'auto-complete)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'slime-repl-mode))

(add-hook 'lisp-mode-hook 'auto-complete-mode)

;(menu-bar-mode 0)
;; (when (display-graphic-p)
;;   (tool-bar-mode 0)
;;   (scroll-bar-mode 0))
(setq inhibit-startup-screen t)

;; ;; Dark theme.
(load-theme 'wombat)
(set-face-background 'default "#111")

;; ;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)

;; ;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Workaround for https://debbugs.gnu.org/34341 in GNU Emacs <= 26.3.
(when (and (version< emacs-version "26.3") (>= libgnutls-version 30603))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; ;; Write customizations to a separate file instead of this file.
;; (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (load custom-file t)

;; ;; Enable installation of packages from MELPA.
;; ;(require 'package)
;; ;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; ;(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install packages.
(dolist (package '(slime paredit rainbow-delimiters))
  (unless (package-installed-p package)
    (package-install package)))

;; ;; Configure SBCL as the Lisp program for SLIME.
;; (add-to-list 'exec-path "/usr/local/bin")
;; (setq inferior-lisp-program "sbcl")

;; Enable Paredit.
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
(defun override-slime-del-key ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-del-key)

;; Enable Rainbow Delimiters.
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)

;; Customize Rainbow Delimiters.
(require 'rainbow-delimiters)
(set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
(set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
(set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
(set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
(set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
(set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
(set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
(set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
(set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray
(slime)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit evil-paredit ac-slime auto-complete undo-tree slime rainbow-delimiters paredit evil-commentary))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

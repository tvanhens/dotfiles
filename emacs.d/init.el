;;------------------------------------------------------------------------------
;; Cask and Pallet Configuration

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Keep installed packages in sync with ~/.emacs.d/Cask file
(pallet-mode t)

;;------------------------------------------------------------------------------
;; Global Config

;; Indent
(global-set-key (kbd "C-c n") 'indent-region)

;; Theme:
(load-theme 'zenburn t)

;; Paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook #'enable-paredit-mode)

;; Projectile everywhere
(projectile-global-mode)

;; Helm
(require 'helm-config)
(require 'helm)

(helm-mode 1)                                     ; Use helm by default
(global-set-key (kbd "C-x C-f") 'helm-find-files) ; Use helm for files
(helm-autoresize-mode 1)                          ; Autosize helm buffer

;; Helm Projectile
(helm-projectile-on)

;; Undo tree everywhere
(global-undo-tree-mode)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Company mode
(global-company-mode)

;; Cider
(add-hook 'cider-mode-hook #'eldoc-mode)

;;------------------------------------------------------------------------------
;; Cask and Pallet Configuration

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Keep installed packages in sync with ~/.emacs.d/Cask file
(pallet-mode t)

;;------------------------------------------------------------------------------
;; Global Config

;; Load path
(add-to-list 'load-path "/usr/local/bin")

;; Stop visible alert
(setq ring-bell-function 'ignore)

;; Autosave to /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Indent
(global-set-key (kbd "C-c n") 'indent-region)

;; Theme:
(load-theme 'monokai t)

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
(setq magit-push-always-verify nil) ; Don't always verify

;; Company mode
(global-company-mode)

;; Cider
(add-hook 'cider-mode-hook #'eldoc-mode)

;; Clj-Refactor
(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

;; Neo Tree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;------------------------------------------------------------------------------
;; Go Mode

(require 'go-mode-autoloads)
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)
(setq company-begin-commands '(self-insert-command))

(require 'company-go)

;;------------------------------------------------------------------------------
;; Markdown

(defun bind-markdown-keys ()
  (local-set-key (kbd "C-c k") 'gh-md-render-buffer))

(add-hook 'markdown-mode-hook #'bind-markdown-keys)

;;------------------------------------------------------------------------------
;; Javascript

(setq js-indent-level 2)

;;------------------------------------------------------------------------------
;; Clojure Indentation

(require 'clojure-mode)

(put-clojure-indent 'match 1)

;;------------------------------------------------------------------------------
;; Keybindings

(require 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;;------------------------------------------------------------------------------
;; Winner Mode

(when (fboundp 'winner-mode)
  (winner-mode 1))

;;------------------------------------------------------------------------------
;; Default Text Scale

(require 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

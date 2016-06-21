;;------------------------------------------------------------------------------
;; Cask and Pallet Configuration

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Keep installed packages in sync with ~/.emacs.d/Cask file
(pallet-mode t)

;;------------------------------------------------------------------------------
;; Custom Configuration

(load-file "./.emacs.d/global.el")
(load-file "./.emacs.d/clojure.el")
(load-file "./.emacs.d/elisp.el")

;;------------------------------------------------------------------------------
;; Global Config
(global-set-key [f5] 'call-last-kbd-macro)

;; Logview
(require 'logview)

;; Start fullscreen
(toggle-frame-fullscreen)

;; Font
(set-default-font "Inconsolata 18")

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
(add-hook 'after-init-hook 'global-company-mode)

;;------------------------------------------------------------------------------
;; Go Mode

(require 'go-mode-autoloads)
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ibuffer-saved-filter-groups nil)
 '(ibuffer-saved-filters
   (quote
    (("gnus"
      ((or
        (mode . message-mode)
        (mode . mail-mode)
        (mode . gnus-group-mode)
        (mode . gnus-summary-mode)
        (mode . gnus-article-mode))))
     ("programming"
      ((or
        (mode . emacs-lisp-mode)
        (mode . cperl-mode)
        (mode . c-mode)
        (mode . java-mode)
        (mode . idl-mode)
        (mode . lisp-mode))))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)

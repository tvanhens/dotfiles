;;------------------------------------------------------------------------------
;; Global

;; Set customizations file
(setq custom-file (concat user-emacs-directory ".custom.el"))
(ignore-errors
  (load-file custom-file))

;; Show line numbers everywhere
(global-linum-mode)

;; Smart mode line
(setq sml/theme 'dark)
(sml/setup)

;; Turn off welcome message
(setq inhibit-startup-message t)

;; Nyan cat
(add-hook 'emacs-startup-hook 'nyan-mode)

;; Global Config
(global-set-key [f5] 'call-last-kbd-macro)

;; Logview
(require 'logview)

;; Font
(set-default-font "Inconsolata 18")

(require 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)
(put 'set-goal-column 'disabled nil)

;; Path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

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

;; Winner
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Window Changing

(require 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;; Format on save toggle
(defun tvh-format-on-save ()
  (indent-region (point-min) (point-max)))

(defun tvh-toggle-format-on-save ()
  (interactive)
  (if (get 'tvh-toggle-format-on-save 'state)
      (progn
        (remove-hook 'before-save-hook 'tvh-toggle-format-on-save)
        (remove-hook 'before-save-hook 'delete-trailing-whitespace)
        (put 'tvh-toggle-format-on-save 'state nil)
        (message "Format on save disabled"))
    (progn
      (add-hook 'before-save-hook 'tvh-format-on-save)
      (add-hook 'before-save-hook 'delete-trailing-whitespace)
      (put 'tvh-toggle-format-on-save 'state t)
      (message "Format on save enabled"))))

(global-set-key (kbd "C-c C-s") 'tvh-toggle-format-on-save)

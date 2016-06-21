;;------------------------------------------------------------------------------
;; Global

;; Show line numbers everywhere
(global-linum-mode)

;; Smart mode line
(setq sml/theme 'dark)
(sml/setup)

;; Turn off welcome message
(setq inhibit-startup-message t)

;; Nyan cat
(add-hook 'emacs-startup-hook 'nyan-mode)

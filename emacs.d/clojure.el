;;------------------------------------------------------------------------------
;; Clojure

;; Imports

(require 'clojure-mode)
(require 'rainbow-delimiters)
(require 'clj-refactor)
(require 'smartparens-config)

;; Configuration

(put-clojure-indent 'match 1)
(setq clojure-align-forms-automatically t)

;; Utility functions

(defun tvanhens-clojure-format-on-save ()
  (indent-region (point-min) (point-max)))

(defun tvanhens-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m")

  ;; Local hooks
  ;; (add-hook 'before-save-hook 'tvanhens-clojure-format-on-save nil 'make-it-local)
  ;; (add-hook 'before-save-hook 'delete-trailing-whitespace nil 'make-it-local)
  )

;; Hooks

(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'tvanhens-clojure-mode-hook)

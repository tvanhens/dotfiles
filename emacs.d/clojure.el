;;------------------------------------------------------------------------------
;; Clojure

;; Imports

(require 'clojure-mode)
(require 'rainbow-delimiters)
(require 'clj-refactor)

;; Configuration
(put-clojure-indent 'match 1)
(setq clojure-align-forms-automatically t)

;; Utility functions

(defun tvh-clj-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

;; Hooks

(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'tvh-clj-mode-hook)

(add-hook 'cider-repl-mode-hook 'eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(define-clojure-indent
  (defui '(1 nil nil (1))))

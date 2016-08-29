;;------------------------------------------------------------------------------
;; Cask and Pallet Configuration

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Keep installed packages in sync with ~/.emacs.d/Cask file
(pallet-mode t)

;;------------------------------------------------------------------------------
;; Custom Configuration

(load-file "./.emacs.d/clojure.el")
(load-file "./.emacs.d/elisp.el")
(load-file "./.emacs.d/js.el")
(load-file "./.emacs.d/global.el")
(load-file "./.emacs.d/go.el")
(load-file "./.emacs.d/markdown.el")

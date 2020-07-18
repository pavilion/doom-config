;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! doom-snippets :disable t)

(package! dap-mode)

;; Reading epub
(package! nov)

;; Packages used in config.el for regular emacs you'll need `use-package` I guess
(package! mmm-mode)
(package! typescript-mode)
(package! web-mode)
(package! graphql-mode)

(package! lsp-ui :disable t)
(package! org-roam-server)

(package! hl-line :disable t)

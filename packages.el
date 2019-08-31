;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! prettier-js)

(package! import-js)

(package! emacs-snippets :disable t)

(package! openapi-yaml-mode :recipe (:fetcher github :repo "magoyette/openapi-yaml-mode"))
(package! dap-mode)

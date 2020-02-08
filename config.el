;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;; ~/.doom.d/spacemacs-bindings.el -*- lexical-binding: t; -*-

(map!
 ;; Comma for shortcut to local-leader
 :n "," (λ! (push (cons t ?m) unread-command-events)
            (push (cons t 32) unread-command-events))

 (:after magit
   (:map with-editor-mode-map
     :desc "Previous comment" "C-k" #'log-edit-previous-comment
     (:prefix ","
       :desc "Commit" :n "c" #'with-editor-finish
       :desc "Abort commit" :n "a" #'with-editor-cancel)))
 (:leader
   (:prefix "f"
     :desc "Save file (Spacemacs)" :n "s" #'save-buffer
     :desc "Find file (Spacemacs)" :n "f" #'find-file)
   (:prefix "b"
     :desc "Previous buffer (Spacemacs)" :n "p" #'previous-buffer
     :desc "Next buffer (Spacemacs)" :n "n" #'next-buffer
     :desc "Buffer delete" :n "e" #'next-buffer
     :desc "Switch buffer (Spacemacs)" :n "b" #'switch-to-buffer)
  (:prefix "i"
      :desc "import-js-import" :n "m" #'import-js-import
      )
   (:prefix "w"
     :desc "Vertical split (Spacemacs)" :n "/" #'evil-window-vsplit
     :desc "Horizontal split (Spacemacs)" :n "-" #'evil-window-split
     :desc "New frame (Spacemacs)" :n "F" #'make-frame
     :desc "Next frame (Spacemacs)" :n "o" #'other-frame
     :desc "Delete window (Spacemacs)" :n "d" #'evil-quit

     ;; Displaced by other-frame keybinding
     :desc "Window enlargen" :n "O" #'doom/window-enlargen)
   (:prefix "p"
     :desc "Find project file (Spacemacs)" :n "f" #'projectile-find-file)
   (:prefix "g"
     :desc "Git status (Spacemacs)" :n "s" #'magit-status
     )
   (:prefix "m"
     :desc "Git status (Spacemacs)" :n "=" #'prettier-js
     )
   ))

(use-package! prettier-js
  )

(setq doom-theme 'doom-tomorrow-night)

(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 14))
(setq display-line-numbers-type 'relative)

(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/life.org"
                             "~/Dropbox/org/interviews.org"
                             ))

;; Epub
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Roboto Slab" :height 180)
  (buffer-face-mode)
  (setq line-spacing 6)
  (setq header-line-format " ")
  (setq nov-text-width t)
  (setq visual-fill-column-center-text t)
  (visual-line-mode 1)
  (visual-fill-column-mode 1)
  (writeroom-mode 1))
(add-hook! nov-mode #'my-nov-font-setup)

(after! lsp-mode
  (dap-mode 1)
  (dap-ui-mode 1)
  (after! lsp-java
    (require 'dap-java)

(setq dap-java-test-additional-args '("-n" "\".*(Test|IT).*\""))
    ))


;; Assign typescript-mode to .tsx files
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;; Create submodules for multiple major modes
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 0) ;; Turn off background highlight

;; Add css mode for CSS in JS blocks
(mmm-add-classes
  '((mmm-styled-mode
    :submode css-mode
    :front "[a-pr-zA-PR-Z0-9]?[a-km-zA-KM-Z0-9]+`\n"
    :back "`;")))

(mmm-add-mode-ext-class 'typescript-mode nil 'mmm-styled-mode)

;; Add submodule for graphql blocks
(mmm-add-classes
  '((mmm-graphql-mode
    :submode graphql-mode
    :front "gr?a?p?h?ql`\n" ;; Add additional aliases like `gql` if needed
    :back "`;")))

(mmm-add-mode-ext-class 'typescript-mode nil 'mmm-graphql-mode)

;; Add JSX submodule, because typescript-mode is not that great at it
(mmm-add-classes
  '((mmm-jsx-mode
    :front "\s\([\n<]"
    :back "[\s>]\);\n"
    :submode web-mode)))

(mmm-add-mode-ext-class 'typescript-mode nil 'mmm-jsx-mode)

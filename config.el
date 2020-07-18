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
   ))

(setq doom-theme 'my-doom-tomorrow-night)
(setq doom-font (font-spec :family "Jetbrains Mono" :size 14))

(setq display-line-numbers-type nil)


(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/life.org"
                             ))

(setq lsp-enable-symbol-highlighting nil)
(setq lsp-eldoc-render-all nil)
(setq lsp-enable-snippet nil)
(setq lsp-signature-auto-activate nil)
(setq lsp-ui-sideline-enable nil)


;; Epub
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Roboto Slab" :height 180 )
  (buffer-face-mode)
  (setq line-spacing 6)
  (setq header-line-format " ")
  (setq nov-text-width t)
  (setq visual-fill-column-center-text t)
  (visual-line-mode 1)
  (visual-fill-column-mode 1)
  (writeroom-mode 1))
 (add-hook! nov-mode #'my-nov-font-setup)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   (quote
    ("https://www.taniarascia.com/rss.xml" "https://humanwhocodes.com/feeds/blog.xml" "2020-06-25" "https://kentcdodds.com/blog/rss.xml" "https://davidwalsh.name/feed" "https://daverupert.com/atom.xml" "https://overreacted.io/rss.xml" "https://christianheilmann.com/feed/" "https://feeds.feedburner.com/2ality" "https://addyosmani.com/rss.xml")))
 '(pdf-view-midnight-colors (quote ("white" . "black"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Better performance using local hl-line
(use-package hl-line+
  :load-path "3rd"
  :config
  (hl-line-when-idle-interval 0.3)
  (toggle-hl-line-when-idle 1))

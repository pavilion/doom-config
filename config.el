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

(def-package! prettier-js
  )

(setq doom-theme 'doom-tomorrow-night)

(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 12)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans Mono")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "DejaVu Sans Mono" :size 12))

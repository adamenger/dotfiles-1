(require 'cl)

(add-to-list 'load-path "~/etc/emacs.d/personal")

;; Keep backups in a central location: 
(defvar backup-dir "~/etc/.emacs.d/backups")
(setq backup-directory-alist (list (cons "." backup-dir)))

;; Keep autosaves in a central location:
(defvar auto-save-dir "~/etc/.emacs.d/auto-saves")
(setq backup-directory-alist
      `((".*" . ,auto-save-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,auto-save-dir t)))

;;; Keep bookmark files in a central location:
;; basic bookmark commands:
;; C-x r m (make a new bookmark defaulting to the current buffer/file)
;; C-x r b (jump to a bookmark)
;; C-x r l (list bookmarks)
(setq
 bookmark-default-file "~/etc/.emacs.d/bookmarks"
 bookmark-save-flag 1) ;; autosave each change

;; Emacs config menus will write customizations
;; to this file:
(setq custom-file "~/etc/emacs.d/custom.el")
(load custom-file 'noerror)

;; Load any dependencies here:
(require 'packages)

(defvar mswindows-p (string-match "windows" (symbol-name system-type)))
(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(defvar linux-p (string-match "linux" (symbol-name system-type)))

;; Load up all our personal stuff:
(load "~/etc/emacs.d/personal/ms-appearance.el") 
(load "~/etc/emacs.d/personal/ms-bindings.el") 


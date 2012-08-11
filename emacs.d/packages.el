;; Load all packages

(require 'package)

;; Adding the Marmalade Elisp Package Repo:
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; adding Milkypostman’s Experimental Lisp Package Repository:
;(add-to-list 'package-archives 
;	     '("melpa" . "http://melpa.milkbox.net/packages/"))


(package-initialize)
(setq url-http-attempt-keepalives nil) ; required due to package.el bug
; elpa doesn't seem to like my package-user-dir setting
; it gets stuck in a loop downloading package over and over
; perhaps a bug in this version of E24?
;(setq package-user-dir (expand-file-name "~/etc/emacs.d/elpa/"))

(defvar required-packages
  '(tabbar)
  "A list of packages to ensure are installed at launch.")

(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun install-packages ()
  (when (not (packages-installed-p))
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p required-packages)
      (when (not (package-installed-p p))
	(package-install p)
	)
      )
    )
  )

(install-packages)

(provide 'packages)

;; Load all packages

(require 'package)

;; Adding the Marmalade Elisp Package Repo:
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; adding Milkypostman’s Experimental Lisp Package Repository:
(add-to-list 'package-archives 
	     '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar required-packages
  '()
  "Packages which should be installed upon launch")

(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))

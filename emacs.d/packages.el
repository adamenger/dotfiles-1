;; Load all packages

(require 'package)

;; elpa
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/") t)

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
  '(color-theme
    ;color-theme-tango
    zenburn
    color-theme-solarized
    rainbow-delimiters
    rainbow-mode
    tabbar)
  "A list of packages to ensure are installed at launch.")

(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))

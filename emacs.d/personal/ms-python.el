;;; My python configuration
;;
;; Highlights
;; + Pyflakes
;; + Support for syntax highlighting in common files like tap, tac, tml, yaml

;; PYTHON MODE FOR TWISTED
(add-to-list 'auto-mode-alist '("\\.tap\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.tac\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.tml\\'" . python-mode))

;; run pyflakes(instead of pychecker) manually with C-c C-w:
;; python-mode.el from python
(setq py-pychecker-command "pyflakes")
(setq py-pychecker-command-args "")
;; python.el from emacs
(setq python-check-command "pyflakes")

;; Subword mode might make navigating CapWords / camelCaseWords a bit nicer:
(add-hook 'python-mode-hook (lambda () (subword-mode 1)))

;; Spell checking could be helpful as well:
(add-hook 'rst-mode-hook (lambda () (flyspell-mode 1)))

;; Pymacs
;; to install cd to ~/etc/emacs.d/thirdparty/Pymacs and run
;; $ make && python setup.py install
(add-to-list 'load-path "~/etc/emacs.d/thirdparty/Pymacs")
(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)

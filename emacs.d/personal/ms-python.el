;;; My python configuration
;;
;; Highlights
;; + Pyflakes
;; + Support for syntax highlighting in common files like tap, tac, tml, yaml

;; PYTHON MODE FOR TWISTED
(add-to-list 'auto-mode-alist '("\\.tap\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.tac\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.tml\\'" . python-mode))

;; PYFLAKES
;; configure hooks to run pyflakes automatically with flymake mode:
;; NOTE: this is super sweet
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       ;'flymake-create-temp-inplace))
                       'flymake-create-temp-with-folder-structure))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
;; If you need to change the xml command you can do it be defining a flymake-xml-init function:
  ;; (defun flymake-xml-init ()
  ;;   (list "/usr/local/bin/xml" (list "validate --err" (flymake-init-create-temp-buffer-copy
  ;;                                           ;'flymake-create-temp-inplace
  ;;                                           'flymake-create-temp-with-folder-structure
  ;;                                           ))))
  (delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
  (delete '("\\.xml?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))
;;
(add-hook 'find-file-hook 'flymake-find-file-hook)

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

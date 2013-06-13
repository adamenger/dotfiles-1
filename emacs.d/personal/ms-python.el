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

;; configure autopair to handle """docstrings""" in python mode
(add-hook 'python-mode-hook
          #'(lambda ()
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action))))

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)                      ; optional
;; (setq jedi:complete-on-dot t)                 ; optional

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

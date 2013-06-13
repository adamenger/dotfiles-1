;; ms-programming-languages.el
;;
;; load customizations for all the programming languages I've used
;;

(load "ms-haskell")
(load "ms-python")
(load "ms-test")
(load "ms-javascript")
(load "ms-snippets")
(load "ms-ruby")


;; PYFLAKES
;; configure hooks to run pyflakes automatically with flymake mode:
;; NOTE: this is super sweet
(eval-after-load 'flymake '(require 'flymake-cursor))

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
               '("\\.py\\'" flymake-pyflakes-init))
  )

;;
;; Disabling this for now and trying flycheck
;;(add-hook 'find-file-hook 'flymake-find-file-hook)

(require 'flycheck)
(require 'flycheck-color-mode-line)

(flycheck-declare-checker python-pyflakes
    "A Python syntax and style checker using Pylint.

See URL `http://pypi.python.org/pypi/pylint'."
      :command '("pyflakes" source-inplace)
        :error-patterns
          '(("^\\(?1:.*\\):\\(?2:[0-9]+\\): Warning (W.*): \\(?4:.*\\)$" warning)
                ("^\\(?1:.*\\):\\(?2:[0-9]+\\): Error (E.*): \\(?4:.*\\)$" error)
                    ("^\\(?1:.*\\):\\(?2:[0-9]+\\): \\[F\\] \\(?4:.*\\)$" error))
            :modes 'python-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load "flycheck"
    '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
(add-hook 'python-mode-hook 'flycheck-mode)


;; automatically pair braces, parens, quotes, etc:
(autopair-global-mode)

;; display git diff icons in the fringe:
;(global-git-gutter-mode t)

;; enable basic code folding with hs (hide show mode) in
;; all modes:
;(define-globalized-minor-mode global-hs-minor-mode
;    hs-minor-mode hs-minor-mode)
;(global-hs-minor-mode 1)
;; Nevermind, this global mode hack causes problems.

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

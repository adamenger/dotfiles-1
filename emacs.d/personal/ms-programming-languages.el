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

(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load "flycheck"
    '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
(add-hook 'python-mode-hook 'flycheck-mode)

;; automatically pair braces, parens, quotes, etc:
(autopair-global-mode)

;; display git diff icons in the fringe:
(global-git-gutter-mode t)

;; enable basic code folding with hs (hide show mode) in
;; all modes:
;(define-globalized-minor-mode global-hs-minor-mode
;    hs-minor-mode hs-minor-mode)
;(global-hs-minor-mode 1)
;; Nevermind, this global mode hack causes problems.

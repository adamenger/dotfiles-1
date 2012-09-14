;; ms-programming-languages.el
;;
;; load customizations for all the programming languages I've used
;;

(load "ms-python")
(load "ms-test")

(load "ms-javascript")

(load "ms-snippets")

;; Ruby crap:
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

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
(add-hook 'find-file-hook 'flymake-find-file-hook)

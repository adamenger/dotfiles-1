(require 'yasnippet)
;; personal snippets
(add-to-list 'yas-snippet-dirs
      "~/etc/emacs.d/snippets"
      )
(yas-global-mode 1)

;; reload yas with:
; M-x yas-reload-all

;; enable yas only for some programming modes
;(add-hook 'prog-mode-hook
;  '(lambda ()
;      (yas-minor-mode)))

;; Apparently some modes like rope, ruby mode, etc override tab which
;; then causes problems with yas:
(defun ms-tab-noconflict ()
  ;; http://blog.iany.me/2012/03/fix-tab-binding-for-yasnippet-and-auto-complete/
    (let ((command (key-binding [tab]))) ; remember command
          (local-unset-key [tab]) ; unset from (kbd "<tab>")
              (local-set-key (kbd "TAB") command))) ; bind to (kbd "TAB")
(add-hook 'python-mode-hook 'ms-tab-noconflict)
(add-hook 'ruby-mode-hook 'ms-tab-noconflict)

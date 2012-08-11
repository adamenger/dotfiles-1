;;
;; msjavascript.js
;;

(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
;; force js2 mode to be be ignored
(delete '("\\.js$" . js2-mode) auto-mode-alist)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

;; js2-mode by Steve Yegge
;(autoload 'js2-mode "js2" nil t)
;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; mustache.js template highlighting:
(load "mustache-mode.el")
(require 'mustache-mode)
;;
;; haskell mode stuff
;;

;; there are three indentation modes:
;; haskell-indentation
;; haskell-indent
;; haskell-simple-indent

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; ghc mode installs a bunch of useful stuff for haskell
;; to support syntax highlighting and flymake
;; you may need to install 'ghc-mod' i.e.:
;; cabal install ghc-mod
;(autoload 'ghc-init "ghc" nil t)
;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;;; Make buffer names unique!
;; So instead of Makefile and Makefile<2>
;; you'll have Makefile:somedir and Makefile:otherdir
(require 'uniquify)
;; setting: uniquify-buffer-name-style
;; Given 3 files
;;   /home/foo/Makefile
;;   /home/bar/Makefile
;;   /opt/foo/Makefile
;; style 'forward means their buffer names would be:
;;   foo/Makefile
;;   bar/Makefile
;;   opt/foo/Makefile
;; style 'post-forward means:
;;   Makefile|foo
;;   Makefile|bar
;;   Makefile|opt/foo
;; style 'reverse means:
;;   Makefile\foo
;;   Makefile\bar
;;   Makefile\foo\opt
;;
;; I think that reverse gives us the most sensible path first
(setq
  uniquify-buffer-name-style 'reverse
  uniquify-separator ":")

;; IDO mode, improved buffer switching
; do not require confirmation:
;(setq confirm-nonexistent-file-or-buffer nil)
; Keep tramp working!
(setq ido-enable-tramp-completion nil)

(require 'ido)
(ido-mode t)
(ido-everywhere t)
;(add-hook 'term-setup-hook 'ido-setq)

(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
;(setq ido-create-new-buffer 'always) 
(setq ido-use-filename-at-point nil)
(setq ido-use-url-at-point nil)
;; use normal find-file function for ftp files
(setq ido-slow-ftp-host-regexps '(".*"))
;; don't search files in other directories
(setq ido-work-directory-list-ignore-regexps '(".*"))

;(setq ido-enable-last-directory-history nil)
;(setq confirm-unique-completion nil)
(setq ido-show-dot-for-dired t)



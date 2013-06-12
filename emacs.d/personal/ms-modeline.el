;; use setq-default to set it for /all/ modes
(setq my-which-func-format (append which-func-format '(" ")))

;; Just in case I get lonely for the original modeline this is what was in it:
;; mode-line-format
;; ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position
;;  (vc-mode vc-mode)
;;  "  " mode-line-modes mode-line-misc-info mode-line-end-spaces)

;; Newer cleaner(?) modeline:
(setq-default mode-line-format
  (list
   ;; the buffer name; the file name as a tool tip
   ;; was this buffer modified since the last save?
   '(:eval (when (buffer-modified-p)
             (propertize "Modified"
                         'face 'font-lock-warning-face
                         'help-echo "Buffer has been modified")))

   ;; is this buffer read-only?
   '(:eval (when buffer-read-only
             (propertize "Read Only"
                         'face 'font-lock-type-face
                         'help-echo "Buffer is read-only")))

   '(:eval (propertize " %b " 'face 'font-lock-keyword-face
                       'help-echo (buffer-file-name)))

   ;; clue folks if in we've narrowed to a region
   "%n "

   ;; display what function/class we're in:
   (when which-func-mode
     my-which-func-format
     )

   ;; line and column
   "(" ;; '%02' to set to 2 chars at least; prevents flickering
   (propertize "%02l" 'face 'font-lock-type-face) ","
   (propertize "%02c" 'face 'font-lock-type-face)
   ") "

   ;; relative position, size of file
   "["
   (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
   "/"
   (propertize "%I" 'face 'font-lock-constant-face) ;; size
   "] "

   ;; the current major mode for the buffer.
   "["
   '(:eval (propertize "%m" 'face 'font-lock-string-face
                       'help-echo buffer-file-coding-system))
   "] "

   "[" ;; insert vs overwrite mode, input-method in a tooltip
   '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                       'face 'font-lock-preprocessor-face
                       'help-echo (concat "Buffer is in "
                                          (if overwrite-mode "overwrite" "insert") " mode")))

   "] "

   ;; add the time, with the date and the emacs uptime in the tooltip
   '(:eval (propertize (format-time-string "%l:%M%p %Z")
                       'help-echo
                       (concat (format-time-string "%c; ")
                               (emacs-uptime "Uptime:%hh"))))
   " --"
   ;; i don't want to see minor-modes; but if you want, uncomment this:
   ;; minor-mode-alist  ;; list of minor modes
   "%-" ;; fill with '-'
   ))

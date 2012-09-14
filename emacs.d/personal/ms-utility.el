(defun dos2unix ()
  "Converts the current buffer from DOS to Unix"
  (interactive)
  (set-buffer-file-coding-system 'utf-8-auto)
  )

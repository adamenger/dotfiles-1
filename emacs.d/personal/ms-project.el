;;; ms-project.el

;; About:

;; This module describes project-wide functionality
;; for Textura projects and others.

;;; Ideas for functionality:

;; 1. find-in-project to recursively grep from the project root down
;;    independent of where the grep started.
;; 2. run tests for the current project regardless of current working directory
;;


(defvar ms-project-root-files
  '("setup.py"
    "manage.py"
    )
  "File(s) that identify the project root"
  )

;; Depending on the type of project
;; we may use one of many possible files
;; as the project root.
;;
;; For example:
;;   - arbitrary django project: manage.py
;;   - arbitrary twisted project: twisted (twisted plugin directory?)



(defun ms-project-project-root ()
  (let (root)
    (setq root
          (car
           (delq nil
                 (mapcar
                  (lambda (f)
                    (locate-dominating-file
                     (if buffer-file-name buffer-file-name ".") f)
                    ) ms-project-root-files)
                 )
           )
          )
    (if (eq root nil)
        "."
      root)
    )
  )

(defun ms-project-show-project-root ()
  (interactive)
  (message "project-root: %s" (ms-project-project-root))
  )

(defun ms-project-grep-find-command ()
  "modifies grep-find-command to point at the root directory"
  (concat (combine-and-quote-strings
   (cons "find" (cons (ms-project-project-root) (cdr (cdr (split-string grep-find-command))))))
          " ")
  )

(defun find-in-project (command-args)
  "Run grep via find, with user-specified args COMMAND-ARGS.
Collect output in a buffer.
While find runs asynchronously, you can use the \\[next-error] command
to find the text that grep hits refer to.

This command uses a special history list for its arguments, so you can
easily repeat a find command."
  (interactive
   (progn
     (grep-compute-defaults)
     (if grep-find-command
	 (list (read-shell-command "Run find (like this): "
                               (ms-project-grep-find-command) 'grep-find-history))
       ;; No default was set
       (read-string
        "compile.el: No `grep-find-command' command available. Press RET.")
       (list nil))))
  (when command-args
    (let ((null-device nil))		; see grep
      (grep command-args))))

(defun ms-project-get-ctags-path ()
  "ctags-exuberant")

(defun ms-project-create-tags-in-directory (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  ; -e is for emacs!
  (shell-command
   (format "%s -f %s/TAGS -e --recurse %s" (ms-project-get-ctags-path) dir-name dir-name)))

(defun ms-project-create-tags ()
  (interactive)
  (ms-project-create-tags-in-directory (ms-project-project-root))
  )

;;
(defvar ms-elnode-editor-buffer (get-buffer-create "*ms-elnode-editor-buffer*"))

(defun ms-elnode-editor-handler (httpcon)
  (elnode-http-start httpcon 200 '("Content-Type" . "text/plain"))
  (elnode-http-return
   httpcon
   (with-current-buffer ms-elnode-editor-buffer
     (buffer-substring-no-properties (point-min) (point-max)))))

(defun ms-elnode-editor-update-handler (httpcon)
  (let ((change-text (elnode-http-param httpcon "change")))
    (with-current-buffer ms-elnode-editor-buffer
      (goto-char (point-max))
      (if (stringp change-text)
          (insert change-text))))
  (elnode-http-start httpcon 302 '("Location" . "/"))
  (elnode-http-return httpcon))

; "The webserver handler."
(defconst ms-elnode-editor-webserver-handler
  (elnode-webserver-handler-maker "~/etc/public_html/"))

(defconst ms-elnode-editor-urls
  '(("text/$" . ms-elnode-editor-handler)
    ("update/.*$" . ms-elnode-editor-update-handler)
    (".*" . ms-elnode-editor-webserver-handler)))

(defun ms-elnode-editor-dispatcher-handler (httpcon)
    (elnode-dispatcher httpcon ms-elnode-editor-urls))

(elnode-start 'ms-elnode-editor-dispatcher-handler :port 8001 :host "localhost")

;; One variant to get powershell work in default shell-mode
(defun run-powershell ()
  "Run powershell"
  (interactive)
  (async-shell-command
   "c:/windows/system32/WindowsPowerShell/v1.0/powershell.exe -Command -"
   nil
   nil)
  )

;; Default org-directory on Windows turns to
;; C:\Users\username\AppData\Roaming
;; which isn't very convenient
(setq org-directory (expand-file-name
                     "org"
                     (getenv "USERPROFILE"))
)

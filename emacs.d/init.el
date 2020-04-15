(setenv "GPG_AGENT_INFO" nil)

(setq inhibit-startup-screen t
      initial-scratch-message ";; ready\n\n")

;; not for github's eyes :)
(let ((personal-settings "~/.emacs.d/personal.el"))
 (when (file-exists-p personal-settings)
   (load-file personal-settings))
)

(set-frame-font "JetBrains Mono 13" nil t)

(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; setup custom settings file
(setq custom-file "~/.emacs.d/custom-variables.el")
(load custom-file)

;; initialize and setup packages
(load "~/.emacs.d/packages.el")

;; custom functions
(load "~/.emacs.d/user-functions.el")

;; Change default directory for temp files
(defconst emacs-tmp-dir
  (expand-file-name "temp" user-emacs-directory))

;; Set correct access mode
(make-directory emacs-tmp-dir :parents)
(set-file-modes emacs-tmp-dir #o700)

;; And place server socket file here too
(setq server-socket-dir emacs-tmp-dir)

(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

;; org-mode settings
(setq org-agenda-files (list "~/org"))

(setq org-capture-templates '(("t" "TODO entry [inbox]" entry
                               (file+headline "~/org/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("c" "Paste clipboard content [inbox]" entry
                               (file+headline "~/org/inbox.org" "Tasks")
                               "*  %c%?")

                              ("n" "Add a note [notes]" entry
                               (file+headline "~/org/notes.org" "NOTES")
                               "* %i%?")))

(setq org-refile-targets '((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9)))

(setq visible-bell       nil
      ring-bell-function #'ignore)

;; Change default window title
(setq-default frame-title-format '("%f [%m]"))

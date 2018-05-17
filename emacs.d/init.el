;; (package-initialize)

;; not for github's eyes :)
(let ((personal-settings "~/.emacs.d/personal.el"))
 (when (file-exists-p personal-settings)
   (load-file personal-settings))
)

(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; setup custom settings file
(setq custom-file "~/.emacs.d/custom-variables.el")
(load custom-file)

;; initialize and setup packages
(load "~/.emacs.d/packages.el")

;; custom functions
(load "~/.emacs.d/user-functions.el")

;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

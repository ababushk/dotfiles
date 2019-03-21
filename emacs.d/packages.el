;; We do not use package-initialize, we use use-package!
;; Emacs 25 puts back package-initialize if it's not found commented out:
;; (package-initialize)

(setq package-enable-at-startup nil
      package-user-dir "~/.emacs.d/elisp/"
      package-archives '(("org"           . "http://orgmode.org/elpa/")
                         ("melpa-stable"  . "https://stable.melpa.org/packages/")
                         ("melpa"         . "http://melpa.milkbox.net/packages/")
                         ("gnu"           . "http://elpa.gnu.org/packages/"))
      package-archives-priorities '(("org" . 10)
                                    ("melpa-stable" . 9)
                                    ("gnu" . 5)
                                    ("melpa" . 0)))


(eval-when-compile
  (require 'package)
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package)
  (setq use-package-always-ensure t))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(require 'diminish)

(use-package magit
  :ensure t
  :bind ("C-c s" . magit-status))

(use-package yaml-mode
  :ensure t
  :mode "\\.sls$")

(use-package ws-butler
  :ensure t
  :diminish ws-butler-mode
  :config
  (add-hook 'find-file-hook 'ws-butler-global-mode))

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
	 ("\\.tmpl?\\'" . web-mode))
  :config
  (progn
    (setq web-mode-engines-alist
	  '(("\\.tmpl\\'"  . "mako")))

    (setq web-mode-enable-auto-pairing t)
    (setq web-mode-enable-auto-closing t)
    (setq web-mode-enable-auto-expanding t)
    (setq web-mode-enable-css-colorization t)))

(use-package org-jira
  :defer t)

;; (use-package nord-theme
;;   :ensure t
;;   :init
;;   (load-theme 'nord)
;;   (setq nord-comment-brightness 15)
;;   (setq nord-region-highlight "snowstorm")
;;   (enable-theme 'nord)
;;   )
(use-package dracula-theme
  :init
  (load-theme 'dracula t t)
  (enable-theme 'dracula)
  :defer t
  :ensure t
  :config)

;; (use-package ample-theme
;;   :init
;;   (load-theme 'ample t t)
;;   (load-theme 'ample-flat t t)
;;   (load-theme 'ample-light t t)
;;   (enable-theme 'ample)
;;   :defer t
;;   :ensure t
;;   :config)

(use-package rainbow-delimiters
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))


(use-package ido
  :config
  (ido-mode 1))

(use-package smex
  :init (smex-initialize)
  :bind ("M-x" . smex))

(use-package ace-window
  :bind* ("M-o" . ace-window))

(use-package groovy-mode
  :ensure t
  :mode "\\.groovy\\'\\|\\.gradle\\'")

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package org
  :ensure t
  :config
  (setq org-startup-indented t)
  (add-to-list 'org-structure-template-alist
	       (list "j" (concat "?\n"
				 "*Requirements*\n"
				 "#\n"
				 "*Justification*\n"
				 "\n"
				 "*Steps*\n"
				 "#\n"
				 "\n"))))
(use-package yasnippet
  :init
  (yas-global-mode)
  :config
  (yas-reload-all))

(use-package markdown-mode
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)
  :config)

(use-package org-jira
  :defer t)

(use-package pinentry
)

(use-package ox-jira)

(use-package powerline)

(use-package better-defaults)

(use-package ansible
  :ensure t
  :config
  (setq ansible::vault-password-file "~/.vault_pass.txt")
  )

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))
(provide 'packages)
;;; packages.el ends here

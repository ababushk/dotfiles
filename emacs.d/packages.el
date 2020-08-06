;; We do not use package-initialize, we use use-package!
;; Emacs 25 puts back package-initialize if it's not found commented out:
;; (package-initialize)

(setq package-enable-at-startup nil
      package-user-dir "~/.emacs.d/elisp/"
      package-archives '(("org"           . "http://orgmode.org/elpa/")
                         ("melpa-stable"  . "https://stable.melpa.org/packages/")
                         ("melpa"         . "https://melpa.org/packages/")
                         ("gnu"           . "http://elpa.gnu.org/packages/"))
      package-archive-priorities '(("org" . 10)
                                    ("melpa-stable" . 9)
                                    ("gnu" . 5)
                                    ("melpa" . 0)))

(eval-when-compile
  (require 'package)
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'diminish)
    (package-install 'use-package))
  (require 'use-package)
  (setq use-package-always-ensure t))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(require 'diminish)

(use-package lua-mode)

;; to use Emacs' keybindings with russian layout
(use-package reverse-im
  :config
  (reverse-im-activate "russian-computer")
)

(use-package multiple-cursors)

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

;; Commented because I'm working from home via SSH on my Linux machine T_T
;; (use-package doom-themes
;;   ;; :pin melpa ;; horizon theme available in newer versions only
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   (load-theme 'doom-dracula t)

;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)

;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))

(use-package rainbow-delimiters
  :ensure t
  :diminish rainbow-delimiters-mode
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
  :mode "\\.groovy\\'\\|\\.gradle\\|Jenkinsfile'")

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; org mode
(use-package org
  :ensure t
  :config
  (setq org-startup-indented t))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-jira
  :defer t)

;; JIRA markup
(use-package ox-jira)

(use-package yasnippet
  :init
  (yas-global-mode)
  :config
  (yas-reload-all))

(use-package markdown-mode
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)
  :config)


(use-package better-defaults)

(use-package ansible
  :ensure t
  :config
  (setq ansible::vault-password-file "~/.vault_pass.txt")
  )

(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-enable-caching t))

;; Setup autocompletion
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq company-dabbrev-downcase nil)
  (global-company-mode t)
)

(use-package paredit)

(use-package markdown-toc)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package cmake-mode)

(use-package nginx-mode)

(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-delay 0)
  (setq highlight-indent-guides-responsive 'stack))

(use-package dumb-jump)

(provide 'packages)
;;; packages.el ends here

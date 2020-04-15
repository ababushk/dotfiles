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

(use-package lua-mode)

(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("C-c t"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

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

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-horizon t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

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

(provide 'packages)
;;; packages.el ends here

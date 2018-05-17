;; We do not use package-initialize, we use use-package!
;; Emacs 25 puts back package-initialize if it's not found commented out:
;; (package-initialize)

(setq inhibit-startup-screen t
      initial-scratch-message ";; ready\n\n"
      package-enable-at-startup nil
      package-user-dir "~/.emacs.d/elisp/"
      package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

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
             :ensure t
             :config
             (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package ido
             :config
             (ido-mode 1))

(use-package smex
  :init (smex-initialize)
  :bind ("M-x" . smex))

(use-package neotree
  :ensure t
  :bind (("<f2>" . neotree-toggle)))

(use-package ace-window
  :bind* ("M-o" . ace-window))

(use-package groovy-mode
  :ensure t
  :mode "\\.groovy\\'\\|\\.gradle\\'")

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package org
  :config
  (setq org-startup-indented t))

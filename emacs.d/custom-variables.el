(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(aw-dispatch-always t)
 '(comment-multi-line t)
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "88049c35e4a6cedd4437ff6b093230b687d8a1fb65408ef17bfcf9b7338734f6" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "406251a3b514a1b353dfba5e8986037ae354ee2b090039c1168fb985fef17aa7" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "60948671aeed6450faa8f28978a09586f142af6eb0b59e70848fcc32b9d36fd1" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "565aa482e486e2bdb9c3cf5bfb14d1a07c4a42cfc0dc9d6a14069e53b6435b56" default)))
 '(epa-pinentry-mode (quote loopback))
 '(fci-rule-color "#5c5e5e")
 '(flycheck-python-pycompile-executable "python3")
 '(frame-resize-pixelwise t)
 '(hl-sexp-background-color "#1c1f26")
 '(indent-tabs-mode nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#fd971f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#b6e63e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#525254"))
 '(org-agenda-files
   (quote
    ("~/org/work.org" "~/org/personal.org" "~/org/university.org")))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (shell . t) (python . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-export-initial-scope (quote subtree))
 '(org-return-follows-link t)
 '(package-selected-packages
   (quote
    (editorconfig nginx-mode paredit company multiple-cursors reverse-im language-detection magit-lfs darktooth-theme gruvbox-theme htmlize edit-indirect markdown-toc cmake-mode projectile ess ansible lua-mode org-drill-table org-drill gitlab-ci-mode-flycheck gitlab-ci-mode helm gitlab better-defaults ox-jira klere-theme powerline pinentry rainbow-delimiters ample-theme org-jira markdown-mode org-plus-contrib yasnippet flycheck groovy-mode yaml-mode ws-butler web-mode use-package smex smart-mode-line magit dockerfile-mode diminish ace-window)))
 '(pdf-view-midnight-colors (quote ("#282828" . "#fbf1c7")))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(python-shell-interpreter "python3")
 '(vc-annotate-background "#1d1f21")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b5bd68")
    (cons 40 "#c8c06c")
    (cons 60 "#dcc370")
    (cons 80 "#f0c674")
    (cons 100 "#eab56d")
    (cons 120 "#e3a366")
    (cons 140 "#de935f")
    (cons 160 "#d79e84")
    (cons 180 "#d0a9a9")
    (cons 200 "#c9b4cf")
    (cons 220 "#ca9aac")
    (cons 240 "#cb8089")
    (cons 260 "#cc6666")
    (cons 280 "#af6363")
    (cons 300 "#936060")
    (cons 320 "#765d5d")
    (cons 340 "#5c5e5e")
    (cons 360 "#5c5e5e")))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 16777215)) (:background "#282828" :foreground "#fdf4c1")) (((class color) (min-colors 255)) (:background "#262626" :foreground "#ffffaf")))))

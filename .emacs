(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(custom-enabled-themes (quote (doom-challenger-deep)))
 '(custom-safe-themes
   (quote
    ("d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "237e67159f3c218980764d3a5ffbd4676578ed6a0daf4e8d10d95f2bd73fb08c" "dd58e14ea1b20d3948964e15b55040dc415605bbda2ba0521d8e1c65252decf6" default)))
 '(fci-rule-color "#4C566A")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(jdee-db-active-breakpoint-face-colors (cons "#191C25" "#80A0C2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#191C25" "#A2BF8A"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#191C25" "#434C5E"))
 '(package-selected-packages
   (quote
    (doom-modeline js2-mode doom-themes realgud opencl-mode flycheck-irony irony git-timemachine company-coq htmlize ox-reveal org-reveal sass-mode rust-mode hamlet-mode intero eros nand2tetris-assembler nand2tetris yaml-mode sml-mode restclient rest-client cider flycheck-cask smartparens yatemplate popup-imenu ensime exec-path-from-shell demo-it iedit company company-ghc scala-mode sbt-mode idris-mode zerodark-theme use-package slime paredit multiple-cursors ido-ubiquitous helm-projectile flx-ido cuda-mode)))
 '(vc-annotate-background "#3B4252")
 '(vc-annotate-color-map
   (list
    (cons 20 "#A2BF8A")
    (cons 40 "#bac389")
    (cons 60 "#d3c788")
    (cons 80 "#ECCC87")
    (cons 100 "#e3b57e")
    (cons 120 "#da9e75")
    (cons 140 "#D2876D")
    (cons 160 "#c88982")
    (cons 180 "#be8b98")
    (cons 200 "#B58DAE")
    (cons 220 "#b97e97")
    (cons 240 "#bd6f80")
    (cons 260 "#C16069")
    (cons 280 "#a15b66")
    (cons 300 "#825663")
    (cons 320 "#625160")
    (cons 340 "#4C566A")
    (cons 360 "#4C566A")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")))
(package-initialize)


(package-install 'use-package)


(when (not package-archive-contents)
  (package-refresh-contents))


(require 'use-package)

(use-package exec-path-from-shell
  :demand t
  :ensure t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; cl mode is needed by various pacakges and needs to be required to avoid weird bugs
(require 'cl)

;; flycheck
(use-package flycheck :demand :ensure t)
(use-package flycheck-cask
  :commands flycheck-cask-setup
  :config (add-hook 'emacs-lisp-mode-hook (flycheck-cask-setup)))
(add-to-list 'flycheck-clang-include-path "/usr/local/include/gtest/")

;; real gud
(use-package realgud :demand :ensure t)

;; helm
(use-package helm :demand :ensure t)
(use-package projectile :demand :ensure t)
(use-package flx :demand :ensure t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq projectile-use-git-grep 1)
(helm-mode 1)

(use-package helm-projectile :demand :ensure t)
(helm-projectile-on)

;; c++
(use-package irony :demand :ensure t)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
;; (use-package flycheck-irony :demand :ensure t)
;; (add-hook 'c++-mode-hook 'irony-mode)

;; (setq irony-additional-clang-options '("-std=c++11"))

;; opencl
(use-package opencl-mode :demand :ensure t)
(add-to-list 'auto-mode-alist '("\\.cl" . opencl-mode))

;; ido
(use-package ido :demand :ensure t)
(use-package ido-completing-read+ :demand :ensure t)
(use-package flx-ido :demand :ensure t)
(ido-mode t)

;;multiple cursors
(use-package multiple-cursors :demand :ensure t)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; slime
(use-package slime :demand :ensure t)
(setq inferior-lisp-program "/usr/local/bin/sbcl --no-debugger")
(setq slime-contribs '(slime-fancy slime-asdf))

;; paredit
(use-package paredit :demand :ensure t)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'enable-paredit-mode)

;; sml mode
(use-package sml-mode
  :demand
  :ensure t)

;; disable bars
(menu-bar-mode 1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; cuda
(use-package cuda-mode :demand :ensure t)
(flycheck-define-checker cuda-mode-checker
  "Checks cuda files based on nvcc compiler output"
  :command ("make")
  :error-patterns ((error line-start (file-name) "(" line "): " (message) line-end))
  :modes (cuda-mode))
(global-flycheck-mode)

;; zero dark mode line
;;(use-package zerodark-theme :demand :ensure t)
;;(zerodark-setup-modeline-format)

;; doom theme
(use-package doom-themes :demand :ensure t)
()
;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

(use-package doom-modeline
  :ensure t
  :demand)

(doom-modeline-init)

;; all the icons
(use-package all-the-icons :demand :ensure t)

;; hack font
(set-face-attribute 'default nil :font "hack")

;; magit
(use-package magit
  :demand
  :ensure t)

;; YASnippet
(use-package yasnippet
  :diminish yas-minor-mode
  :commands yas-minor-mode
  :config (yas-reload-all))

(use-package yatemplate
  :defer 2 ;; WORKAROUND https://github.com/mineo/yatemplate/issues/3
  :config
  (auto-insert-mode)
  (setq auto-insert-alist nil)
  (yatemplate-fill-alist))

;;smart parens
(use-package smartparens
  :diminish smartparens-mode
  :commands
  smartparens-strict-mode
  smartparens-mode
  sp-restrict-to-pairs-interactive
  sp-local-pair
  :init
  (setq sp-interactive-dwim t)
  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings)

  (sp-pair "(" ")" :wrap "C-(") ;; how do people live without this?
  (sp-pair "[" "]" :wrap "s-[") ;; C-[ sends ESC
  (sp-pair "{" "}" :wrap "C-{")

  ;; WORKAROUND https://github.com/Fuco1/smartparens/issues/543
  (bind-key "C-<left>" nil smartparens-mode-map)
  (bind-key "C-<right>" nil smartparens-mode-map)

  (bind-key "s-<delete>" 'sp-kill-sexp smartparens-mode-map)
  (bind-key "s-<backspace>" 'sp-backward-kill-sexp smartparens-mode-map))



;; ;; ocaml
;; ;;(use-package flycheck-ocaml :demand :ensure t)
;; (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
;; (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; (use-package merlin :demand :ensure t)
;; (add-hook 'tuareg-mode-hook 'merlin-mode)
;; (add-hook 'caml-mode-hook 'merlin-mode)

;; idris
(use-package idris-mode :demand :ensure t)
(setq idris-interpreter-path "/usr/local/bin/idris")
(setq idris-semantic-source-highlighting t)
(add-to-list 'completion-ignored-extensions ".ibc")
(setq ido-ignore-extensions t)

;; ansi colours
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'eshell-preoutput-filter-functions 'ansi-color-apply)

;; scala
(use-package ensime :ensure t :pin melpa-stable)
(use-package sbt-mode :ensure t :pin melpa)
(use-package scala-mode :ensure t :pin melpa)

;; sbt
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

;; projectile
(projectile-mode 1)

;; haskell
(use-package intero
  :ensure t
  :demand)
(add-hook 'haskell-mode-hook 'intero-mode)
(use-package company-ghc :ensure t)

;; company mode
(use-package company :ensure t)
(defun hs-enable-company-mode ()
  (company-mode 1))
(add-hook 'prog-mode-hook #'hs-enable-company-mode)
(setq company-frontends '(company-preview-frontend))
(setq company-idle-delay 0)

;; i-edit
(use-package iedit
  :ensure t
  :demand t)

;; demo-it
(use-package demo-it
  :ensure t
  :demand t)

;; imenu
(use-package popup-imenu
  :commands popup-imenu
  :bind ("M-i" . popup-imenu))

;; clojure
(use-package cider
  :ensure t
  :demand t)

;; magit
(setq clojure-enable-paredit t)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;;rest client
(use-package restclient
  :ensure
  :demand t)

;; yaml
(use-package yaml-mode
  :ensure
  :demand t)

;;nand2tetris
(use-package nand2tetris
  :ensure
  :demand t)

(use-package nand2tetris-assembler
  :ensure
  :demand t)

(add-to-list 'auto-mode-alist '("\\.hdl" . nand2tetris-mode))

;; prolog
(add-to-list 'auto-mode-alist '("\\.prlg" . prolog-mode))

;; sass mode
(use-package sass-mode
  :ensure
  :demand t)

;; eros evaluation overlays
(use-package eros
  :ensure
  :demand t)
(eros-mode 1)

;; org-reveal
(use-package ox-reveal
  :ensure
  :demand t)
(setq org-reveal-root "file:///Users/henrysteere/reveal.js/")
(setq org-export-time-stamp-file nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))

;; htmlize
(use-package htmlize
  :ensure
  :demand t)

;; rust
(use-package rust-mode
  :ensure
  :demand t)

;; git time machine
(use-package git-timemachine
  :ensure
  :demand t)

;; proof general
;; Open .v files with Proof General's Coq mode
(load "~/.emacs.d/lisp/PG/generic/proof-site")
(use-package company-coq
  :ensure
  :demand t)

;; some handy utilities
(defun hs-region-length ()
  "Find the length of the selected region."
  (interactive)
  (message (format "%d" (- (region-end) (region-beginning)))))
(global-set-key (kbd "C-c l") 'hs-region-length)

;; javascript
(use-package js2-mode
  :ensure
  :demand t)
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

;; highlight bot replays
(load "~/.emacs.d/lisp/highlight-console-replays.el")
(require 'highlight-console-replays)

(provide '.emacs)
;;; .emacs ends here

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

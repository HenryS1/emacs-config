(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(custom-enabled-themes (quote (zerodark)))
 '(custom-safe-themes
   (quote
    ("237e67159f3c218980764d3a5ffbd4676578ed6a0daf4e8d10d95f2bd73fb08c" "dd58e14ea1b20d3948964e15b55040dc415605bbda2ba0521d8e1c65252decf6" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
    (nand2tetris-assembler nand2tetris yaml-mode sml-mode restclient rest-client cider flycheck-cask smartparens yatemplate popup-imenu ensime exec-path-from-shell demo-it iedit company company-ghc scala-mode sbt-mode idris-mode zerodark-theme use-package slime paredit multiple-cursors ido-ubiquitous helm-projectile flx-ido cuda-mode))))
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

(use-package helm :demand :ensure t)
(use-package projectile :demand :ensure t)
(use-package flx :demand :ensure t)

(use-package helm-projectile :demand :ensure t)

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
(setq slime-contribs '(slime-fancy))

;; paredit
(use-package paredit :demand :ensure t)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

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
(use-package zerodark-theme :demand :ensure t)
(zerodark-setup-modeline-format)

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
(eval-after-load 'haskell-mode
          '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ";" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(add-to-list 'load-path "~/.cabal/share/x86_64-linux-ghc-8.0.1/ghc-mod-5.8.0.0")
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
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

;; org-mode
(setq org-src-tab-acts-natively t)
(setq org-src-fontify-natively t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (org . t)
   (sh . t)))

;; imenu
(use-package popup-imenu
  :commands popup-imenu
  :bind ("M-i" . popup-imenu))

;; clojure
(use-package cider
  :ensure t
  :demand t)

;; magit
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

(provide '.emacs) 
;;; .emacs ends here


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(custom-enabled-themes '(doom-moonlight))
 '(custom-safe-themes
   '("774aa2e67af37a26625f8b8c86f4557edb0bac5426ae061991a7a1a4b1c7e375" "4daff0f7fb02c7a4d5766a6a3e0931474e7c4fd7da58687899485837d6943b78" "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "356e5cbe0874b444263f3e1f9fffd4ae4c82c1b07fe085ba26e2a6d332db34dd" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "237e67159f3c218980764d3a5ffbd4676578ed6a0daf4e8d10d95f2bd73fb08c" "dd58e14ea1b20d3948964e15b55040dc415605bbda2ba0521d8e1c65252decf6" default))
 '(fci-rule-color "#4C566A")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'stack-ghci)
 '(haskell-tags-on-save t)
 '(jdee-db-active-breakpoint-face-colors (cons "#191C25" "#80A0C2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#191C25" "#A2BF8A"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#191C25" "#434C5E"))
 '(package-selected-packages
   '(groovy-mode gradle-mode poly-noweb poly-markdown coffee-mode go-mode rustic magit ido-completing-read+ ovpn-mode dante dap-mode posframe json-mode terraform-doc terraform-mode terraform prism prism-whitespace-mode slime-company haskell-mode edit-indirect ssh-agency keychain-environment yapfify flycheck-rust cargo toml-mode :leetcode elein exotica-theme exotica ein w3 graphviz-dot-mode pdfgrep kotlin-mode pdf-tools hy-mode python-pytest pipenv proof-general helm-pydoc pydoc python-mode poly-R polymode poly-mode ess-smart-underscore org-ref ess evil ccls doom-modeline js2-mode doom-themes realgud opencl-mode flycheck-irony irony git-timemachine company-coq htmlize ox-reveal org-reveal sass-mode hamlet-mode intero eros nand2tetris-assembler nand2tetris yaml-mode sml-mode restclient rest-client cider flycheck-cask smartparens yatemplate popup-imenu exec-path-from-shell demo-it iedit company company-ghc scala-mode sbt-mode idris-mode zerodark-theme use-package slime paredit multiple-cursors ido-ubiquitous helm-projectile flx-ido cuda-mode))
 '(polymode-exporter-output-file-format "%sexported")
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
;;                    ("melpa-stable" . "http://stable.melpa.org/packages/")
                    ))

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

;; shell prompt issue
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; proof general for coq
(use-package proof-general
  :demand
  :ensure t)

;; (global-prettify-symbols-mode 0)
;; (setq coq-symbols
;;   '(("forall" ?∀)
;;     ("->" ?→)
;;     ("exists" ?∃)
;;     ("=>" ?⇒)
;;     ("False" ?⊥)
;;     ("True" ?⊤)))

;; (add-hook 'coq-mode-hook
;;           (lambda ()
;;             (setq prettify-symbols-alist coq-symbols)))

;; flycheck
(use-package flycheck :demand :ensure t)
(use-package flycheck-cask
  :commands flycheck-cask-setup
  :config (add-hook 'emacs-lisp-mode-hook (flycheck-cask-setup)))
(add-to-list 'flycheck-clang-include-path "/usr/local/include/gtest/")
(global-flycheck-mode)

;; real gud
(use-package realgud :demand :ensure t)

;; helm
(use-package helm :demand :ensure t)
(use-package projectile :demand :ensure t)
(use-package flx :demand :ensure t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c p f") 'helm-projectile-find-file)
(global-set-key (kbd "C-c p s g") 'helm-projectile-grep)
(setq projectile-use-git-grep 1)

(use-package helm-projectile :demand :ensure t)
(helm-mode 1)
(helm-projectile-on)

;; c++
(use-package irony :demand :ensure t)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))
(add-to-list 'auto-mode-alist '("\\.tpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
;; (use-package flycheck-irony :demand :ensure t)
;; (add-hook 'c++-mode-hook 'irony-mode)

;; (setq irony-additional-clang-options '("-std=c++11"))

;; opencl
(use-package opencl-mode :demand :ensure t)
(add-to-list 'auto-mode-alist '("\\.cl$" . opencl-mode))

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
;; to increase heap size use "/usr/local/bin/sbcl --dynamic-space-size <mb size>"
(setq inferior-lisp-program "/usr/local/bin/sbcl")
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
(add-hook 'hy-mode-hook #'enable-paredit-mode)
(define-key paredit-mode-map (kbd "C-M-n") #'forward-list)
(define-key paredit-mode-map (kbd "C-M-p") #'backward-list)
(define-key paredit-mode-map (kbd "C-M-f") #'forward-sexp)
(define-key paredit-mode-map (kbd "C-M-b") #'backward-sexp)

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

;; doom theme
(use-package doom-themes :demand :ensure t)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

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

(defvar sp-interactive-dwim)

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
  (read-only-mode)
  (ansi-color-apply-on-region (point-min) (point-max))
  (read-only-mode))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'eshell-preoutput-filter-functions 'ansi-color-apply)

;; scala
(use-package sbt-mode :ensure t)
(use-package scala-mode :ensure t)

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

;; (use-package lsp-mode
;;   ;; Optional - enable lsp-mode automatically in scala files
;;   :hook  (scala-mode . lsp)
;;          (lsp-mode . lsp-lens-mode)
;;   :config (setq lsp-prefer-flymake nil))

;; Enable nice rendering of documentation on hover
;; (use-package lsp-ui)

;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
(use-package yasnippet)

;; Add company-lsp backend for metals
;; (use-package company-lsp)

;; Use the Debug Adapter Protocol for running tests and debugging
;; (use-package posframe
;;   ;; Posframe is a pop-up tool that must be manually installed for dap-mode
;;   )
;; (use-package dap-mode
;;   :hook
;;   (lsp-mode . dap-mode)
;;   (lsp-mode . dap-ui-mode))

;; (use-package lsp-metals
;;   :ensure t
;;   :demand t)

;; Use the Tree View Protocol for viewing the project structure and triggering compilation
;; (use-package lsp-treemacs
;;   :config
;;   (lsp-metals-treeview-enable t)
;;   (setq lsp-metals-treeview-show-when-views-received t))

;; projectile
(projectile-mode 1)


;; haskell
;; (use-package intero
;;   :ensure t
;;   :demand)
;(add-hook 'haskell-mode-hook 'intero-mode)
(use-package company-ghc :ensure t)

;; company mode
(use-package company :ensure t)
(add-hook 'prog-mode-hook (lambda () (company-mode 1)))
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

(use-package elein
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

;; org-latex-shortcut
(global-set-key (kbd "C-c M-l p") 'org-latex-preview)

;; htmlize
(use-package htmlize
  :ensure
  :demand t)

;; git time machine
(use-package git-timemachine
  :ensure
  :demand t)

;; git grep shortcut
(global-set-key (kbd "C-c u") 'vc-git-grep)

;; some handy utilities
(defun hs-region-length ()
  "Find the length of the selected region."
  (interactive)
  (message (format "%d" (- (region-end) (region-beginning)))))
(global-set-key (kbd "C-c l") 'hs-region-length)

;; coffeescript

(use-package coffee-mode
  :ensure
  :demand t)

;; javascript
(use-package js2-mode
  :ensure
  :demand t)
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

;;(set-frame-parameter nil 'fullscreen 'fullboth)

;; highlight bot replays
(when (file-exists-p "~/.emacs.d/lisp/highlight-console-replays.el")
  (load "~/.emacs.d/lisp/highlight-console-replays.el")
  (require 'highlight-console-replays))

;; R lang
(use-package ess
  :ensure
  :demand t)

(use-package ess-smart-underscore
  :ensure
  :demand t)

;; Multiple major modes (used by R)
(use-package polymode
  :ensure
  :demand t)

(use-package poly-R
  :ensure
  :demand t)
(add-to-list 'auto-mode-alist '("\\.rmd" . poly-r-mode))

(use-package poly-markdown
  :ensure
  :demand t)
(add-to-list 'auto-mode-alist '("\\.rmd" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.rmd" . poly-markdown+R-mode))

;; Python
(use-package pydoc
  :ensure
  :demand t)

(use-package helm-pydoc
  :ensure
  :demand t)

(use-package yapfify
  :ensure
  :demand t)

(add-hook 'python-mode-hook 'yapf-mode)

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

(use-package python-pytest
  :ensure
  :demand t)

(use-package ein
  :ensure
  :demand t)

(setq flycheck-python-flake8-executable "flake8")
(setq flycheck-python-flake8-executable "python3")

;; (use-package pylint
;;   :ensure
;;   :demand t)
;; (autoload 'pylint "pylint")
;; (add-hook 'python-mode-hook 'pylint-add-menu-items)
;; (add-hook 'python-mode-hook 'pylint-add-key-bindings)

(global-set-key (kbd "C-c C-p t") #'python-test-popup)

(setq pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended)

;; (with-eval-after-load "python"
;;   (define-key python-mode-map (kbd "C-c C-d") 'helm-pydoc))

(setq python-shell-interpreter "/usr/local/bin/python3")

;; direnv
;; (use-package direnv
;;   :ensure
;;   :demand t)
;; (direnv-mode)
;; (setenv "LANG" "en_US.UTF-8")

;; hy-lang
(use-package hy-mode
  :ensure
  :demand t)
(add-to-list 'auto-mode-alist '("\\.hy" . hy-mode))
(add-hook 'hy-mode-hook 'pipenv-mode)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; pdfs
(use-package pdf-tools
  :ensure
  :demand t)
(pdf-loader-install)

;; prism
(use-package prism
  :ensure
  :demand t)

(add-hook 'python-mode-hook 'prism-whitespace-mode)
(add-hook 'lisp-mode-hook 'prism-mode)

;; org mode export to pdf with code highlighting

(require 'org)
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(add-to-list 'org-latex-packages-alist '("" "listingsutf8"))

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-src-fontify-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   (latex . t)))

;; kotlin mode

(use-package kotlin-mode
  :ensure
  :demand t)
(add-to-list 'auto-mode-alist '("\\.kt" . kotlin-mode))

;; graphviz

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))

(use-package graphviz-dot-mode
  :ensure
  :demand t)

(add-to-list 'auto-mode-alist '("\\.dot" . graphviz-dot-mode))

;; Unfill
;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
(defun unfill-paragraph (&optional region)
  "Unfill REGION, otherwise paragraph at point.

i.e. the reverse of fill paragraph."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)

(defmacro quiescent-for-all-paragraphs (&rest body)
  "Execute BODY with the point in each paragraph in the current buffer."
  `(save-excursion
     (goto-char (point-min))
     (while (not (eq (point) (point-max)))
       (ignore-errors
         ,@body
         (forward-paragraph)))))

(defun quiescent-fill-all-paragraphs ()
  "Run `fill-paragraph' on all paragraphs in the current document."
  (interactive)
  (quiescent-for-all-paragraphs (fill-paragraph)))

(defun quiescent-unfill-all-paragraphs ()
  "Run `unfill-paragraph' on all paragraphs in the current document."
  (interactive)
  (quiescent-for-all-paragraphs (unfill-paragraph)))

;; pdf tools

(defvar selected-pages (list))

(defun select-page ()
  "Add current page to list of selected pages."
  (interactive)
  (add-to-list 'selected-pages (cons (buffer-file-name) (pdf-view-current-page)) t))

(defun compare-pdf-pages (one other)
  "ONE is less than OTHER if it's filename is lexicographically less than or it page is less."
  (or (string< (car one) (car other))
      (and (string= (car one) (car other))
           (< (cdr one) (cdr other)))))

(defun prepare-pdf-pages (pages)
  "Groups PAGES by filename and orders them by page number."
  (loop with sorted = (sort pages #'compare-pdf-pages)
     with current-pages = nil
     with current-file = nil
     with result = (list)
     for page in sorted
     when (null current-file)
     do (setf current-file (car page))
     when (not (string= current-file (car page)))
     do (push (cons current-file (reverse current-pages)) result)
       (setf current-file (car page))
       (setf current-pages nil)
     do (push (cdr page) current-pages)
     finally (progn (push (cons current-file (reverse current-pages)) result)
                    (return result))))

(defun format-file-selection (file-selection)
  "Formats FILE-SELECTION for pdfjam."
  (list (car file-selection) (mapconcat #'number-to-string
                                        (cdr file-selection)
                                        ",")))

(defun extract-selected-pages (file)
  "Save selected pages to FILE."
  (interactive "FSave as: ")
  (setq selected-pages (sort selected-pages #'compare-pdf-pages))
  (apply #'start-process "pdfjam" "*pdfjam*"
                 "pdfjam"
                 (append (apply #'append (mapcar #'format-file-selection
                                  (prepare-pdf-pages selected-pages)))
                         (list "-o"
                               (expand-file-name file))))
  (setf selected-pages (list)))

(define-key pdf-view-mode-map "S" #'select-page)

;; lsp

;;(use-package lsp-mode)

;;(use-package lsp-ui)

;; rust

(use-package toml-mode)

(use-package rustic)

(setq lsp-rust-server 'rust-analyzer)
(setq lsp-rust-analyzer-server-command '("~/.cargo/bin/rust-analyzer"))
(setq rustic-lsp-client 'lsp-mode)

;; Add keybindings for interacting with Cargo
(use-package cargo
  :hook (rustic . cargo-minor-mode))

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(push 'rustic-clippy flycheck-checkers)

;; gradle
(use-package gradle-mode :ensure :demand)
(use-package groovy-mode :ensure :demand)

;; keychain management

(use-package keychain-environment
  :ensure
  :demand t)
(keychain-refresh-environment)

;; ssh agent
(use-package ssh-agency
  :ensure
  :demand t)

;; terraform

(use-package terraform-mode
  :ensure
  :demand t)

(use-package terraform-doc
  :ensure
  :demand t)

;; json-mode

(use-package json-mode
  :ensure
  :demand t)

;; open vpn

(use-package ovpn-mode
  :ensure
  :demand t)

;; go
(use-package go-mode
  :ensure
  :demand t)

;; gpg
(setf epa-pinentry-mode 'loopback)

;; maxima

(add-to-list 'load-path "/usr/local/Cellar/maxima/5.43.0/share/maxima/5.43.0/emacs")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))

(provide '.emacs)
;;; .emacs ends here

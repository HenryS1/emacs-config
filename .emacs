;;; .emacs --- Personal Emacs configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;; Packages are managed with the built-in `use-package'.  Every package is
;; installed on demand (`use-package-always-ensure') and loaded lazily
;; (`use-package-always-defer'); anything that must load at startup says
;; `:demand t'.

;;; Code:

;;;; Package management

(setq native-comp-async-report-warnings-errors 'silent)

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Emacs normally initialises packages before loading this file.
(unless (bound-and-true-p package--initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t
      use-package-always-defer t)

;; Keep Custom's output out of this file.
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;;; Core defaults

(setq inhibit-startup-screen t
      create-lockfiles nil
      make-backup-files nil
      scroll-error-top-bottom t
      show-paren-delay 0.5
      sentence-end-double-space nil
      dired-dwim-target t
      epg-pinentry-mode 'loopback)

(setq-default indent-tabs-mode nil
              tab-width 4
              c-basic-offset 4)

(column-number-mode 1)
(electric-indent-mode 0)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-c u") #'vc-git-grep)

;; Colourise compilation output.
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

;;;; Environment

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :demand t
  :config (exec-path-from-shell-initialize))

(use-package keychain-environment
  :demand t
  :config (keychain-refresh-environment))

;;;; UI

;; hide the menu bar, the tool bar and scroll bars
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)

(set-face-attribute 'default nil :font "hack")

(use-package doom-themes
  :demand t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-moonlight t)
  ;; flash the mode-line on errors
  (doom-themes-visual-bell-config))

(use-package doom-modeline
  :demand t
  :config (doom-modeline-mode 1))

(use-package all-the-icons)

;;;; Completion and projects

(use-package helm
  :demand t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files))
  :config (helm-mode 1))

(use-package projectile
  :demand t
  :custom (projectile-use-git-grep t)
  :config (projectile-mode 1))

(use-package helm-projectile
  :demand t
  :bind (("C-c p f" . helm-projectile-find-file)
         ("C-c p s g" . helm-projectile-grep))
  :config (helm-projectile-on))

(use-package company
  :hook (prog-mode . company-mode)
  :custom
  (company-frontends '(company-preview-frontend))
  (company-idle-delay 0))

(use-package popup-imenu
  :bind ("M-i" . popup-imenu))

;;;; Editing

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

;; iedit binds C-; when it loads, so it can't be deferred.
(use-package iedit
  :demand t)

(use-package paredit
  :hook ((emacs-lisp-mode
          eval-expression-minibuffer-setup
          ielm-mode
          lisp-mode
          lisp-interaction-mode
          scheme-mode
          clojure-mode
          hy-mode) . enable-paredit-mode)
  :bind (:map paredit-mode-map
              ("C-M-n" . forward-list)
              ("C-M-p" . backward-list)
              ("C-M-f" . forward-sexp)
              ("C-M-b" . backward-sexp)))

(use-package eros
  :demand t
  :config (eros-mode 1))

(use-package prism
  :hook ((python-mode . prism-whitespace-mode)
         (lisp-mode . prism-mode)))

(use-package format-all)

(defun hs-maybe-enable-format-all ()
  "Enable `format-all-mode' except where a language-specific formatter runs.
Python is formatted by yapf and Rust by rustic."
  (unless (derived-mode-p 'python-mode 'python-base-mode
                          'rust-mode 'rustic-mode)
    (format-all-mode 1)))
(add-hook 'prog-mode-hook #'hs-maybe-enable-format-all)

;;;; Editing helpers

(defun hs-region-length ()
  "Find the length of the selected region."
  (interactive)
  (message "%d" (- (region-end) (region-beginning))))
(global-set-key (kbd "C-c l") #'hs-region-length)

(defun quiescent-yank-with-current-indentation ()
  "Yank to point, inferring the correct level of indentation.

Infer indentation by whether the point has whitespace to the start of
the line before it.  e.g. this is usually the case when you're inside a
switch statement."
  (interactive)
  (let ((start (point))
        (starts-with-whitespace (rx (seq line-start (one-or-more blank))))
        (text-up-to-point (save-excursion
                            (buffer-substring (point)
                                              (progn (beginning-of-line)
                                                     (point))))))
    (if (string-match starts-with-whitespace text-up-to-point)
        (progn
          (yank)
          (save-excursion
            (narrow-to-region start (point))
            (goto-char start)
            (while (and (/= (point) (progn
                                      (ignore-errors
                                        (end-of-line)
                                        (forward-char))
                                      (point)))
                        (/= (point) (point-max)))
              (insert text-up-to-point))
            (widen)))
      (yank))))

;; Stefan Monnier <foo at acm.org>.  It is the opposite of fill-paragraph.
(defun unfill-paragraph (&optional region)
  "Unfill REGION, otherwise paragraph at point.

i.e. the reverse of fill paragraph."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))
(global-set-key (kbd "M-Q") #'unfill-paragraph)

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

;;;; Tools

(use-package magit
  ;; magit binds C-x g itself
  :bind ("C-x M-g" . magit-dispatch))

(use-package git-timemachine)

(use-package restclient)

;;;; Org

(setq org-export-time-stamp-file nil
      org-src-fontify-natively t
      org-latex-src-block-backend 'minted
      org-latex-pdf-process
      (make-list 3 "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(with-eval-after-load 'org
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 2.0))
  (define-key org-mode-map (kbd "C-c M-l p") #'org-latex-preview)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (python . t)
     (latex . t)
     (dot . t)
     (lisp . t))))

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-packages-alist '("" "minted")))

(use-package ox-reveal
  :after ox
  :demand t
  :custom (org-reveal-root "file:///Users/henrysteere/reveal.js/"))

;;;; Languages

;; C / C++
(use-package cmake-mode)

;; Clojure
(use-package cider)

;; Coq
(use-package proof-general)

;; Docker
(use-package dockerfile-mode)

;; F*
(use-package fstar-mode
  :mode "\\.fsi?\\'")

;; Go
(use-package go-mode)

;; GDScript
(use-package gdscript-mode)

;; GLSL
(use-package glsl-mode)

;; Gradle / Groovy
(use-package gradle-mode)
(use-package groovy-mode)

;; Graphviz
(use-package graphviz-dot-mode)

;; Haskell
(use-package haskell-mode
  :custom
  (haskell-process-type 'stack-ghci)
  (haskell-process-auto-import-loaded-modules t)
  (haskell-process-log t)
  (haskell-process-suggest-remove-import-lines t)
  (haskell-tags-on-save t))

;; Hy
(use-package hy-mode)

;; JavaScript
(use-package js2-mode
  :mode "\\.js\\'")

;; JSON
(use-package json-mode)

;; Common Lisp
(use-package slime
  :custom
  ;; to increase heap size use "sbcl --dynamic-space-size <mb size>"
  (inferior-lisp-program "sbcl --dynamic-space-size 2048")
  (slime-contribs '(slime-fancy slime-asdf)))

;; Lua
(use-package lua-mode)

;; Maxima
(use-package maxima
  :mode ("\\.ma[cx]\\'" . maxima-mode)
  :interpreter ("maxima" . maxima-mode)
  :custom (maxima-display-maxima-buffer nil))

;; NASM
(use-package nasm-mode
  :mode "\\.asm\\'")

;; Odin (local)
(load "~/.emacs.d/odin/odin-mode.el" t)

;; Prolog
(add-to-list 'auto-mode-alist '("\\.prlg\\'" . prolog-mode))

;; Protobuf
(use-package protobuf-mode)

;; Python (uses the built-in python.el)
(setq python-shell-interpreter "python3"
      flycheck-python-flake8-executable "flake8")

(use-package pydoc)
(use-package helm-pydoc)

(use-package yapfify
  :hook (python-mode . yapf-mode))

(use-package pipenv
  :hook ((python-mode hy-mode) . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function
        #'pipenv-projectile-after-switch-extended))

(use-package python-pytest
  ;; C-c C-p is `run-python' in python-mode, so a C-c C-p prefix is unreachable
  :bind ("C-c t" . python-pytest-dispatch))

(use-package ein)

;; R
(use-package ess)
(use-package ess-smart-underscore
  :after ess-r-mode
  :demand t)

;; Rust
(use-package toml-mode)

(use-package rustic
  :custom
  (rustic-format-on-save t)
  (rustic-lsp-setup-p nil))

(use-package cargo
  :hook (rustic-mode . cargo-minor-mode))

(use-package flycheck-rust
  :hook (flycheck-mode . flycheck-rust-setup))

(with-eval-after-load 'flycheck
  (add-to-list 'flycheck-checkers 'rustic-clippy))

;; Sass
(use-package sass-mode)

;; Scala
(use-package scala-mode
  :hook (scala-mode . (lambda ()
                        (setq-local format-all-formatters
                                    '(("Scala" (scalafmt)))))))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

;; Swift
(use-package swift-mode)

;; Terraform
(use-package terraform-mode)
(use-package terraform-doc)

;; YAML
(use-package yaml-mode)

;;;; Local lisp

(let ((replays "~/.emacs.d/lisp/highlight-console-replays.el"))
  (when (file-exists-p replays)
    (load replays)
    (require 'highlight-console-replays)))

;;; .emacs ends here

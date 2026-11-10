;;; early-init.el --- Early startup configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;; Loaded before the package system and the first frame are initialised.
;; Settings here take effect before any UI is drawn.

;;; Code:

(setq native-comp-async-report-warnings-errors 'silent)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; hide the menu bar, the tool bar and scroll bars before the first frame
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)

;;; early-init.el ends here

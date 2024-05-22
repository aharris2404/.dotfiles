;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional. (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; see 'c-h v doom-font' for documentation and more examples of what they
;; accept. for example:
;;
(setq doom-font (font-spec :family "monaco" :size 16 :weight 'medium))
;;(setq doom-font (font-spec :family "fira code" :size ))
;;
;;(setq doom-font (font-spec :family "fira code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "fira sans" :size 13))
;;
;; if you or emacs can't find your font, use 'm-x describe-font' to look them
;; up, `m-x eval-region' to execute elisp code, and 'm-x doom/reload-font' to
;; refresh your font settings. if emacs still can't find your font, it likely
;; wasn't installed correctly. font issues are rarely doom issues!

;; there are two ways to load a theme. both assume the theme is installed and
;; available. you can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. this is the default:
(setq doom-theme 'doom-opera)

(custom-theme-set-faces! 'doom-opera
  '(line-number :foreground "dim gray")
  '(line-number-current-line :foreground "white")
  ;; '(doom-modeline-project-dir :foreground "blue")
  ;; '(doom-modeline-buffer-path   :foreground "blue")
  ;;'(mode-line-inactive :background "dim gray" :foreground "white" :height 80)
  ;;'(mode-line :background "black")
  ;;'(default :background "#002b36")
  )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
(add-to-list 'exec-path "/Library/TeX/texbin/")

(setq org-latex-create-formula-image-program 'dvisvgm)
;; USER CUSTOMIZATION
;;
;;
(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

(advice-add #'org-toggle-heading :after #'recenter-top-bottom)

;; PATH
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; KEYBINDINGS

(map! :leader
      :desc "Switch between most recent buffer"
      "b TAB"
      #'evil-switch-to-windows-last-buffer)

(map! :leader
      :desc "Switch to next window"
      "w TAB"
      #'evil-window-next)

(map! :map rustic-mode-map
  :localleader
  (:prefix ("b" . "build")
    :desc "cargo run with input"     "I" #'my-cargo-run))
(defun my-cargo-run ()
  "Build and run Rust code."
  (interactive)
  (rustic-cargo-run)
  (let (
      (orig-win (selected-window))
      (run-win (display-buffer (get-buffer "*cargo-run*") nil 'visible))
    )
    (select-window run-win)
    (comint-mode)
    (read-only-mode 0)
  )
)

;; helper function to copy current-buffer-name
(defun my-yank-buffer-file-name ()
  (interactive)
  (kill-new (buffer-file-name)))

(after! restclient (require 'gnutls))

(after! evil-escape
  (setq evil-escape-key-sequence "fd"))

(after! magit
  (add-hook 'magit-status-mode-hook #'magit-dispatch))

(add-to-list 'load-path "~/.dotfiles/.doom.d/machine")

;;work
(if (equal (system-name) "P3747P2J9Q")
    (load "vz-mac")
  )

;;personal
(if (equal (system-name) "Andrews-MBP")
    (load "andrew-mac")
  )

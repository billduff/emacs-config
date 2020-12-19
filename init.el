(require 'package)
(setq package-archives nil)
(add-to-list 'package-archives (cons "gnu" "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/"))
(package-initialize)

;; General
(global-linum-mode t)
(global-undo-tree-mode)
(setq column-number-mode t)
(scroll-bar-mode -1)
(setq ring-bell-function nil)
(setq make-backup-files nil)
(iswitchb-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Overwrite selected text, rather than appending to it.
(delete-selection-mode t)

;; Turn on syntax highlighting for all files emacs knows how to highlight.
(global-font-lock-mode t)

;; Make highlight color always be the mac highlight color.
(set-face-attribute 'region nil :background "#a9d1ff")

;; Set default font size to 10pt for laptop and 9pt for desktop.
(set-face-attribute
 'default
 nil
 :height
 (if (equal (getenv "DISPLAY") "Williams-MBP.lan")
     100
   90))

(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'iswitchb-define-mode-map-hook
          (lambda ()
            (mapc (lambda (K)
                    (let* ((key (car K)) (fun (cdr K)))
                      (define-key iswitchb-mode-map (read-kbd-macro key) fun)))
                  '(("<right>" . iswitchb-next-match)
                    ("<left>" . iswitchb-prev-match)
                    ("<up>" . ignore)
                    ("<down>" . ignore)))))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq-default fill-column 100)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
; CR wduff: Figure out how to tie this to fill-column.
(setq whitespace-line-column 100)
(global-whitespace-mode t)

;; ANSI color in compilation buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; save Customize settings in separate .el file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; OCaml
(require 'ocaml-settings "~/.emacs.d/ocaml-settings.el")
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

;; SML
(require 'sml-settings "~/.emacs.d/sml-settings.el")

;; Twelf
; (require 'twelf-settings "~/.emacs.d/twelf-settings.el")

;; Adga
; (require 'agda-settings "~/.emacs.d/agda-settings.el")

;; Coq
; (require 'coq-settings "~/.emacs.d/coq-settings.el")

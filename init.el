;adding load-path
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/fci")
;EVIL mode
(require 'evil)
(evil-mode 1)
;whitespace, cleanup, change TABs to spaces
(require 'whitespace)
(setq whitespace-style '(face empty tabs trailing indentation))
(setq-default indent-tabs-mode nil)
(global-whitespace-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)
;change the colors
(set-face-attribute 'font-lock-comment-face nil :foreground "#5f9f7f")
(set-face-attribute 'minibuffer-prompt nil :foreground "#5f9f7f")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#00bfff")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#ab82ff")
(set-face-attribute 'font-lock-string-face nil :foreground "#43cd80")
(set-face-attribute 'font-lock-builtin-face nil :foreground "#79cdcd")
(set-face-attribute 'font-lock-constant-face nil :foreground "#7ac5cd")
;show matching parentheses
(show-paren-mode 1)
;Fill Column Indicator
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode 1)))
(global-fci-mode 1)
(defun auto-fci-mode (&optional unused)
  (if (> (window-width) (+ fci-rule-column 1))
      (fci-mode 1)
      (fci-mode 0)))
(add-hook 'after-change-major-mode-hook 'auto-fci-mode)
(add-hook 'window-configuration-change-hook 'auto-fci-mode)
;Wrap lines in org-mode
(setq org-startup-truncated nil)
;Set up default Scheme implementation
(setq geiser-active-implementations '(guile))

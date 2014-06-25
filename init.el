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
;change the color of comments
(set-face-attribute 'font-lock-comment-face nil :foreground "#5f9f7f")
(set-face-attribute 'minibuffer-prompt nil :foreground "#5f9f7f")
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

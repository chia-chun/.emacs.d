(add-to-list 'load-path "~/.emacs.d/fci")
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(require 'whitespace)
(setq whitespace-style '(face empty tabs trailing indentation))
(setq-default indent-tabs-mode nil)
(global-whitespace-mode t)

(add-hook 'before-save-hook 'whitespace-cleanup)

(set-face-attribute 'font-lock-comment-face nil :foreground "#3f7f5f")

(show-paren-mode 1)

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

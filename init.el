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
;Change colors
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "gray7" :foreground "gray77" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 145 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-builtin-face ((t (:foreground "#79cdcd"))))
 '(font-lock-comment-face ((t (:foreground "#5f9f7f"))))
 '(font-lock-constant-face ((t (:foreground "#7ac5cd"))))
 '(font-lock-function-name-face ((t (:foreground "#00bfff"))))
 '(font-lock-keyword-face ((t (:foreground "#ab82ff"))))
 '(font-lock-string-face ((t (:foreground "#43cd80"))))
 '(geiser-font-lock-autodoc-identifier ((t (:foreground "#43cd80"))))
 '(minibuffer-prompt ((t (:foreground "#5f9f7f"))))
 '(outline-1 ((t (:foreground "#eedd82"))))
 '(outline-2 ((t (:foreground "#98fb98"))))
 '(region ((t (:background "#006400")))))

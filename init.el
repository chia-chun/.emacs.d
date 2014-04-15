(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(require 'whitespace)
(setq whitespace-line-column 79)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t) 

(add-hook 'before-save-hook 'whitespace-cleanup)

(set-face-attribute 'font-lock-comment-face nil :foreground "#3f7f5f")

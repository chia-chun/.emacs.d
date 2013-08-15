(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(require 'whitespace)
(setq whitespace-line-column 79)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

I like the power of emacs but also think the text editing
function of vi/vim is better.
So I decided to use emacs + EVIL.

2013 Aug 19
Change the comment color.
Add the following to init.el

(set-face-attribute 'font-lock-comment-face nil :foreground "#3f7f5f")

2013 Aug 15
Add whitespace and 79 column visualization.
Add auto cleanup.
Add the following to init.el

(require 'whitespace)
(setq whitespace-line-column 79)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(add-hook 'before-save-hook 'whitespace-cleanup)

2013 Aug 9
Fixed the problem of using TAB in org mode.
Remove the following binding in evil-maps.el

;(when evil-want-C-i-jump
;  (define-key evil-motion-state-map (kbd "C-i") 'evil-jump-forward))

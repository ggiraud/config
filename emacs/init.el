;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; MYINIT.ORG
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

;; CUSTOM
;;------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-safe-themes (quote (default)))
 '(mac-command-modifier nil)
 '(mac-option-modifier (quote meta))
 '(mac-right-option-modifier (quote (:function alt :mouse alt)))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(magit-log-section-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(package-selected-packages
   (quote
    (vimrc-mode undo-tree magit auctex company-auctex company-math cider color-theme try ace-window rainbow-delimiters paredit-everywhere jq-mode yaml-mode web-mode use-package slime-company shampoo paredit-menu ox-twbs ob-mongo ob-http ob-go nov nginx-mode markdown-mode jsx-mode js2-mode js-comint irony-eldoc htmlize go-eldoc gnuplot flymake-json flycheck-irony f expand-region exec-path-from-shell emmet-mode elpy docker css-eldoc company-web company-try-hard company-tern company-quickhelp company-jedi company-irony-c-headers company-irony company-go browse-kill-ring better-defaults ace-jump-mode)))
 '(pdf-tools-handle-upgrades nil)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(windmove-default-keybindings)
(put 'dired-find-alternate-file 'disabled nil)

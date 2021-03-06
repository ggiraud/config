;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Make emacs follow symlinks without prompting
(setq vc-follow-symlinks t)

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
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" default)))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(magit-log-section-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(ns-alternate-modifier (quote meta))
 '(ns-command-modifier nil)
 '(ns-right-alternate-modifier nil)
 '(package-selected-packages
   (quote
    (yaml-mode xref-js2 which-key web-mode vimrc-mode use-package try smex shampoo rainbow-delimiters paredit-menu paredit-everywhere ox-twbs org-bullets ob-mongo ob-ipython ob-http ob-go nyan-mode nov nginx-mode neotree markdown-mode magit love-minor-mode jsx-mode js-comint ivy-hydra irony-eldoc impatient-mode graphviz-dot-mode go-eldoc gnuplot flycheck-plantuml flycheck-irony expand-region exec-path-from-shell emmet-mode elpy docker css-eldoc counsel company-web company-try-hard company-tern company-shell company-quickhelp company-math company-lua company-jedi company-irony-c-headers company-irony company-go company-auctex company-anaconda cider cdlatex browse-kill-ring ace-window ace-jump-mode)))
 '(pdf-tools-handle-upgrades nil)
 '(safe-local-variable-values (quote ((eval progn (pp-buffer) (indent-buffer)))))
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

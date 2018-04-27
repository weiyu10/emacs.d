(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai-alt)))
 '(custom-safe-themes
   (quote
    ("eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(package-selected-packages
   (quote
    (ggtags monokai-theme monokai-alt-theme uptimes dotenv-mode regex-tool osx-location dsvn htmlize lua-mode gnuplot flycheck-ledger ledger-mode origami flycheck-clojure cider elein cljsbuild-mode clojure-mode slime-company hippie-expand-slime slime cask-mode flycheck-package highlight-quoted macrostep cl-lib-highlight aggressive-indent immortal-scratch auto-compile ipretty elisp-slime-nav paredit-everywhere paredit nginx-mode company-terraform terraform-mode docker-compose-mode dockerfile-mode docker yaml-mode toml-mode racer rust-mode sql-indent projectile-rails yard-mode bundler goto-gem yari robe ruby-compilation inf-ruby rspec-mode ruby-hash-syntax psc-ide purescript-mode flycheck-elm elm-mode dhall-mode hindent intero haskell-mode company-anaconda anaconda-mode pip-requirements restclient httprepl css-eldoc skewer-less less-css-mode scss-mode sass-mode rainbow-mode tagedit org-pomodoro writeroom-mode org-cliplink grab-mac-link org-fstree smarty-mode php-mode add-node-modules-path skewer-mode js-comint xref-js2 prettier-js typescript-mode coffee-mode js2-mode json-mode erlang csv-mode textile-mode cmd-to-echo alert magithub github-clone bug-reference-github yagist git-messenger magit git-timemachine gitconfig-mode gitignore-mode git-blamed vc-darcs darcsum browse-at-remote whitespace-cleanup-mode guide-key highlight-escape-sequences whole-line-or-region move-dup page-break-lines multiple-cursors avy expand-region browse-kill-ring symbol-overlay undo-tree rainbow-delimiters nlinum beacon mode-line-bell vlf dynamic-spaces list-unicode-display unfill mmm-mode default-text-scale session switch-window company-quickhelp company ivy-xref projectile counsel ivy-historian ivy smex flycheck-color-mode-line flycheck ibuffer-vc rg wgrep-ag ag anzu diff-hl diredfl disable-mouse dimmer color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized command-log-mode scratch diminish wgrep exec-path-from-shell fullframe)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq custom-enabled-themes (quote (monokai-alt)))
(menu-bar-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq python-check-command "pep8")

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun kill-all-dired-buffers ()
  "Kill all dired buffers."
  (interactive)
  (save-excursion
    (let ((count 0))
      (dolist (buffer (buffer-list))
        (set-buffer buffer)
        (when (equal major-mode 'dired-mode)
          (setq count (1+ count))
          (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count)))
  )

;; (add-hook 'focus-out-hook (lambda () ((interactive) (save-some-buffers t))))
(defun full-auto-save ()
  (interactive)
  (save-excursion
    (dolist (buf (buffer-list))
      (set-buffer buf)
      (if (and (buffer-file-name) (buffer-modified-p))
          (basic-save-buffer)))))
(add-hook 'auto-save-hook 'full-auto-save)

(global-set-key (kbd "<f1>") 'ggtags-find-definition); jump-to-define
(global-set-key (kbd "<f2>") 'ggtags-find-reference); jump-to-define

(provide 'custom)

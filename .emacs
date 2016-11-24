;;------------------------------------------------------------------------------
;; Packages
;;------------------------------------------------------------------------------
(require 'package)
(setq package-enable-at-startup nil)
;; add mepla to the package-archives list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


;; use-package
;;-------------
(unless (package-installed-p 'use-package) ; installs use-package 
  (package-refresh-contents)
  (package-install 'use-package))

;; loads use-package
(eval-when-compile
  (require 'use-package))
  (setq use-package-always-ensure t) ;; auto install any packages not installed


;; install required packages
;;---------------------------
(use-package evil ; evil - adds vim-like functionality (vim-mode)
  :config
  (evil-mode 1))
(use-package helm-config ; completely changed tab completion (kill-ring, buffers, find-file)
  :ensure helm
  :init
  (setq helm-M-x-fuzzy-match   t ; optional fuzzy matching for helm-M-x
   helm-buffers-fuzzy-matching t ; optional fuzzy matching for helm-mini
   helm-recentf-fuzzy-match    t)
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("C-x r b" . helm-bookmarks)
	 :map helm-map
         ("<tab>" . helm-execute-persistent-action) ; rebind tab to do persistent action
         ("C-i" . helm-execute-persistent-action) ; make TAB work in terminal
         ("C-z" . helm-select-action) ; list actions using C-z
	 )
  :config
  (helm-mode 1))

(use-package helm-projectile
  :init
  (setq projectile-indexing-method 'alien) ; force windows to use external indexing
  ;; after hlem-projectile-switch-project finishes execution, call helm-projectile-find-file (instead of projectile's version)
  (setq projectile-switch-project-action 'helm-projectile-find-file)
  :config
  (projectile-global-mode) ; make projectile automatically rememeber projects that you access files in
  (setq projectile-completion-system 'helm) ; use helm for projectile's completion system
  (helm-projectile-on)) ; enables helm-projectile (override projectile commands)

;; highlightes matching parentheses specific colors when cursor is inside
(use-package highlight-parentheses
  :config
  ;; creates a global mode for highlight-parentheses-mode and enables it
  (define-globalized-minor-mode global-highlight-parentheses-mode
    highlight-parentheses-mode
    (lambda ()
      (highlight-parentheses-mode t)))
  (global-highlight-parentheses-mode t))

;;------------------------------------------------------------------------------
;; General
;;------------------------------------------------------------------------------
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil) ; TAB inserts SPACE's


;;------------------------------------------------------------------------------
;; Theme
;;------------------------------------------------------------------------------
(load-theme 'tango-dark) ; loads the specified theme

(show-paren-mode 1) ; highlights matching parenthesis
;; (linum-mode 1) ; shows line numbers on the left side of the buffer
(tool-bar-mode -1) ; disables the tool bar
(scroll-bar-mode -1) ; disables the scroll bar

;; (with-temp-file "packages.txt" (insert (format "%S" package-activated-list)))


;;------------------------------------------------------------------------------
;; Custom - created when installing plugins
;;------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (highlight-parentheses helm-projectile helm evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

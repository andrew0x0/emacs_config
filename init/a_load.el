;;set XP HOME path
;;(setenv "HOME" "~/")

(defconst my-emacs-path           "~/customization/")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "init/") )
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") )
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")

(defun my-add-subdirs-to-load-path (dir)
  "Load all sub-dir to 'load-path'"
  (interactive)
  (let ((default-directory (concat dir "/")))
    (add-to-list 'load-path dir)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (normal-top-level-add-subdirs-to-load-path))))


;; load all my-emacs-lisps-path' to `load-path'
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)
 
;; list of packages to sync
(setq pfl-packages
      '(
	company-anaconda
	anaconda-mode
	multiple-cursors
	browse-kill-ring
	yasnippet-snippets	
	auto-yasnippet
	company
	flycheck
	flycheck-irony	
	company-c-headers
	ace-jump-mode
	markdown-mode
	w3m
	web-mode
	god-mode
	hydra
	company-tern	
	company-irony
	company-go
	company-irony-c-headers
	irony-eldoc
	irony
	counsel
	ivy
	wgrep
	avy
	smex
	swiper
	ivy-hydra
	expand-region
	counsel-etags
	counsel-gtags	
	ace-window
	itail
	lua-mode
	hc-zenburn-theme
	spacemacs-theme
	clang-format
	))

;; refresh package list if it is not already available
(when (not package-archive-contents) (package-refresh-contents))

;; install packages from the list that are not yet installed
(dolist (pkg pfl-packages)
  (if (not (package-installed-p pkg))
      (if (assoc pkg package-archive-contents)
	  (package-install pkg)
	(progn   (package-refresh-contents)
		 (package-install pkg)))))

(defun reinstall-all-package ()
  (interactive)
  (package-refresh-contents)
  (dolist (pkg pfl-packages)
  (when (assoc pkg package-archive-contents)
    (package-install pkg)))
  )

(setq my_use-anaconda nil)
(setq my_use-rtags nil)
(setq my_use-irony nil)

(let ((have_rc (shell-command "which rc")))
  (if (eq have_rc 0)
      (progn
        (setq my_use-rtags t)
        (setq my_use-irony t))))

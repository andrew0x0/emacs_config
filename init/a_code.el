(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

(setq auto-coding-regexp-alist
      (delete (rassoc 'utf-16be-with-signature auto-coding-regexp-alist)
      (delete (rassoc 'utf-16le-with-signature auto-coding-regexp-alist)
      (delete (rassoc 'utf-8-with-signature auto-coding-regexp-alist)
              auto-coding-regexp-alist))))
(when (> emacs-major-version 23)
  (require 'package)
;;  (add-to-list
;;   'package-archives
;;   '("gnu" . "http://mirrors.163.com/elpa/gnu/")
;;    ("melpa" . "http://mirrors.163.com/elpa/melpa/")
  ;;   )
  (setq package-archives
	'(("gnu" . "http://mirrors.163.com/elpa/gnu/")
	  ("melpa" . "http://mirrors.163.com/elpa/melpa/")))
;;      '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;        ("melpa" . "http://elpa.emacs-china.org/melpa/")))
  (package-initialize))

;;; set up package syncing to allow for syncing between different machines

;; list of packages to sync
(setq pfl-packages
      '(
	company-anaconda
	anaconda-mode
	multiple-cursors
	browse-kill-ring
	company
	flycheck
	flycheck-irony	
	company-c-headers
	ace-jump-mode
	symbol-overlay
	markdown-mode
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

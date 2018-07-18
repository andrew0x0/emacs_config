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

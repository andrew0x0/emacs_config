(prefer-coding-system 'utf-8)
(setq current-language-environment "utf-8")
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

;;help for shell and sometimes of code
(global-set-key (kbd "\C-ch") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-expand-all-abbrevs try-expand-dabbrev
        try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially try-complete-lisp-symbol
        try-complete-file-name-partially try-complete-file-name))


;;hippen file name and path
(require 'filecache)
(add-to-list 'file-cache-filter-regexps "\\.git\\>")
(add-to-list 'file-cache-filter-regexps "\\.svn-base$")
(file-cache-add-directory-recursively "~/project")

;;(require 'ido)
(ido-mode t)

;; use normal find-file function for ftp files
(setq ido-slow-ftp-host-regexps '(".*"))
;; don't search files in other directories
(setq ido-work-directory-list-ignore-regexps '(".*"))
;; set ido buffer
(setq ido-save-directory-list-file "~/.emacs.d/_ido_last")


;;(setq default-directory "~/velio")

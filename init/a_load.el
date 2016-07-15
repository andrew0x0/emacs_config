;;set XP HOME path
;;(setenv "HOME" "~/")

(defconst my-emacs-path           "~/customization/")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") )
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
 

;;set HOME path for XP
(setenv "HOME" "D:/Program Files/GNU")

(defconst my-emacs-path           "~/customization/" "�ҵ�emacs��������ļ���·��")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "���Լ�д��emacs lisp����·��")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "�����ص�emacs lisp����·��")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")

(defun my-add-subdirs-to-load-path (dir)
  "��DIR��������Ŀ¼���ӵ�`load-path'����"
  (interactive)
  (let ((default-directory (concat dir "/")))
    (add-to-list 'load-path dir)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (normal-top-level-add-subdirs-to-load-path))))


;; ��`my-emacs-lisps-path'��������Ŀ¼���ӵ�`load-path'����
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)
 

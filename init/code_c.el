(add-hook 'c-mode-hook 'hs-minor-mode)
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?` ?` _ "''")
    (?\( ?  _ " )")
    (?\[ ?  _ " ]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)

(defun my-c-mode-hook ()
  (require 'cc-mode)
  (interactive)
  (c-set-style "bsd")
  (setq indent-tabs-mode nil)
  (setq default-tab-width 8)
  (setq c-basic-offset 8)   
  (setq tab-stop-list ())
  (setq c-cleanup-list (append c-cleanup-list (list 'brace-else-brace)))
  (c-toggle-auto-state 1) ;;�����Զ�����/1��ʾ�Զ�����
  (c-toggle-hungry-state)  ;; ��ģʽ�£�����Backspaceʱ��ɾ�����Ŀո�
  (define-key c-mode-map [return] 'newline-and-indent) ;; ���س�����C-j�Ĺ��ܣ����е�ͬʱ����
)

(add-hook 'c-mode-hook 'my-c-mode-hook)

;;for c code systel
;;show paren mode
(show-paren-mode t)


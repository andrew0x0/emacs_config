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

(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

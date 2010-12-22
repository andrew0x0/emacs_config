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
  (c-toggle-auto-state 1) ;;不用自动换行/1表示自动换行
  (c-toggle-hungry-state)  ;; 此模式下，当按Backspace时会删除最多的空格
  (define-key c-mode-map [return] 'newline-and-indent) ;; 将回车代替C-j的功能，换行的同时对齐
)

(add-hook 'c-mode-hook 'my-c-mode-hook)

;;for c code systel
;;show paren mode
(show-paren-mode t)


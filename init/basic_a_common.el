;; close error bell
(setq visible-bell t)

;;let mouse jump away of pointer
(mouse-avoidance-mode 'animate)

;;set yes no as y n
(set 'yes-or-no-p 'y-or-n-p)

;;clear temp file
;;(setq-default make-backup-files nil)


;;放大缩小字体
(defun increase-font-size ()
 (interactive)
 (set-face-attribute 'default
                     nil
                     :height
                     (ceiling (* 1.50
                                 (face-attribute 'default :height)))))
(defun decrease-font-size ()
 (interactive)
 (set-face-attribute 'default
                     nil
                     :height
                     (floor (* 0.8
                                 (face-attribute 'default :height)))))
(global-set-key (kbd "C-c C-b") 'increase-font-size)
(global-set-key (kbd "C-c C-s") 'decrease-font-size)

;; 当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; 所有的备份文件转移到~/backups目录下
(setq backup-directory-alist '(("" . "~/.backup")))
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-by-copying t)

;;set cache for kill
(setq kill-ring-max 200)

;;config for debug
;;gdb
(setq gdb-many-windows t )

;;enable save bookmark
;;(setq bookmark-save-flag t)
(setq bookmark-default-file "C:/Documents and Settings/yuaguo/.emacs.bmk")
(setq bookmark-save-flag t)                    

;;;; 各窗口间切换

(global-set-key [M-left] 'windmove-left)

(global-set-key [M-right] 'windmove-right)

(global-set-key [M-up] 'windmove-up)

(global-set-key [M-down] 'windmove-down)

;; tools for copy
(defun copy-line (&optional arg)
 "Save current line into Kill-Ring without mark the line"
 (interactive "P")
 (let ((beg (line-beginning-position)) 
	(end (line-end-position arg)))
 (copy-region-as-kill beg end))
)

(defun copy-word (&optional arg)
 "Copy words at point"
 (interactive "P")
 (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point))) 
	(end (progn (forward-word arg) (point))))
 (copy-region-as-kill beg end))
)


(defun copy-paragraph (&optional arg)
 "Copy paragraphes at point"
 (interactive "P")
 (let ((beg (progn (backward-paragraph 1) (point))) 
	(end (progn (forward-paragraph arg) (point))))
 (copy-region-as-kill beg end))
)

;;keymap for cope
(define-key global-map  "\C-cp" 'copy-paragraph)
(define-key global-map  "\C-cl" 'copy-line)
(define-key global-map  "\C-cw" 'copy-word)

;;enable revert-buffer reload files when files on disk is changed
(global-set-key [f5] (lambda() (interactive) (revert-buffer t t)))

(make-variable-buffer-local 'wcy-shell-mode-directory-changed)
(setq wcy-shell-mode-directory-changed t)

(defun wcy-shell-mode-auto-rename-buffer-output-filter (text)
  (if (and (eq major-mode 'shell-mode)
           wcy-shell-mode-directory-changed)
      (progn
        (let ((bn  (concat "sh:" default-directory)))
          (if (not (string= (buffer-name) bn))
              (rename-buffer bn t)))
        (setq wcy-shell-mode-directory-changed nil))))


(defun wcy-shell-mode-auto-rename-buffer-input-filter (text)
  (if (eq major-mode 'shell-mode)
      (if ( string-match "^[ \t]*cd *" text)
          (setq wcy-shell-mode-directory-changed t))))
(add-hook 'comint-output-filter-functions 'wcy-shell-mode-auto-rename-buffer-output-filter)
(add-hook 'comint-input-filter-functions 'wcy-shell-mode-auto-rename-buffer-input-filter )

(add-hook 'shell-mode-hook 'wcy-shell-mode-hook-func)
(defun wcy-shell-mode-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
                            #'wcy-shell-mode-kill-buffer-on-exit)
      )
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))
      
;;Close all buffers
(defun close-all-buffers()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key [M-f6] 'close-all-buffers)

(server-start)

;;set gdb using arm-none-linux-gdb
;;(defvar gud-gdb-command-name "arm-none-eabi-gdb")
;;(setq gud-gdb-command-name "arm-none-eabi-gdb  --annotate=3 -i=mi -x /home/andrew/velio/gdbscript ")

;; close error bell
(setq visible-bell t)

;;let mouse jump away of pointer
(mouse-avoidance-mode 'animate)

;;set yes no as y n
(set 'yes-or-no-p 'y-or-n-p)

;;clear temp file
(setq-default make-backup-files nil)
(setq make-backup-files nil)

;;·Å´óËõĞ¡×ÖÌå
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

;; µ±ÄãÔÚshell¡¢telnet¡¢w3mµÈÄ£Ê½ÏÂÊ±£¬±ØÈ»Åöµ½¹ıÒªÊäÈëÃÜÂëµÄÇé¿ö,´ËÊ±¼ÓÃÜÏÔ³öÄãµÄÃÜÂë
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; ËùÓĞµÄ±¸·İÎÄ¼ş×ªÒÆµ½~/backupsÄ¿Â¼ÏÂ
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

(setq
  backup-by-copying t ; è‡ªåŠ¨å¤‡ä»½
  backup-directory-alist
  '(("." . "~/.saves")) ; è‡ªåŠ¨å¤‡ä»½åœ¨ç›®å½•"~/.saves"ä¸‹
  delete-old-versions t ; è‡ªåŠ¨åˆ é™¤æ—§çš„å¤‡ä»½æ–‡ä»¶
  kept-new-versions 6 ; ä¿ç•™æœ€è¿‘çš„6ä¸ªå¤‡ä»½æ–‡ä»¶
  kept-old-versions 2 ; ä¿ç•™æœ€æ—©çš„2ä¸ªå¤‡ä»½æ–‡ä»¶
  version-control t) ; å¤šæ¬¡å¤‡ä»½

;;;; ¸÷´°¿Ú¼äÇĞ»»

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


(defun revert-all-buffers()
  (interactive)
  (dolist (buf(buffer-list))
    (with-current-buffer buf
			 (when(and ( buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
			   ( revert-buffer t t t) )))
  (message "Refreshed open files"))

;;enable revert-buffer reload files when files on disk is changed
(global-set-key [f5] (lambda() (interactive) (revert-buffer t t)))
(global-set-key [M-f5] 'revert-all-buffers)
      
;;Close all buffers
(defun close-all-buffers()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key [M-f6] 'close-all-buffers)

(add-hook 'comint-output-filter-functions
'comint-watch-for-password-prompt)

(server-start)

 (setq tramp-default-method "ssh")

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
(setq make-backup-files nil)
(setq-default make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

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

;;set cache for kill
(setq kill-ring-max 200)

;;config for debug
;;gdb
(setq gdb-many-windows t )

(setq
  backup-by-copying t ; 鑷姩澶囦唤
  backup-directory-alist
  '(("." . "~/.saves")) ; 鑷姩澶囦唤鍦ㄧ洰褰�"~/.saves"涓�
  delete-old-versions t ; 鑷姩鍒犻櫎鏃х殑澶囦唤鏂囦欢
  kept-new-versions 6 ; 淇濈暀鏈�杩戠殑6涓浠芥枃浠�
  kept-old-versions 2 ; 淇濈暀鏈�鏃╃殑2涓浠芥枃浠�
  version-control t) ; 澶氭澶囦唤

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


(defun revert-all-buffers()
  (interactive)
  (dolist (buf(buffer-list))
    (with-current-buffer buf
			 (when(and ( buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
			   ( revert-buffer t t t) )))
  (message "Refreshed open files"))

;;enable revert-buffer reload files when files on disk is changed
(global-set-key (kbd "<f5>") (lambda() (interactive) (revert-buffer t t t)))
(global-set-key (kbd "M-<f5>") 'revert-all-buffers)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Ensure ibuffer opens with point at the current buffer's entry.
(defadvice ibuffer
  (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name."
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)

;;Close all buffers
(defun close-all-buffers()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))
(global-set-key [M-f3] 'kill-other-buffers)

(add-hook 'comint-output-filter-functions
'comint-watch-for-password-prompt)

(server-start)

 (setq tramp-default-method "ssh")

(defun new-shell ()
  (interactive)

  (let (
        (currentbuf (get-buffer-window (current-buffer)))
        (newbuf     (generate-new-buffer-name"*shell*"))
       )

   (generate-new-buffer newbuf)
   (set-window-dedicated-p currentbuf nil)
   (set-window-buffer currentbuf newbuf)
   (shell newbuf)
  )
)

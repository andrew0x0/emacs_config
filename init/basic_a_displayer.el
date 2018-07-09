;;show line num
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode t)
(setq linum-format "%3d")

;;show time and date
(setq display-time-24hr-forma t)
(setq display-time-day-and-date t)
(display-time)

;;show buffer name
(setq frame-title-format "Andrew $%f")
      

;;set display
;;color-theme
;;add load-path
(add-to-list 'load-path "./../lisps/color-theme/themes/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-xp)
;;(color-theme-classic)

;;disable tool bar
(setq tool-bar-map (make-sparse-keymap))

;;make key word
(global-font-lock-mode t)


;;set color of backgroud
(set-face-background 'default "azure")

;;set type
(setq default-fill-column 85)
(setq truncate-partial-width-windows nil);¿ª¹Ø×Ô¶¯ÕÛÐÐ(Warp)

;;set screen size
(setq default-frame-alist '((top . 20) (left . 20) (width . 100) (height . 30)))

(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
      nil
    t))
(defvar font-list '("Microsoft Yahei" "ÎÄÈªæäµÈ¿íÎ¢Ã×ºÚ" "ºÚÌå" "ÐÂËÎÌå" "ËÎÌå"))

(require 'cl) ;; find-if is in common list package
(find-if #'qiang-font-existsp font-list)

(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))


(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)

  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl) ; for find if
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
                            :size chinese-font-size)))

    ;; Set the default English font
    ;;
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute 'default nil :font en-font)

    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the English font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset zh-font))))


(qiang-set-font
 '("Liberation Sans Regular" "Consolas" "Monaco" "DejaVu Sans Mono" "Courier New") ":pixelsize=22"
 '("Microsoft Yahei" "ÎÄÈªæäµÈ¿íÎ¢Ã×ºÚ" "ºÚÌå" "ÐÂËÎÌå" "ËÎÌå"))


(put 'upcase-region 'disabled nil)


;;mark copy block
(transient-mark-mode t)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;jump windows by M-number
(add-to-list 'load-path "./../lisps/window-numbering/")
(require 'window-numbering)
(window-numbering-mode 1)


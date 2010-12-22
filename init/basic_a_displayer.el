;;show line num
(setq column-number-mode t)
(setq line-number-mode t)

;;show time and date
(setq display-time-24hr-forma t)
(setq display-time-day-and-date t)
(display-time)

;;show buffer name
(setq frame-title-format "Andrew(NSN) $%f")
      

;;set display
;;color-theme
;;add load-path
;;(add-to-list 'load-path "~/el/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-xp)
;;(color-theme-matrix)

;;disable tool bar
(setq tool-bar-map (make-sparse-keymap))

;;make key word
(global-font-lock-mode t)


;;set color of backgroud
(set-face-background 'default "azure")

;;set type
(setq default-fill-column 85)
(setq truncate-partial-width-windows nil);开关自动折行(Warp)

;;set screen size
(setq default-frame-alist '((top . 20) (left . 20) (width . 100) (height . 30)))

;;set type and size
(create-fontset-from-fontset-spec
 "-*-courier-medium-r-normal--12-*-*-*-*-*-fontset-mymono,
 chinese-gb2312:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
 chinese-gbk:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
 chinese-gb18030:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1"
)
(setq default-frame-alist (append '((font . "fontset-mymono")) default-frame-alist))
(set-default-font "fontset-mymono")

(setq w32-charset-info-alist
    (cons '("gbk" w32-charset-gb2312 . 936) w32-charset-info-alist))

(setq default-frame-alist
      (append
       '((font . "fontset-gbk")) default-frame-alist))

(create-fontset-from-fontset-spec
  "-outline-Courier New-normal-r-normal-normal-20-97-96-96-c-*-fontset-gbk")
(set-fontset-font
 "fontset-default" nil
 "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
 "fontset-gbk" 'kana
 "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
 "fontset-gbk" 'han
 "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
 "fontset-gbk" 'cjk-misc
 "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-fontset-font
 "fontset-gbk" 'symbol
 "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
(set-default-font "fontset-gbk")
(put 'upcase-region 'disabled nil)


;;mark copy block
(transient-mark-mode t)

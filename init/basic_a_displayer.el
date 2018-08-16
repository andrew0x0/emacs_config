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
(setq frame-title-format "Keep moving $%f")
      

;;set display
;;color-theme
;;add load-path
(add-to-list 'load-path "./../lisps/color-theme/spacemacs-theme/")
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-xp)
;;(color-theme-classic)
(load-theme 'spacemacs-dark t)
;;disable tool bar
(setq tool-bar-map (make-sparse-keymap))

;;make key word
(global-font-lock-mode t)


;;set color of backgroud
;;(set-face-background 'default "azure")

;;set type
(setq default-fill-column 85)
(setq truncate-partial-width-windows nil);¿ª¹Ø×Ô¶¯ÕÛÐÐ(Warp)

;;set screen size
(setq default-frame-alist '((top . 20) (left . 20) (width . 100) (height . 30)))

(put 'upcase-region 'disabled nil)


;;mark copy block
(transient-mark-mode t)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;jump windows by M-number
(add-to-list 'load-path "./../lisps/window-numbering/")
(require 'window-numbering)
(window-numbering-mode 1)


;; Setting English Font
(set-face-attribute 'default nil :font "Dejavu Sans Mono 16")


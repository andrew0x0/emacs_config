(require 'ecb)
(require 'ecb-autoloads)


;;dont show startup info  
(setq ecb-tip-of-the-day nil)
(setq ecb-auto-compatibility-check nil)
(setq ecb-source-path (quote ("/")))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-windows-width 0.2))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
  

;;;; 隐藏和显示ecb窗口

(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)

(define-key global-map [(control f2)] 'ecb-show-ecb-windows)

 

;;;; 使某一ecb窗口最大化

(define-key global-map "\C-c1" 'ecb-maximize-window-directories)

(define-key global-map "\C-c2" 'ecb-maximize-window-sources)

(define-key global-map "\C-c3" 'ecb-maximize-window-methods)

(define-key global-map "\C-c4" 'ecb-maximize-window-history)

;;;; 恢复原始窗口布局

(define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)

;;;; enable ecb-auto-activate and don't display tips
(setq ecb-auto-activate t)

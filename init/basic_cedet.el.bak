(defvar cedet-path (concat my-emacs-lisps-path "cedet") "Path of `cedet'")
(my-add-subdirs-to-load-path cedet-path)
(load-file (concat cedet-path "/common/cedet.el"))

(when (and (or (not (boundp 'semantic-mode))
               (and (boundp 'semantic-mode) (null semantic-mode)))
           (locate-library "semantic-ctxt") ; offical cedet
           (require 'cedet nil 'noerror))
  ;; (semantic-load-enable-minimum-features)
  (semantic-load-enable-code-helpers)
  ;; (semantic-load-enable-gaudy-code-helpers)
  ;; (semantic-load-enable-excessive-code-helpers)
  (global-semantic-decoration-mode 1)
  (require 'semantic-decorate-include nil 'noerror)
  (semantic-toggle-decoration-style "semantic-tag-boundary" -1)
  (if window-system
      (semantic-load-enable-semantic-debugging-helpers)
    (progn (global-semantic-show-unmatched-syntax-mode 1)
           (global-semantic-show-parser-state-mode 1)))
  (ignore-errors (semantic-load-enable-primary-exuberent-ctags-support))
  (when (executable-find "global")
    (semanticdb-enable-gnu-global-databases 'c-mode)
    (semanticdb-enable-gnu-global-databases 'c++-mode))
  (global-ede-mode 1)
  ;; (global-srecode-minor-mode 1)
  ;; (setq semantic-c-obey-conditional-section-parsing-flag nil) ; ignore #if
  (setq ede-locate-setup-options
        '(ede-locate-global
          ede-locate-base))

  (setq ede-locate-setup-options
        '(ede-locate-global
          ede-locate-base))

  (enable-visual-studio-bookmarks)
  (define-key global-map [M-f2] 'viss-bookmark-toggle)
  (define-key global-map [M-f7] 'viss-bookmark-next-buffer)
  (define-key global-map [M-f8] 'viss-bookmark-prev-buffer)
  (define-key global-map [(control shift f2)] 'viss-bookmark-clear-all-buffer)

;;  (require 'semantic-c nil 'noerror)
;;  (mapc (lambda (dir)
;;          (semantic-add-system-include dir 'c++-mode)
;;          (semantic-add-system-include dir 'c-mode))
;;   user-include-dirs)
;;  (dolist (file c-preprocessor-symbol-files)
;;    (when (file-exists-p file)
;;      (setq semantic-lex-c-preprocessor-symbol-file
;;            (append semantic-lex-c-preprocessor-symbol-file (list file)))))
)

(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (require 'semantic-decorate-include nil 'noerror)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))

;; Enable SRecode (Template management) minor-mode.
;;(global-srecode-minor-mode 1)

;;F4 to invoke speedbar
(global-set-key [(f4)] 'speedbar-get-focus)


(global-set-key [(control tab)] 'senator-completion-menu-popup)

;; Key bindings for source review of small project

(defun my-cedet-hook ()

  (local-set-key (kbd "M-n") 'semantic-ia-complete-symbol)

  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)

  (local-set-key "\C-cd" 'semantic-ia-fast-jump)
  
  (local-set-key "\C-cr" 'semantic-symref-symbol)

  (local-set-key "\C-cR" 'semantic-symref))

(add-hook 'c-mode-hook 'my-cedet-hook)

(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(require 'highlight-symbol)

(global-set-key [f7] 'highlight-symbol-at-point)
(global-set-key [f8] 'highlight-symbol-remove-all)
(global-set-key [(shift f7)] 'highlight-symbol-prev)
(global-set-key [(shift f8)] 'highlight-symbol-next)
(global-set-key [(meta f7)] 'highlight-symbol-prev-in-defun)
(global-set-key [(meta f8)] 'highlight-symbol-next-in-defun)
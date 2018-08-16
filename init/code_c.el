(add-hook 'c-mode-hook 'hs-minor-mode)
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?`?` _ "''")
    (?\(?  _ ")")
    (?\[?  _ "]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)

(defun my-c-mode-hook ()
  (require 'cc-mode)
  (hs-minor-mode t)
  (interactive)
  (c-set-style "k&r")
  (setq indent-tabs-mode nil)
  (setq default-tab-width 4)
  (setq c-basic-offset 4)   
;;  (c-set-style "bsd")
;;  (setq indent-tabs-mode nil)
;;  (setq default-tab-width 8)
;;  (setq c-basic-offset 8)   
  (setq tab-stop-list ())
  (setq c-cleanup-list (append c-cleanup-list (list 'brace-else-brace)))
  (c-toggle-auto-state 1) ;;²»ÓÃ×Ô¶¯»»ÐÐ/1±íÊ¾×Ô¶¯»»ÐÐ
  (c-toggle-hungry-state)  ;; ´ËÄ£Ê½ÏÂ£¬µ±°´BackspaceÊ±»áÉ¾³ý×î¶àµÄ¿Õ¸ñ
  (define-key c-mode-map [return] 'newline-and-indent) ;; ½«»Ø³µ´úÌæC-jµÄ¹¦ÄÜ£¬»»ÐÐµÄÍ¬Ê±¶ÔÆë
)

(add-hook 'c-mode-hook 'my-c-mode-hook)
(global-set-key [f1] 'hs-toggle-hiding)


;;for c code systel
;;show paren mode
(show-paren-mode t)
(global-set-key [?\C-c ?\C-/] 'comment-or-uncomment-region)

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

(defun my-comment-or-uncomment-region (beg end &optional arg)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end arg)
)
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)


;;  (autoload 'smart-tabs-mode "smart-tabs-mode"
;;    "Intelligently indent with tabs, align with spaces!")
;;  (autoload 'smart-tabs-mode-enable "smart-tabs-mode")
;;  (autoload 'smart-tabs-advice "smart-tabs-mode")
;;  (autoload 'smart-tabs-insinuate "smart-tabs-mode")
;;
;; As of version 1.0 of this package, the easiest and preferred way to
;; enable smart-tabs-mode is with the smart-tabs-insinuate function;
;; for example,
;;
;;  (smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python
;;                        'ruby 'nxml)
;;
;; will enable smart-tabs-mode with all supported language modes.
;;
;; (See below for instructions on adding additional language support.)
;;
;; The old method of manually enabling smart-tabs-mode is still
;; available, but is no longer recommended; smart-tabs-insinuate
;; wraps the functionality below in a convenient manner.
;;
;; For reference, the basic manual method looks like this:
;;
;;  (add-hook 'MODE-HOOK 'smart-tabs-mode-enable)
;;  (smart-tabs-advice INDENT-FUNC TAB-WIDTH-VAR)
;;
;; Note that it might be preferable to delay calling smart-tabs-advice
;; until after the major mode is loaded and evaluated, so the lines
;; above would be better written like this:
;;
;;  (add-hook 'MODE-HOOK (lambda ()
;;                         (smart-tabs-mode-enable)
;;                         (smart-tabs-advice INDENT-FUNC TAB-WIDTH-VAR)))
;;
;; Here are some specific examples for a few popular languages:
;;
;;  ;; C
;;  (add-hook 'c-mode-hook 'smart-tabs-mode-enable)
;;  (smart-tabs-advice c-indent-line c-basic-offset)
;;  (smart-tabs-advice c-indent-region c-basic-offset)
;;
;;  ;; JavaScript
;;  (add-hook 'js2-mode-hook 'smart-tabs-mode-enable)
;;  (smart-tabs-advice js2-indent-line js2-basic-offset)
;;
;;  ;; Perl (cperl-mode)
;;  (add-hook 'cperl-mode-hook 'smart-tabs-mode-enable)
;;  (smart-tabs-advice cperl-indent-line cperl-indent-level)
;;
;;  ;; Python
;;  (add-hook 'python-mode-hook 'smart-tabs-mode-enable)
;;  (smart-tabs-advice python-indent-line-1 python-indent)

;;; Adding language support

;; Language support can be added through the use of the macro
;; `smart-tabs-add-language-support'. Pass in the symbol you wish
;; to use to identify the language, the mode hook, and a list
;; of cons cells containing (indent-line-function . offset-variable).
;; For example, if C++ mode was not provided by default it could be
;; added as follows:
;;
;; (smart-tabs-add-language-support c++ c++-mode-hook
;;   ((c-indent-line . c-basic-offset)
;;    (c-indent-region . c-basic-offset)))
;;
;; NOTE: All language support must be added before the call to
;;      `smart-tabs-insinuate'.

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; Highlight  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; highlight symbol  
(add-to-list 'load-path
              "~/customization/lisps/highlight-symbol.el")
(require 'highlight-symbol)
(global-set-key [(control f2)] 'highlight-symbol)
(global-set-key [f2] 'highlight-symbol-next)
(global-set-key [(shift f2)] 'highlight-symbol-prev)
(global-set-key [(meta f2)] 'highlight-symbol-query-replace)
(global-set-key [f7] 'highlight-symbol-at-point)
(global-set-key [f8] 'highlight-symbol-remove-all)
(global-set-key [(shift f7)] 'highlight-symbol-prev)
(global-set-key [(shift f8)] 'highlight-symbol-next)
(global-set-key [(meta f7)] 'highlight-symbol-prev-in-defun)
(global-set-key [(meta f8)] 'highlight-symbol-next-in-defun)

(add-to-list 'load-path
              "~/customization/lisps/symbol-overlay")
(add-to-list 'load-path
              "~/customization/lisps/seq.el/")
(require 'symbol-overlay)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
(global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)
(global-set-key (kbd "<f7>") 'symbol-overlay-mode)
(global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)

;;Default key-bindings defined in symbol-overlay-map:
;;"i" -> symbol-overlay-put
;;"n" -> symbol-overlay-jump-next
;;"p" -> symbol-overlay-jump-prev
;;"w" -> symbol-overlay-save-symbol
;;"t" -> symbol-overlay-toggle-in-scope
;;"e" -> symbol-overlay-echo-mark
;;"d" -> symbol-overlay-jump-to-definition
;;"s" -> symbol-overlay-isearch-literally
;;"q" -> symbol-overlay-query-replace
;;"r" -> symbol-overlay-rename

(global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)
(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas-minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(add-hook 'shell-mode-hook #'(company-mode 0))
(global-set-key [backtab] 'tab-indent-or-complete)

(global-set-key (kbd "C-x g") 'goto-line)

(defun my_make_path (path n)
  (let ((i 0)
		(ret "")
		)
    (while (< i n)
      (setq ret (format "%s/%s" ret (nth i path)))
      (setq i (+ i 1))
      )
    (format "%s/" ret)
    )
  )

(defun my_find-cscope-files ()
  (let* ((pre "")
		 (bfind nil)
		 (path (split-string (expand-file-name default-directory) "/"))
		 (i (- (length path) 1))
		 (cwd "")
		 )
    (while (>= i 0)
      (setq cwd (my_make_path path i))
      (if (file-exists-p (format "%scscope.files" cwd))
		  (progn (setq i (- i 1000))
				 (setq bfind t)
				 (message "find pre = %s" cwd)
				 )
		)
      (setq i (- i 1)))
     (if bfind
	 cwd
       "")
     )
  )

(global-set-key (kbd "C-x t") '(lambda () (interactive)
                            (counsel-ag (thing-at-point 'symbol) (my_find-cscope-files) "--cpp" nil)))

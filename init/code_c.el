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
  (c-toggle-auto-state 1) ;;不用自动换行/1表示自动换行
  (c-toggle-hungry-state)  ;; 此模式下，当按Backspace时会删除最多的空格
  (define-key c-mode-map [return] 'newline-and-indent) ;; 将回车代替C-j的功能，换行的同时对齐
)

(add-hook 'c-mode-hook 'my-c-mode-hook)

;;for c code systel
;;show paren mode
(show-paren-mode t)

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

(add-to-list 'load-path
              "~/customization/lisps/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(defun yasnippet-current-line ();; C-c TAB
  (interactive)
  (let ((current-line (string-trim-right (thing-at-point 'line t))))
    (end-of-line)
    (newline-and-indent)
    (yas-expand-snippet (yasnippet-string-to-template (string-trim current-line)))))

(defun yasnippet-string-to-template (string)
  (let ((count 1))
    (labels ((rep (text)
                  (let ((replace (format "${%d:%s}" count text)))
                    (incf count)
                    replace)))
      (replace-regexp-in-string "[a-zA-Z0-9]+" #'rep string))))
      
(global-set-key (kbd "C-c TAB") 'yasnippet-current-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; Highlight  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; highlight symbol  
(add-to-list 'load-path
              "~/customization/lisps/highlight-symbol.el")
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

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

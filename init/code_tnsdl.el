;;tnsdl-mode
(load "tnsdl")
(define-key tnsdl-mode-map [(meta f1)] 'tnsdl-goto-block-start)
(define-key tnsdl-mode-map [(meta f2)] 'tnsdl-goto-block-end)
(define-key tnsdl-mode-map [(meta f3)] 'tnsdl-goto-proc-start)
(define-key tnsdl-mode-map [(meta f4)] 'tnsdl-goto-proc-end)
(define-key tnsdl-mode-map [(meta n)] 'tnsdl-forward-sexp)
(define-key tnsdl-mode-map [(meta p)] 'tnsdl-backward-sexp)

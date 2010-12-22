;;add path to cygwin let emacs use bash
(setenv "PATH" (concat "C:/APPS/cygwin/bin;" (getenv "PATH")))
(setq exec-path (cons "c:/APPS/cygwin/bin/" exec-path))
(require 'cygwin-mount)
(cygwin-mount-activate)

;;bash shell instead of dos shell
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt nil t)
(setq explicit-shell-file-name "bash.exe")
;;for subprocesses invoked via the shell
;;(e.g., "shell -c command")
(setq shell-file-name explicit-shell-file-name)



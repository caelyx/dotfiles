(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;(require 'evil)
;(evil-mode t)
;
;(dolist (mode '(ag-mode
;		flycheck-error-list-mode
;		git-rebase-mode))
;  (add-to-list 'evil-emacs-state-modes mode))
;
;(evil-add-hjkl-bindings occur-mode-map 'emacs
;  (kbd "/")       'evil-search-forward
;  (kbd "n")       'evil-search-next
;  (kbd "N")       'evil-search-previous
;  (kbd "C-d")     'evil-scroll-down
;  (kbd "C-u")     'evil-scroll-up
;  (kbd "C-w C-w") 'other-window)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (badwolf)))
 '(custom-safe-themes
   (quote
    ("d9b0d5c7077ddad798e9749d0629e86b925c2e146641b24130edd8f82cd0cf5d" default)))
 '(custom-theme-directory "~/.emacs.d/color-themes/")
 '(display-time-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;START http://blog.aaronbieber.com/2016/01/30/dig-into-org-mode.html
(setq org-agenda-files'("~/Dropbox/org/"))

(defun t2kv-pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

(define-key global-map (kbd "C-c t a") 't2kv-pop-to-org-agenda)

(setq org-capture-templates
      '(("a" "My TODO task format." entry
         (file "todo.org")
         "* TODO %?
SCHEDULED: %t")))

(defun t2kv-org-task-capture ()
  "Capture a task with my default template."
  (interactive)
  (org-capture nil "a"))

(define-key global-map (kbd "C-c c") 't2kv-org-task-capture)
(setq org-agenda-text-search-extra-files '(agenda-archives))
(setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
(setq org-enforce-todo-dependencies t)
(setq org-log-done (quote time))
(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))
;END aaronbieber/org-mode

(require 'markdown-mode)
(require 'markdown-preview-mode)

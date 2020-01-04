;; Uncomment this line if you're starting with a fresh emacs
;; (package-initialize)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("mepla" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Remove annoying prompt asking to follow the symlink to a Git repository,
;; especially before loading myinit.org, a file that I usually symlink from a
;; Git repo.
(setq vc-follow-symlinks t)

(require 'org)
(org-babel-load-file
 (expand-file-name "myinit.org"
                   user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/Dropbox/org/personal/journal.org"))
 '(package-selected-packages
   '(dumb-jump mu mu4e try org-pdfview pdf-tools use-package modern-cpp-font-lock flycheck eyebrowse atom-one-dark-theme ag ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

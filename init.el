;; Uncomment this line if you're starting with a fresh emacs
;; (package-initialize)

;; MacOS requires package-initialize to run.
(if (string= system-type "darwin")
    (package-initialize))

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

(defvar init-org-file-path
  (expand-file-name "myinit.org"
                    user-emacs-directory)
  "Path to Org file where I keep my general Emacs
  customizations. Note that this file gets all its Elisp
  extracted into its own Elisp file, which then gets executed.")

(defvar work-init-org-file-path
  (expand-file-name "myworkinit.org"
                    user-emacs-directory)
  "Path to Org file where I keep my work-specific Emacs
  customizations. Note that this file gets all its Elisp
  extracted into its own Elisp file, which then gets executed.")

(defvar extra-init-org-file-path
  (expand-file-name "myextrainit.org"
                    user-emacs-directory)
  "Path to Org file where I have extra configurations that are
  unlrelated. Note that this file gets all its Elisp extracted
  into its own Elisp file, which then gets executed.")

(require 'org)
(if (file-exists-p init-org-file-path)
    (org-babel-load-file init-org-file-path)
  (message "Couldn't find Org init file: %s" init-org-file-path))
(if (file-exists-p work-init-org-file-path)
    (org-babel-load-file work-init-org-file-path)
  (message "Couldn't find Org init file: %s" work-init-org-file-path))
(if (file-exists-p extra-init-org-file-path)
    (org-babel-load-file extra-init-org-file-path)
  (message "Couldn't find Org init file: %s" work-init-org-file-path))

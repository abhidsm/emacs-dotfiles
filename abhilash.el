(set-face-attribute 'default nil :height 100)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)

;;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))

;; Rinari tags
(setq rinari-tags-file-name "TAGS")

;; Color Theme
(color-theme-twilight)

;; Magit - Installed from http://github.com/philjackson/magit
(require 'magit)

;; YaSnippet
;;(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet-0.6.1c")
;;(require 'yasnippet) ;; not yasnippet-bundle
;;(yas/initialize)
;;(yas/load-directory "~/.emacs.d/vendor/yasnippet-0.6.1c/snippets")

(add-to-list 'load-path "~/.emacs.d/vendor/project-mode/")
(require 'project-mode)
(project-load-all)

;;; TwiterMode - http://www.emacswiki.org/emacs/TwitteringMode
(add-to-list 'load-path "~/.emacs.d/vendor/twittering-mode")
(require 'twittering-mode)
;;; (twittering-icon-mode) ;;; Shows profile icons

;; Gnus for GMail
;; (add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
;;                                   (nnimap-address "imap.gmail.com")
;;                                   (nnimap-server-port 993)
;;                                   (nnimap-stream ssl)))

;;(load "gnuserv-compat")
;;(load-library "gnuserv")
;;(gnuserv-start)

;; When loading files reuse existing frames.
;;(setq gnuserv-frame (car (frame-list)))

;; android-mode
(add-to-list 'load-path "~/.emacs.d/vendor/android-mode")
(require 'android-mode)
;;; (defcustom android-mode-sdk-dir "~/opt/android");; Find out why
;;; this is failing

(global-set-key (kbd "C-x m") 'eshell-command)

;; Scala Mode
(add-to-list 'load-path "~/.emacs.d/vendor/scala-mode")
(require 'scala-mode-auto)
;; (setq yas/my-directory "~/.emacs.d/vendor/scala-mode/contrib/yasnippet/snippets")
;; (yas/load-directory yas/my-directory)

 (add-hook 'scala-mode-hook
           '(lambda ()
              (yas/minor-mode-on)))

(require 'scala-mode)

(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

(add-to-list 'load-path "~/.emacs.d/vendor/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; MINI HOWTO: open .scala file. Ensure bin/server.sh is executable. M-x ensime

(global-set-key (kbd "C-x p") 'project-search-text)

;; overrride the normal file-opening, buffer switching
;;(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
;;(global-set-key (kbd "C-x b")   'lusty-buffer-explorer)

(display-time)

;; ECB
;;(setq ecb-tip-of-the-day nil)
;;(ecb-activate)
;;(setq ecb-tip-of-the-day nil)
;;;(ecb-hide-ecb-windows)

;; Fullscreen
(defun fullscreen ()
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [f11] 'fullscreen)
(global-set-key [f9] 'dictionary-search)

(add-to-list 'auto-mode-alist '("\\.log$" . rinari-minor-mode))

(add-to-list 'load-path "~/.emacs.d/vendor/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
;;(menu-bar-mode)

;; New version of SASS supports CSS3
;;;(add-to-list 'load-path "~/.emacs.d/vendor/dot-emacs/lisp-personal/scss-mode")
;;;(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\.xml.builder$" . ruby-mode))


;; (require org-feed-alist)
;;(setq org-feed-alist
;;      '(("RTM"
;;         "https://www.rememberthemilk.com/rss/jeevan.pingali/"
;;         "~/Notes/G1/RTM.org"
;;         "Remember The Milk"
;;         :template "* TODO %title\n  %a\n "
;;         ))
;; 
;;      ;;* rtm feed timer
;;      (run-at-time 3600 3600 'org-feed-update-all)
;;)

;; (linum-mode)

(global-set-key (kbd "M-w")   'copy-region-as-kill)

(require 'tramp)
;;(setq tramp-default-method "ssh")
;;   
;;(add-to-list
;; 'tramp-multi-connection-function-alist
;; '("pmp" tramp-multi-connect-rlogin) "ssh -i ~/pmppublink.pem -p 2002 publink@184.106.169.214")
;;   
;;(add-to-list
;; 'tramp-multi-connection-function-alist
;; '("gateway-andover" tramp-multi-connect-rlogin "plink -ssh -A -l %u %h %n"))


;;(autoload 'mew "mew" nil t)
;;(autoload 'mew-send "mew" nil t)


;; Optional setup (Read Mail menu for Emacs 21):
;;(If (boundp 'read-mail-command)
;;    (setq read-mail-command 'mew))
;;  
;;;; Optional setup (e.g. C-xm for sending a message):
;;(autoload 'mew-user-agent-compose "mew" nil t)
;;(if (boundp 'mail-user-agent)
;;    (setq mail-user-agent 'mew-user-agent))
;;(if (fboundp 'define-mail-user-agent)
;;    (define-mail-user-agent
;;      'mew-user-agent
;;      'mew-user-agent-compose
;;      'mew-draft-send-message
;;      'mew-draft-kill
;;      'mew-send-hook))


(defun make-shell (name)
  "Create a shell buffer named NAME."
  (interactive "sName: ")
  (setq name (concat "$" name))
  (eshell)
  (rename-buffer name))
(global-set-key (kbd "C-x C-m") 'make-shell)


;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(use-package! nyan-mode)
(nyan-mode)

(setq doom-theme 'doom-molokai)

(setq doom-font (font-spec :family "monospace" :size 16))


(add-hook 'before-save-hook 'delete-trailing-whitespace)


(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(global-set-key (kbd "M-s") 'save-buffer)

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-d") 'hippie-expand)
(global-set-key (kbd "M-f") 'spacemacs/helm-yas)
(global-set-key (kbd "<f2>") 'avy-goto-line)
(global-set-key (kbd "<f3>") 'avy-goto-line)
(global-set-key (kbd "<f4>") 'avy-goto-line)
(global-set-key (kbd "<f5>") 'avy-goto-char-timer)
(global-set-key (kbd "<f6>") 'helm-semantic-or-imenu)
(global-set-key (kbd "<f7>") 'spacemacs/helm-project-do-ag)
(global-set-key (kbd "<f8>") 'helm-swoop)
(global-set-key (kbd "<f10>") 'whitespace-mode)
(global-set-key (kbd "<f9>") 'helm-show-kill-ring)
(eval-after-load "helm"
'(define-key helm-map (kbd "<f5>") 'ace-jump-helm-line))

(require 'dap-mode)
;; scala
(require 'lsp-metals)
(setq lsp-lens-enable t)

;; avy
(setq avy-keys
'(?A ?S ?D ?F ?G ?H ?J ?K ?L))
(setq avy-translate-char-function #'upcase)

(setq confirm-kill-emacs nil)

;;; to use slack:
;;; also need to create .authinfo.gpg
;;; possibly export GPG_TTY=$(tty) in .bash_profile
;;; format
;;; machine clojurians.slack.com login endrebak85@gmail.com password <token>

(require 'auth-source)
(require 'auth-source-pass)
(auth-source-pass-enable)

(setf epa-pinentry-mode 'loopback)

(setq auth-sources
      '((:source "~/.authinfo.gpg")))



(defun slack-init  ()
  (interactive
   (progn
     (slack-register-team
      :name "clojurians"
      :token (auth-source-pick-first-password
              :host "clojurians.slack.com"
              :user "endrebak85@gmail.com")
      :subscribed-channels '((off-topic)))
     (slack-start))))


;;; minizinc
(load! "lisp/minizinc-mode.el")
(add-to-list 'auto-mode-alist '("\\.mzn\\'" . minizinc-mode))

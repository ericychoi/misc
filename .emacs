;; (defun suspend-msg (arg)
;;   (interactive "P")
;;   (message "Use ^X^C to exit, 'M-X suspend-emacs' to suspend")
;; )

;; (define-key global-map "\C-X\C-Z" 'suspend-msg)
;; (define-key global-map "\C-Z" 'suspend-msg)

;; (setq inhibit-local-variables t)

;; custom setting by echoi

;; line number and column
(line-number-mode 1)
(column-number-mode 1)

;; no beeps
;(setq visible-bell t)

;; 'y' instead of 'yes'
(fset 'yes-or-no-p 'y-or-n-p)

;; font-lock
(global-font-lock-mode 1)

;; Set the highlight current line minor mode
;;(global-hl-line-mode 1)

;; Support Wheel Mouse Scrolling 
(mouse-wheel-mode t)

;; ========= Set colours ==========

;; Set cursor and mouse-pointer colours
;(set-cursor-color "black")
;(set-mouse-color "goldenrod")

;; Set region background colour
(set-face-background 'region "blue")

;; Set emacs background colour
;(set-background-color "black")

; Show selections
(transient-mark-mode 1)
;(set-face-foreground 'region "white")
;(set-face-background 'region "Navy")

; Highlight Matching Parentheses
(show-paren-mode 1)

;; Spell Checker
(setq-default ispell-program-name "aspell")

;; Prevent Emacs from making backup files
(setq make-backup-files nil)

;; add .jsp to html-mode
(setq auto-mode-alist (cons '("\\.jsp$" . html-helper-mode) auto-mode-alist))

;; display tabs as 2 chars
(setq default-tab-width 2)

;; html-helper-mode
(setq html-helper-mode-global-JSP-not-ASP t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(confluence-default-space-alist (list (cons confluence-url "ECOM")))
 '(confluence-url "https://confluence.tm.tmcs/confluence/rpc/xmlrpc")
 '(cperl-electric-keyword nil)
 '(cperl-electric-keywords nil)
 '(cperl-electric-linefeed nil)
 '(cperl-electric-parens nil)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cua-mode t nil (cua-base))
 '(jde-compile-option-classpath (quote (".")))
 '(jde-compile-option-command-line-args nil)
 '(jde-compiler (quote ("javac" "")))
 '(jira-url "https://jira.tm.tmcs/jira/rpc/xmlrpc")
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "Grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "Ubuntu Mono")))))

;; goto line
(global-set-key "\C-l" 'goto-line)

;; ========== Line by line scrolling ==========

;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing

(setq scroll-step 1)

;; follow Best Practices
(setq fill-column 78)
(setq auto-fill-mode t)
(setq-default indent-tabs-mode nil)

(defalias 'perl-mode 'cperl-mode)

;; 4 space indents in cperl mode
'(cperl-close-paren-offset -4)
'(cperl-continued-statement-offset 4)
'(cperl-indent-level 4)
'(cperl-indent-parens-as-block nil)
'(cperl-tab-always-indent nil)

;; Use % to match various kinds of brackets...
;; See: http://www.lifl.fr/~hodique/uploads/Perso/patches.el
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (let ((prev-char (char-to-string (preceding-char)))
        (next-char (char-to-string (following-char))))
    (cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
          ((string-match "[\]})>]" prev-char) (backward-sexp 1))
          (t (self-insert-command (or arg 1))))))

;; Load an application template in a new unattached buffer...
(defun application-template-pl (  )
  "Inserts the standard Perl application template"  ; For help and info.
  (interactive "*")                                ; Make this user accessible.
  (switch-to-buffer "application-template-pl")
  (insert-file "~/.code_templates/perl_application.pl"))
;; Set to a specific key combination...
(global-set-key "\C-ca" 'application-template-pl)

;; I have no idea what this does
;;
;; Load a module template in a new unattached buffer...
;; (defun module-template-pm (  )
;;   "Inserts the standard Perl module template"       ; For help and info.
;;   (interactive "*")                                 ; Make this user accessible.
;;   (switch-to-buffer "module-template-pm")
;;   (insert-file "~/.code_templates/perl_module.pm"))
;; ;; Set to a specific key combination...
;; (global-set-key "\C-cm" 'module-template-pm)

;; ;; Expand the following abbreviations while typing in text files...
;; (abbrev-mode 1)

;; (define-abbrev-table 'global-abbrev-table '(
;;     ("pdbg"   "use Data::Dumper qw( Dumper );\nwarn Dumper[];"   nil 1)
;;     ("phbp"   "#! /usr/bin/perl -w"                              nil 1)
;;     ("pbmk"   "use Benchmark qw( cmpthese );\ncmpthese -10, {};" nil 1)
;;     ("pusc"   "use Smart::Comments;\n\n### "                     nil 1)
;;     ("putm"   "use Test::More 'no_plan';"                        nil 1)
;;     ))

;; (add-hook 'text-mode-hook (lambda (  ) (abbrev-mode 1)))

;; iswitchb
(iswitchb-mode t)

;; tramp
(add-to-list 'load-path "~/emacs/tramp/lisp/")
(require 'tramp)
(setq tramp-default-method "ssh")

(load "~/.emacs.d/cycle-buffer.el")
(autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
(autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
(autoload 'cycle-buffer-permissive "cycle-buffer" "Cycle forward allowing *buffers*." t)
(autoload 'cycle-buffer-backward-permissive "cycle-buffer" "Cycle backward allowing *buffers*." t)
(autoload 'cycle-buffer-toggle-interesting "cycle-buffer" "Toggle if this buffer will be considered." t)
(global-set-key [(f9)]        'cycle-buffer-backward)
(global-set-key [(f10)]       'cycle-buffer)
(global-set-key [(shift f9)]  'cycle-buffer-backward-permissive)
(global-set-key [(shift f10)] 'cycle-buffer-permissive)
(put 'upcase-region 'disabled nil)

;; don't exit unless I tell you to
(setq confirm-kill-emacs 'y-or-n-p)

(setq grep-find-command "find . -type f ! -regex \".*/\\(CVS\\|\\.svn\\|\\.git\\)/.*\" ! -regex \".*/\\(csanywhere\\.js\\|tiny_mce\\.js\\)\" -print0 | xargs -0 -e egrep -nH -e ")

(defun perl-helpful-buffer-name ()
   (interactive)
   (save-excursion
      (goto-char (point-min))
       (if (re-search-forward "^package \\(.+\\);" nil t)
           (let ((pkg (match-string 1)))
             (if (get-buffer pkg)
                (rename-buffer (format "%s (%s)"
                                   pkg
                                       (buffer-file-name)) 
                              t)
               (rename-buffer pkg))))))
                                
(add-hook 'cperl-mode-hook (lambda () (perl-helpful-buffer-name)))

;; display directory name of the index.js to the buffer
(defun node-express-helpful-buffer-name ()
  (interactive)
    (let ((buffer-name-string (format "%s" (buffer-file-name))))
      (if (string-match "/\\([^/]+/[^/]+\\)$" buffer-name-string)
        (rename-buffer (match-string 1 buffer-name-string)))))

(add-hook 'js-mode-hook (lambda () (node-express-helpful-buffer-name)))

(setq inhibit-splash-screen t)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/color-theme-library.el")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-clarity)))

(add-to-list 'load-path "~/.emacs.d")

;; assuming confluence.el and xml-rpc.el are in your load path
(require 'confluence)

;; note, all customization must be in *one* custom-set-variables block



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; confluence editing support (with longlines mode)

(autoload 'confluence-get-page "confluence" nil t)

(eval-after-load "confluence"
  '(progn
     (require 'longlines)
     (progn
       (add-hook 'confluence-mode-hook 'longlines-mode)
       (add-hook 'confluence-before-save-hook 'longlines-before-revert-hook)
       (add-hook 'confluence-before-revert-hook 'longlines-before-revert-hook)
       (add-hook 'confluence-mode-hook '(lambda () (local-set-key "\C-j" 'confluence-newline-and-indent))))))

;; LongLines mode: http://www.emacswiki.org/emacs-en/LongLines
;; (autoload 'longlines-mode "longlines" "LongLines Mode." t)

;; (eval-after-load "longlines"
;;   '(progn
;;      (defvar longlines-mode-was-active nil)
;;      (make-variable-buffer-local 'longlines-mode-was-active)

;;      (defun longlines-suspend ()
;;        (if longlines-mode
;;            (progn
;;              (setq longlines-mode-was-active t)
;;              (longlines-mode 0))))

;;      (defun longlines-restore ()
;;        (if longlines-mode-was-active
;;            (progn
;;              (setq longlines-mode-was-active nil)
;;              (longlines-mode 1))))

;;      ;; longlines doesn't play well with ediff, so suspend it during diffs
;;      (defadvice ediff-make-temp-file (before make-temp-file-suspend-ll
;;                                              activate compile preactivate)
;;        "Suspend longlines when running ediff."
;;        (with-current-buffer (ad-get-arg 0)
;;          (longlines-suspend)))

    
;;      (add-hook 'ediff-cleanup-hook 
;;                '(lambda ()
;;                   (dolist (tmp-buf (list ediff-buffer-A
;;                                          ediff-buffer-B
;;                                          ediff-buffer-C))
;;                     (if (buffer-live-p tmp-buf)
;;                         (with-current-buffer tmp-buf
;;                           (longlines-restore))))))))

;; keybindings (change to suit)

;; open confluence page
(global-set-key "\C-xwf" 'confluence-get-page)

;; setup confluence mode
(add-hook 'confluence-mode-hook
          '(lambda ()
             (local-set-key "\C-xw" confluence-prefix-map)))

;; protobuf mode
(require 'protobuf-mode)

;; javascript-mode indent level
(setq js-indent-level 2)

;; javascript auto-complete
(add-to-list 'load-path "/usr/share/auto-complete")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; code folding
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)
            (hs-hide-all)
            ))

;; start with everything folded
;;(add-hook 'js-mode-hook (lambda () (hs-hide-all)))
;;(add-hook 'js-mode-hook 'hs-hide-all)

;; Show-hide
;;(global-set-key (kbd "+") 'hs-show-block)
;;(global-set-key (kbd "") 'hs-show-all)
;;(global-set-key (kbd "+") 'hs-hide-block)
;;(global-set-key (kbd "") 'hs-hide-all)
(global-set-key (kbd "C-+") 'hs-toggle-hiding)

;; expand hidden code on goto line
(defadvice goto-line (after expand-after-goto-line
                      activate compile)
  "hideshow-expand affected block when using goto-line in a collapsed buffer"
  (save-excursion
    (hs-show-block)))

;; Set whether isearch opens folded comments, code, or both
;; where x is code, comments, t (both), or nil (neither)
(setq hs-isearch-open 't)

;; newline and indent
(define-key global-map (kbd "RET") 'newline-and-indent)

(setq-default show-trailing-whitespace t)

(load-theme 'deeper-blue)

;;;;;;;;CEDET;;;;;;;;
;; minimial-cedet-config.el --- Working configuration for CEDET from bzr
 
;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords: cedet, C++, Java
;; Requirements: CEDET from bzr (http://cedet.sourceforge.net/bzr-repo.shtml)
 
;; Do checkout of fresh CEDET, and use this config (don't forget to change path below)
 
(setq cedet-root-path (file-name-as-directory "~/.emacs.d/plugins/cedet-bzr/trunk/"))
 
(load-file (concat cedet-root-path "cedet-devel-load.el"))
(add-to-list 'load-path (concat cedet-root-path "contrib"))
 
;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
 
;; Activate semantic
(semantic-mode 1)
 
;; load contrib library
(require 'eassist)

;;NK:  suppose to enable more advanced name copledtion functionality (haven't noticed a difference yet) 
(require 'semantic/ia)

;;NK : suppose to include standard libraries when working with GCC compiler
(require 'semantic/bovine/gcc)

;;NK : how to add system files to look for 
(semantic-add-system-include "/usr/lib" 'c++-mode) 

;; customisation of modes
(defun alexott/cedet-hook ()
(local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
(local-set-key "\C-c?" 'semantic-ia-complete-symbol)
;;
(local-set-key "\C-c>" 'semantic-complete-analyze-inline)
(local-set-key "\C-c=" 'semantic-decoration-include-visit)
 
(local-set-key "\C-cj" 'semantic-ia-fast-jump)
(local-set-key "\C-cq" 'semantic-ia-show-doc)
(local-set-key "\C-cs" 'semantic-ia-show-summary)
(local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
)
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'scheme-mode-hook 'alexott/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'erlang-mode-hook 'alexott/cedet-hook)
 
(defun alexott/c-mode-cedet-hook ()
(local-set-key "\C-ct" 'eassist-switch-h-cpp)
(local-set-key "\C-xt" 'eassist-switch-h-cpp)
(local-set-key "\C-ce" 'eassist-list-methods)
(local-set-key "\C-c\C-r" 'semantic-symref)
)
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)
 
(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)
 
(when (cedet-ectag-version-check t)
(semantic-load-enable-primary-ectags-support))
 
;; SRecode
(global-srecode-minor-mode 1)
 
;; EDE
(global-ede-mode 1)
(ede-enable-generic-projects)
 
;;; minimial-cedet-config.el ends here
;;;;;;;;CEDET end;;;;;;;;

;;;;;;;;ECB;;;;;;;;
;;http://stackoverflow.com/questions/3134026/emacs-23-2-with-ecb-2-40-file-error-cannot-open-load-file-semantic-ctxt
;;(require 'semantic/analyze)
;;(provide 'semantic-analyze)
;;(provide 'semantic-ctxt)
;;(provide 'semanticdb)
;;(provide 'semanticdb-find)
;;(provide 'semanticdb-mode)
;;(provide 'semantic-load)


(add-to-list 'load-path "~/.emacs.d/plugins/ecb-master/")

;;(require 'ecb)
;;If you want to load the complete ECB at (X)Emacs-loadtime
;;(Advantage: All ECB-options available after loading ECB. Disadvantage: Increasing loadtime2): 
(require 'ecb)


;;;;;;;;ECB end;;;;;;;;

;;;;;;;;auto-complete;;;;;;;;
;;Enable default auto complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto_complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto_complete//ac-dict")
(ac-config-default)
;;;;;;;;auto-complete end;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'deeper-blue)

;;;;;;;;auto-complete;;;;;;;;
;;Enable default auto complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto_complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto_complete//ac-dict")
(ac-config-default)
;;;;;;;;auto-complete end;;;;;;;;


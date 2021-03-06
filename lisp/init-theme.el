
;;font setting
(defun set-font()
  (interactive)
  ;;Choose Iosevka/Inconsolata/Juliamono/Jetbrains Mono/Roboto Mono/Monaco/Fira Code/SF Mono
  ;;for Chinese, there're Wenquanyi Micro Hei Mono/Sarasa UI SC Mono/Noto Sans CJK SC Mono (work perfectly with Iosevka/Inconsolata)
  ;;for variable-pitch font, ETBembo or New York can be used
  (set-face-attribute 'default nil :font "Iosevka 12")
  (set-fontset-font t 'unicode "Symbola" nil 'prepend);;use Symbola to display unicode character
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Wenquanyi Micro Hei Mono"))))
;; tune rescale so that Chinese character width = 2 * English character width
;;except for Iosevka/Inconsolata, EN:CN font are basically 13/14:16
;;  (setq face-font-rescale-alist '(("Iosevka" . 1.0) ("Wenquanyi Micro Hei Mono" . 1.0))))

;(add-to-list 'after-init-hook 'set-font)

;daemon mode font setting
(if (daemonp)
    (progn
      (message "A *daemon* is with you!")
      (add-hook 'after-make-frame-functions
		(lambda (frame)
		  (with-selected-frame frame
		    (set-font)))))
  (set-font))

;;Color scheme setting
(use-package base16-theme)
(use-package color-theme-sanityinc-tomorrow)
(use-package gruvbox-theme)
;; (use-package spacemacs-common
;;   :ensure spacemacs-theme)
(use-package sublime-themes)
(use-package doom-themes)

;;Transprancy setting
(set-frame-parameter (selected-frame) 'alpha '(98 100))
(add-to-list 'default-frame-alist '(alpha 98 100))

;;random theme
(setq color-themes '(sanityinc-tomorrow-night base16-zenburn gruvbox-dark-soft spacemacs-dark spolsky doom-one doom-vibrant doom-dark+))
(defun random-color-theme()
  "randomly change color theme"
  (interactive)
  (random t)
  (load-theme
   (nth (random (length color-themes)) color-themes)
   t))
(global-set-key (kbd "C-z") 'random-color-theme)
;;(add-hook 'after-init-hook 'random-color-theme)
(load-theme 'base16-gruvbox-dark-soft t)
;;(add-hook 'after-init-hook (lambda () (load-theme 'base16-gruvbox-dark-soft)))

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   (load-theme 'doom-dracula t)

;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
  
;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;;   (doom-themes-treemacs-config)
  
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))

;; (use-package cnfonts
;;   :config
;;   (cnfonts-enable)
;;   (setq cnfonts-profiles '("program" "others")
;;   (setq cnfonts--custom-set-fontnames
;;       '(("PragmataPro" "Ubuntu Mono" "DejaVu Sans Mono")
;;         ("文泉驿等宽微米黑" "Ubuntu Mono" "隶书" "新宋体")
;;         ("HanaMinB" "SimSun-ExtB" "MingLiU-ExtB")))
;;   (setq cnfonts--custom-set-fontsizes
;; 	'((9    9.0  9.5 )
;;           (10   11.0 11.0)
;;           (11.5 12.5 12.5)
;;           (12.5 13.5 13.5)
;;           (14   15.0 15.0)
;;           (16   17.0 17.0)
;;           (18   18.0 18.0)
;;           (20   21.0 21.0)
;;           (22   23.0 23.0)
;;           (24   25.5 25.5)
;;           (26   27.0 27.0)
;;           (28   29.0 29.0)
;;           (30   32.0 32.0)
;;           (32   33.0 33.0)))
;;   :bind
;;   (("C-=" . cnfonts-increase-fontsize)
;;    ("C--" . cnfonts-decrease-fontsize))
;;   ))

(provide 'init-theme)


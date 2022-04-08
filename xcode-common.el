(defgroup xcode-theme nil
  "Xcode-theme options."
  :group 'faces)

(defcustom xcode-theme-custom-colors nil
  "Specify a list of custom colors."
  :type 'alist
  :group 'xcode-theme)

(defun true-color-p ()
  (or
   (display-graphic-p)
   (= (tty-display-color-cells) 16777216)))

(defun create-xcode-theme (variant theme-name)
  (let ((class '((class color) (min-colors 89))) ;;              ~~ Dark ~~                              ~~ Light ~~
        ;;                                                          GUI       TER                           GUI       TER
        ;; generic
        (bg1              (if (eq variant 'dark) (if (true-color-p) "#292a30" "#b2b2b2") (if (true-color-p) "#ffffff" "#5f5f87")))
        (bg2              (if (eq variant 'dark) (if (true-color-p) "#414453" "#b2b2b2") (if (true-color-p) "#e5e5e5" "#5f5f87")))
        (bg3              (if (eq variant 'dark) (if (true-color-p) "#393b44" "#b2b2b2") (if (true-color-p) "#f4f4f4" "#5f5f87")))
        (bg4              (if (eq variant 'dark) (if (true-color-p) "#414453" "#b2b2b2") (if (true-color-p) "#b4d8fd" "#5f5f87")))
        (bg5              (if (eq variant 'dark) (if (true-color-p) "#2f3037" "#b2b2b2") (if (true-color-p) "#ecf5ff" "#5f5f87")))
        (bg6              (if (eq variant 'dark) (if (true-color-p) "#dfdfe0" "#b2b2b2") (if (true-color-p) "#262626" "#5f5f87")))
        (fg1              (if (eq variant 'dark) (if (true-color-p) "#dfdfe0" "#b2b2b2") (if (true-color-p) "#262626" "#5f5f87")))
        (fg2              (if (eq variant 'dark) (if (true-color-p) "#ff7ab2" "#b2b2b2") (if (true-color-p) "#ad3da4" "#5f5f87")))
        (fg3              (if (eq variant 'dark) (if (true-color-p) "#7f8c98" "#b2b2b2") (if (true-color-p) "#8a99a6" "#5f5f87")))
        (fg4              (if (eq variant 'dark) (if (true-color-p) "#b281eb" "#b2b2b2") (if (true-color-p) "#804fb8" "#5f5f87")))
        (fg5              (if (eq variant 'dark) (if (true-color-p) "#4eb0cc" "#b2b2b2") (if (true-color-p) "#0f68a0" "#5f5f87")))
        (fg6              (if (eq variant 'dark) (if (true-color-p) "#d9c97c" "#b2b2b2") (if (true-color-p) "#272ad8" "#5f5f87")))
        (fg7              (if (eq variant 'dark) (if (true-color-p) "#6bdfff" "#b2b2b2") (if (true-color-p) "#0b4f79" "#5f5f87")))
        (fg8              (if (eq variant 'dark) (if (true-color-p) "#ffa14f" "#b2b2b2") (if (true-color-p) "#78492a" "#5f5f87")))
        (fg9              (if (eq variant 'dark) (if (true-color-p) "#ff8170" "#b2b2b2") (if (true-color-p) "#d12f1b" "#5f5f87")))
        (fg10             (if (eq variant 'dark) (if (true-color-p) "#dfdfe0" "#b2b2b2") (if (true-color-p) "#262626" "#5f5f87")))
        (fg11             (if (eq variant 'dark) (if (true-color-p) "#292a30" "#b2b2b2") (if (true-color-p) "#ffffff" "#5f5f87")))
        )

    (cl-loop for (cvar . val) in xcode-theme-custom-colors
             do (set cvar val))

    (custom-theme-set-faces
     theme-name

;;;;; basics
     `(cursor ((,class (:background ,bg6))))
     `(default ((,class (:background ,bg1 :foreground ,fg1))))
     `(default-italic ((,class (:italic t))))
     `(error ((,class (:foreground ,fg9))))
     `(font-lock-builtin-face ((,class (:foreground ,fg2 :weight semibold))))
     `(font-lock-comment-face ((,class (:foreground ,fg3))))
     `(font-lock-constant-face ((,class (:foreground ,fg6))))
     `(font-lock-doc-face ((,class (:foreground ,fg3))))
     `(font-lock-function-name-face ((,class (:foreground ,fg5))))
     `(font-lock-keyword-face ((,class (:foreground ,fg2 :weight semibold))))
     `(font-lock-negation-char-face ((,class (:foreground ,fg6))))
     `(font-lock-preprocessor-face ((,class (:foreground ,fg5))))
     `(font-lock-reference-face ((,class (:foreground ,fg6))))
     `(font-lock-string-face ((,class (:foreground ,fg6))))
     `(font-lock-type-face ((,class (:foreground ,fg7))))
     `(font-lock-variable-name-face ((,class (:foreground ,fg10))))
     `(font-lock-warning-face ((,class (:foreground ,fg8 :background ,bg1))))
     `(fringe ((,class (:background ,bg1  :foreground ,fg1))))
     `(header-line ((,class :background ,bg1)))
     `(highlight ((,class (:foreground ,fg1 :background ,bg4))))
     `(hl-line ((,class (:background ,bg5 :extend t))))
     `(link ((,class (:foreground ,fg3 :underline t))))
     `(link-visited ((,class (:foreground ,fg3 :underline t))))
     `(match ((,class (:background ,bg4 :foreground ,fg1))))
     `(minibuffer-prompt ((,class (:inherit semibold :foreground ,fg2))))
     `(warning ((,class (:foreground ,fg8))))
     `(vertical-border ((,class (:foreground ,fg11))))

;;;;; mode-line
     `(mode-line           ((,class (:foreground ,fg1 :background ,bg2 :box (:color ,fg11 :line-width 1)))))
     `(mode-line-buffer-id ((,class (:foreground ,fg4))))
     `(mode-line-inactive  ((,class (:foreground ,fg1 :background ,bg2  :box (:color ,fg11 :line-width 1)))))

;;;;; mood-line
     `(mood-line-buffer-name ((,class (:foreground ,fg1))))
     `(mood-line-major-mode ((,class (:foreground ,fg1))))

;;;;; company-mode
     `(company-tooltip ((,class (:background ,bg3 :foreground ,fg1))))
     `(company-tooltip-common ((,class (:background ,bg3 :foreground ,fg1))))
     `(company-tooltip-common-selection ((,class (:foreground ,fg1))))
     `(company-tooltip-selection ((,class (:background ,bg4 :foreground ,fg1))))
     `(company-tooltip-scrollbar-track ((,class (:background ,bg3))))
     `(company-tooltip-scrollbar-thumb ((,class (:background ,bg2))))
     `(company-tooltip-annotation ((,class (:foreground ,fg3))))

;;;;; company-coq
    `(company-coq-snippet-hole-face ((,class (:weight light :italic nil))))

;;;;; ivy
     `(ivy-current-match ((,class (:background ,bg4 :extend t))))
     `(ivy-minibuffer-match-face-1 ((,class (:inherit normal))))
     `(ivy-minibuffer-match-face-2 ((,class (:inherit normal))))
     `(ivy-minibuffer-match-face-3 ((,class (:inherit normal))))
     `(ivy-minibuffer-match-face-4 ((,class (:inherit normal))))
     `(ivy-modified-buffer ((,class (:foreground ,fg1))))
     `(ivy-virtual ((,class (:foreground ,fg1))))
     `(ivy-subdir ((,class (:foreground ,fg1))))
     `(ivy-remote ((,class (:foreground ,fg1))))

;;;;; swiper
     `(swiper-line-face ((,class (:background ,bg4))))
     `(swiper-match-face-1 ((,class (:inherit normal))))
     `(swiper-match-face-2 ((,class (:inherit normal))))
     `(swiper-match-face-3 ((,class (:inherit normal))))
     `(swiper-match-face-4 ((,class (:inherit normal))))     

;;;;; proof-general
     `(proof-locked-face ((,class (:background ,bg5))))
     `(coq-solve-tactics-face  ((,class (:foreground ,fg4))))
     `(proof-tacticals-name-face ((,class (:foreground ,fg4))))
     `(proof-tactics-name-face ((,class (:foreground ,fg4))))
     `(coq-cheat-face ((,class (:foreground ,fg9))))
     `(proof-declaration-name-face ((,class (:foreground ,fg5))))
     `(coq-button-face ((,class (:ground ,bg1))))
     )))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'xcode-common)

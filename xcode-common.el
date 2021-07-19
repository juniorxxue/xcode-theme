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
        (normal-fg        (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#262626" "#5f5f87")))
        (normal-bg        (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#ffffff" "#5f5f87")))
        (highlight-bg     (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#ecf5ff" "#5f5f87")))
        (select-bg        (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#B2D7FF" "#5f5f87")))
        (comment-fg       (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#8a99a6" "#5f5f87")))
        (keyword-fg       (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#ad3da4" "#5f5f87")))
        (function-use-fg  (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#3e8087" "#5f5f87")))
        (function-def-fg  (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#0f68a0" "#5f5f87")))
        (error-fg         (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#d12f1b" "#5f5f87")))
        (cursor-bg        (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#262626" "#5f5f87")))
        (character-fg     (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#272ad8" "#5f5f87")))
        (number-fg        (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#272ad8" "#5f5f87")))
        (string-fg        (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#d12f1b" "#5f5f87")))
        (type-def-fg      (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#0b4f79" "#5f5f87")))
        (var-fg           (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#262626" "#5f5f87")))
        (warning-fg       (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#78492a" "#5f5f87")))
        (match-fg         (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#262626" "#5f5f87")))
        (border-fg        (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#262626" "#5f5f87")))
        )

    (cl-loop for (cvar . val) in xcode-theme-custom-colors
             do (set cvar val))

    (custom-theme-set-faces
     theme-name

;;;;; basics
     `(cursor ((,class (:background ,cursor-bg))))
     `(custom-button ((,class :background ,highlight-bg :foreground ,normal-fg :box (:line-width 2 :style released-button))))
     `(default ((,class (:background ,normal-bg :foreground ,normal-fg))))
     `(default-italic ((,class (:italic t))))
     `(error ((,class (:foreground ,error-fg))))
     `(font-lock-builtin-face ((,class (:foreground ,keyword-fg))))
     `(font-lock-comment-face ((,class (:foreground ,comment-fg))))
     `(font-lock-constant-face ((,class (:foreground ,number-fg))))
     `(font-lock-doc-face ((,class (:foreground ,comment-fg))))
     `(font-lock-function-name-face ((,class (:foreground ,function-def-fg))))
     `(font-lock-keyword-face ((,class (:foreground ,keyword-fg))))
     `(font-lock-negation-char-face ((,class (:foreground ,character-fg))))
     `(font-lock-preprocessor-face ((,class (:foreground ,function-def-fg))))
     `(font-lock-reference-face ((,class (:foreground ,number-fg))))
     `(font-lock-string-face ((,class (:foreground ,string-fg))))
     `(font-lock-type-face ((,class (:foreground ,type-def-fg))))
     `(font-lock-variable-name-face ((,class (:foreground ,var-fg))))
     `(font-lock-warning-face ((,class (:foreground ,warning-fg :background ,normal-bg))))
     `(fringe ((,class (:background ,normal-bg  :foreground ,normal-fg))))
     `(header-line ((,class :background ,normal-bg)))
     `(highlight ((,class (:foreground ,normal-fg :background ,highlight-bg))))
     `(hl-line ((,class (:background ,highlight-bg :extend t))))
     `(link ((,class (:foreground ,comment-fg :underline t))))
     `(link-visited ((,class (:foreground ,comment-fg :underline t))))
     `(match ((,class (:background ,highlight-bg :foreground ,match-fg))))
     `(minibuffer-prompt ((,class (:inherit bold :foreground ,keyword-fg))))
     `(warning ((,class (:foreground ,warning-fg))))
     `(widget-button-pressed ((,class (:foreground ,green))))

;;;;; mode-line
     `(mode-line           ((,class (:foreground ,normal-fg :background ,normal-bg :box (:color ,border-fg :line-width 1)))))
     `(mode-line-buffer-id ((,class (:foreground ,function-use-fg))))
     `(mode-line-inactive  ((,class (:foreground ,normal-fg :background ,normal-bg  :box (:color ,border-fg :line-width 1)))))
     
;;;;; proof-general
     `(proof-locked-face ((,class (:background ,highlight-bg))))
     `(coq-solve-tactics-face  ((,class (:foreground ,function-use-fg))))
     `(proof-tacticals-name-face ((,class (:foreground ,function-use-fg))))
     `(proof-tactics-name-face ((,class (:foreground ,function-use-fg))))
     `(coq-cheat-face ((,class (:foreground ,error-fg))))
     )))

;; stuff for javascript/react modes

(push '("\\.js\\'" . react-mode) auto-mode-alist)
(push '("\\.json\\'" . web-mode) auto-mode-alist)

(setq-default standard-indent 2
              tab-width 2
              indent-tabs-mode nil
              js2-strict-semi-warning nil
              js2-missing-semi-one-line-override nil
              web-mode-markup-indent-offset 2
              web-mode-css-indent-offset 2
              web-mode-code-indent-offset 2
              web-mode-indent-style 2
              )

(require 'rust-mode)
(require 'racer)
(setq racer-cmd "<path-to-racer-srcdir>/target/release/racer")
(setq racer-rust-src-path "<path-to-rust-srcdir>/src/")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

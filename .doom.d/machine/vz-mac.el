;;; ../.dotfiles/.doom.d/vz-mac.el -*- lexical-binding: t; -*-

(setq url-proxy-services
      '(("no_proxy" . "^.*\\(verizon\\|verizonwireless\\)\\.com")
        ("http" . "vzproxy.verizon.com:80")
        ("https" . "vzproxy.verizon.com:80"))
      )

(message "Successfully loaded VZ-mac configuration!")
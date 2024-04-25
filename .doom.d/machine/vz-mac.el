;;; ../.dotfiles/.doom.d/vz-mac.el -*- lexical-binding: t; -*-

(setq url-proxy-services
      '(("no_proxy" . "\\gitlab.verizon.com")
        ("http" . "vzproxy.verizon.com:80")
        ("https" . "vzproxy.verizon.com:80"))
      )

(message "Successfully loaded VZ-mac configuration!")

(defun my-run-in-inferior-shell (input)
    (interactive "sInput: ")
    (comint-send-string "*shell*" (concat input "\n")))

(defun my-git-pull-in-inferior-shell (remote branch)
  (interactive "sRemote: \nsBranch: ")
    (comint-send-string "*shell*" (format "git pull %s %s\n" remote branch)))

(defun my-git-push-in-inferior-shell (remote branch)
  (interactive "sRemote: \nsBranch: ")
    (comint-send-string "*shell*" (format "git push %s %s\n" remote branch)))

(map! :desc "git push in inferior shell"
      :map magit-mode-map
      :n "C-c a"
      #'my-git-push-in-inferior-shell)

(map! :desc "run in inferior shell"
      :map magit-mode-map
      :n "C-c !"
      #'my-run-in-inferior-shell)

(map! :desc "git pull in inferior shell"
      :map magit-mode-map
      :n "C-c f"
      #'my-git-pull-in-inferior-shell)

;;; ../.dotfiles/.doom.d/vz-mac.el -*- lexical-binding: t; -*-

(setq url-proxy-services
      '(("no_proxy" . "\\gitlab.verizon.com")
        ("http" . "vzproxy.verizon.com:80")
        ("https" . "vzproxy.verizon.com:80"))
      )

(defun get-or-create-magit-shell ()
  (let ((process-name (format "*shell: %s*" (magit-toplevel))))
    (unless (get-buffer process-name)
      (shell process-name)
      (comint-send-string process-name (format "cd %s\n" (magit-toplevel))))
    (get-buffer process-name)))

(defun magit-push-in-inferior-shell (remote branch)
  (interactive "sRemote: \nsBranch: ")
  (let ((process (get-or-create-magit-shell))
        (command (format "git push %s %s\n" remote branch)))
      (comint-send-string process command)
      (magit-refresh)))

(defun magit-pull-in-inferior-shell (remote branch)
  (interactive "sRemote: \nsBranch: ")
  (let ((process (get-or-create-magit-shell))
        (command (format "git pull %s %s\n" remote branch)))
      (comint-send-string process command)
      (magit-refresh)))

(defun magit-run-in-inferior-shell (input)
  (interactive "sInput: ")
  (let ((process (get-or-create-magit-shell))
        (command (concat input "\n")))
      (comint-send-string process command)
      (magit-refresh)))

(map! :desc "git push in inferior shell"
      :map magit-mode-map
      :n "C-c a"
      #'magit-push-in-inferior-shell)

(map! :desc "git pull in inferior shell"
      :map magit-mode-map
      :n "C-c f"
      #'magit-pull-in-inferior-shell)

(map! :desc "run in inferior shell"
      :map magit-mode-map
      :n "C-c !"
      #'magit-run-in-inferior-shell)

(message "Successfully loaded VZ-mac configuration!")

;;; ../.dotfiles/.doom.d/machine/andrew-mac.el -*- lexical-binding: t; -*-

(message "Successfully loaded personal configuration!")

(defun redshift-on ()
  (interactive)
  (async-shell-command "redshift -l 40:-74 -c ~/redshift.conf" "*redshift*"))

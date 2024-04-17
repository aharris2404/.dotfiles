export PATH="/Applications/MacPorts/Emacs.app/Contents/MacOS:$PATH"
. /opt/homebrew/opt/chruby/share/chruby/chruby.sh
. /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# WARNING: seems you still have not added 'pyenv' to the load path.

#Load pyenv automatically by adding
#the following to ~/.bashrc:

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

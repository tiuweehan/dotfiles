alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source ~/.zsh/path
source ~/.zsh/config
source ~/.zsh/aliases
source ~/.zsh/functions
source ~/.zsh/syntax
source ~/.zsh/prompt
source ~/.zsh/keyboard
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

DOT_FILES=(
  ~/.gitconfig
  ~/.gitignore
  ~/.tmux.conf
  ~/.vimrc
  ~/.zshrc
  ~/.zsh/
  ~/.dotfiles/
)

SOURCE_FILES=(
  ~/.zsh/path
  ~/.zsh/config
  ~/.zsh/aliases
  ~/.zsh/functions
  ~/.zsh/syntax
  ~/.zsh/prompt
  ~/.zsh/keyboard
  ~/.localrc  
) 

alias dot="$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

dot-destruct() {
  # Confirm destruct action
  read "response?Are you sure you want to delete your dotfiles? [yY/n] "
  if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    return
  fi

  # Check if should delete .localrc
  read "response?Do you want to delete .localrc? [yY/n] "
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    rm -rf ~/.localrc
  fi

  # Remove all dotfiles
  for file in $DOT_FILES; do
    rm -rf $file
  done

  # Remove dot commands
  unalias dot
  unset -f dot-destruct

  # Restart Shell
  exec $SHELL
}

for file in $SOURCE_FILES; do
  if [ -f $file ]; then
    source $file
  fi
done

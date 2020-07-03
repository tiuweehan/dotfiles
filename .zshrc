if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [[ "$TERM_PROGRAM" =~ "Apple_Terminal" ]]; then
  exec tmux
fi

TERM=screen-256color-bce

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
  ~/.zsh/path.sh
  ~/.zsh/config.sh
  ~/.zsh/aliases.sh
  ~/.zsh/functions.sh
  ~/.zsh/syntax.sh
  ~/.zsh/prompt.sh
  ~/.zsh/keyboard.sh
  ~/.localrc.sh
) 

dot() {
  case $1 in
  destruct)
    _dot-destruct
    ;;
  *)
    local command="$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    for var in "$@"; do
      command="$command \"$var\""
    done
    eval $command
    ;;
  esac
}

_dot-destruct() {
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
  unset -f _dot-destruct

  # Restart Shell
  exec $SHELL
}

for file in $SOURCE_FILES; do
  if [ -f $file ]; then
    source $file
  fi
done

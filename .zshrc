DOT_ROOT_DIR=$HOME
DOT_REPO_DIR=$DOT_ROOT_DIR/.dotfiles
DOT_CONFIG_DIR=$DOT_ROOT_DIR/.dotconfig
DOT_CONFIG_ZSH_DIR=$DOT_CONFIG_DIR/zsh

DOT_FILES=(
  $DOT_ROOT_DIR/.gitconfig
  $DOT_ROOT_DIR/.gitignore
  $DOT_ROOT_DIR/.tmux.conf
  $DOT_ROOT_DIR/.vimrc
  $DOT_ROOT_DIR/.zshrc
  $DOT_CONFIG_ZSH_DIR/
  $DOT_REPO_DIR/
)

SOURCE_FILES=(
  $DOT_ROOT_DIR/.localrc
  $DOT_CONFIG_ZSH_DIR/config.sh
  $DOT_CONFIG_ZSH_DIR/utilities.sh
  $DOT_CONFIG_ZSH_DIR/syntax.sh
  $DOT_CONFIG_ZSH_DIR/prompt.sh
  $DOT_CONFIG_ZSH_DIR/keyboard.sh
  $DOT_ROOT_DIR/.localrc.sh
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
    rm -rf $DOT_ROOT_DIR/.localrc
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

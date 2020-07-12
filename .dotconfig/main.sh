DOT_ROOT_DIR=$HOME
DOT_REPO_DIR=$DOT_ROOT_DIR/.dotfiles
DOT_CONFIG_DIR=$DOT_ROOT_DIR/.dotconfig

DOT_FILES=(
  $DOT_ROOT_DIR/.gitconfig
  $DOT_ROOT_DIR/.gitignore
  $DOT_ROOT_DIR/.tmux.conf
  $DOT_ROOT_DIR/.vimrc
  $DOT_ROOT_DIR/.zshrc
  $DOT_CONFIG_DIR/
  $DOT_REPO_DIR/
)

dot() {
  case $1 in
  destruct)
    _dot-destruct
    ;;
  *)
    local command="$(which git) --git-dir=$DOT_REPO_DIR/ --work-tree=$DOT_ROOT_DIR"
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


DOT_ROOT_DIR=$HOME
DOT_REPO_DIR=$DOT_ROOT_DIR/.dotfiles
DOT_CONFIG_DIR=$DOT_ROOT_DIR/.dotconfig
source $DOT_CONFIG_DIR/main.sh

DOT_CONFIG_ZSH_DIR=$DOT_CONFIG_DIR/zsh

SOURCE_FILES=(
  $DOT_ROOT_DIR/.localrc
  $DOT_ROOT_DIR/.localrc.sh
  $DOT_CONFIG_ZSH_DIR/config.sh
  $DOT_CONFIG_ZSH_DIR/utilities.sh
  $DOT_CONFIG_ZSH_DIR/syntax.sh
  $DOT_CONFIG_ZSH_DIR/prompt.sh
  $DOT_CONFIG_ZSH_DIR/keyboard.sh
) 

for file in $SOURCE_FILES; do
  if [ -f $file ]; then
    source $file
  fi
done

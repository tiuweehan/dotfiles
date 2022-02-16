export DOT_ROOT_DIR=$HOME
export DOT_REPO_DIR=$DOT_ROOT_DIR/.dotfiles
export DOT_CONFIG_DIR=$DOT_ROOT_DIR/.dotconfig
export DOT_CONFIG_ZSH_DIR=$DOT_CONFIG_DIR/zsh
source $DOT_CONFIG_DIR/main.sh

SOURCE_FILES=(
  zsh/config.sh
  zsh/utilities.sh
  zsh/syntax.sh
  zsh/prompt.sh
  zsh/keyboard.sh
) 

# Run localrc.sh once before initialization
export DOTFILES_PHASE="PRE"
source $DOT_ROOT_DIR/.localrc.sh

for file in $SOURCE_FILES; do
  # Run localrc.sh once before sourcing file
  export DOTFILES_PHASE="$file"_PRE
  source $DOT_ROOT_DIR/.localrc.sh

  # Source file
  if [ -f "$DOT_CONFIG_DIR/$file" ]; then
    source "$DOT_CONFIG_DIR/$file"
  fi

  # Run localrc.sh once after sourcing file
  export DOTFILES_PHASE="$file"_POST
  source $DOT_ROOT_DIR/.localrc.sh
done

# Run localrc.sh once before initialization
export DOTFILES_PHASE="POST"
source $DOT_ROOT_DIR/.localrc.sh

unset DOTFILES_PHASE


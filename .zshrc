DOT_FILES=(
  ~/.gitconfig
  ~/.gitignore
  ~/.vimrc
  ~/.zshrc
  ~/.zsh/
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
  # Dot destruct
  # if [ "$#" -eq 1 -a "$1" = "destruct" ]; then

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

    for file in $DOT_FILES; do
      rm -rf $file
    done

    unalias dot
    unset -f dot-destruct

  # Use git alias as catch all
  # else
  #  eval "$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@"
  # fi
}

for file in $SOURCE_FILES; do
  if [ -f $file ]; then
    source $file
  fi
done

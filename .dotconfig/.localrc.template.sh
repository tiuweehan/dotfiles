if [[ $DOTFILES_PHASE == "PRE" ]]; then
elif [[ $DOTFILES_PHASE == "zsh/config.sh_PRE" ]]; then
export USE_ZSH_AUTOCOMPLETE=1
elif [[ $DOTFILES_PHASE == "zsh/config.sh_POST" ]]; then
unset USE_ZSH_AUTOCOMPLETE
elif [[ $DOTFILES_PHASE == "zsh/utilities.sh_PRE" ]]; then
elif [[ $DOTFILES_PHASE == "zsh/utilities.sh_POST" ]]; then
elif [[ $DOTFILES_PHASE == "zsh/syntax.sh_PRE" ]]; then
elif [[ $DOTFILES_PHASE == "zsh/syntax.sh_POST" ]]; then
elif [[ $DOTFILES_PHASE == "zsh/prompt.sh_PRE" ]]; then
export SHOW_HOSTNAME_IN_PROMPT=1
export PROMPT_STATUS_CODE_COLOR=cyan
export PROMPT_USERNAME_COLOR=cyan
export PROMPT_HOSTNAME_COLOR=cyan
export PROMPT_DIRECTORY_COLOR=blue
elif [[ $DOTFILES_PHASE == "zsh/prompt.sh_POST" ]]; then
unset SHOW_HOSTNAME_IN_PROMPT
elif [[ $DOTFILES_PHASE == "zsh/keyboard.sh_PRE" ]]; then
elif [[ $DOTFILES_PHASE == "zsh/keyboard.sh_POST" ]]; then
elif [[ $DOTFILES_PHASE == "POST" ]]; then
fi


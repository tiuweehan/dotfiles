# Set prompt to reevaluate prompt string
setopt prompt_subst

# Source Git prompt
source ~/.zsh/zsh-git-prompt/git-prompt.zsh 
ZSH_GIT_PROMPT_FORCE_BLANK=1

# Set prompt (Use single quotes to reload PS1 before every prompt)
# Timestamp
PS1='%{$fg[cyan]%}[%D{%H:%M:%S}]'

# Status code 
PS1="$PS1 "'%(?.%F{green}√.%F{red}?%?)%f'

# Username
PS1="$PS1 "'%B%{$fg[green]%}%n'

# Directory
PS1="$PS1 "'%{$fg[blue]%}%~%{$reset_color%}'

# Git status
PS1="$PS1 "'$(gitprompt)'

# Prompt
PS1="$PS1"'%# '

redraw_tmout() {
    case "$WIDGET" in
            expand-or-complete|self-insert|up-line-or-beginning-search|down-line-or-beginning-search|backward-delete-char|.history-incremental-search-backward|.history-incremental-search-forward)
            :
            ;;

        *)
            zle reset-prompt
            ;;
    esac
}

# # Reset the prompt when a command is entered for accurate timestamp
# TMOUT=1
# 
# # To update clock every second
# TRAPALRM() {
#  redraw_tmout
# }

function _reset-prompt-and-accept-line {
  zle reset-prompt
  zle .accept-line     # Note the . meaning the built-in accept-line.
}
zle -N accept-line _reset-prompt-and-accept-line

function preexec() {
  __timer=$(($(print -P %D{%s%6.})/1000))
}

function precmd() {
  if [ $__timer ]; then
    __now=$(($(print -P %D{%s%6.})/1000))
    __elapsed=$(($__now-$__timer))

    export RPROMPT="%F{yellow}${__elapsed}ms %{$reset_color%}"
    unset __timer
  fi
}


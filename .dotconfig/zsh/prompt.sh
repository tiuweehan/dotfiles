# Set prompt to reevaluate prompt string
setopt prompt_subst

# Source Git prompt
source $DOT_CONFIG_ZSH_DIR/zsh-git-prompt/git-prompt.zsh 
ZSH_GIT_PROMPT_FORCE_BLANK=1

# Set prompt (Use single quotes to reload PS1 before every prompt)
PS1=""

# Timestamp
# PS1='%{$fg[cyan]%}[%D{%H:%M:%S}]'

# Status code 
# PS1="$PS1"'%(?.%F{green}√.%F{red}?%?)%f'
PROMPT_STATUS_CODE_COLOR=${STATUS_CODE_COLOR:-"cyan"}
PS1="$PS1"'%(?.%F{'"$STATUS_CODE_COLOR"'}0.%F{red}%?)%f'

# Username
PROMPT_USERNAME_COLOR=${PROMPT_USERNAME_COLOR:-"cyan"}
PS1="$PS1 "'%B%{$fg['"$PROMPT_USERNAME_COLOR"']%}%n'

# Host
if [ "$SHOW_HOSTNAME_IN_PROMPT" = "1" ]; then
  PROMPT_HOSTNAME_COLOR=${PROMPT_HOSTNAME_COLOR:-"cyan"}
  PS1="$PS1"'%{$fg['"$PROMPT_HOSTNAME_COLOR"']%}@%M'
fi

# Directory
PROMPT_DIRECTORY_COLOR=${PROMPT_DIRECTORY_COLOR:-"blue"}
PS1="$PS1 "'%{$fg['"$PROMPT_DIRECTORY_COLOR"']%}%~%{$reset_color%}'

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
# zle -N accept-line _reset-prompt-and-accept-line

function displaytime {
  local T=$1
  local D=$((T/1000/1000/60/60/24))
  local H=$((T/1000/1000/60/60%24))
  local M=$((T/1000/1000/60%60))
  local S=$((T/1000/1000%60))
  local MS=$((T/1000%1000))
  local US=$((T%1000))
  (( $D > 0 )) && printf '%dd ' $D
  (( $H > 0 )) && printf '%dh ' $H
  (( $M > 0 )) && printf '%dm ' $M
  # (( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
  printf '%d.%03ds' $S $MS
}

function preexec() {
  __timer=$(($(print -P %D{%s%6.})))
}

echo -ne '\e[6 q' # Use I beam shape cursor on startup.
function precmd() {
  echo -ne '\e[6 q'
  if [ $__timer ]; then
    __now=$(($(print -P %D{%s%6.})))
    __elapsed=$(displaytime $(($__now-$__timer)))

    export RPROMPT="%F{yellow}${__elapsed} %{$reset_color%}"
    unset __timer
  fi
}


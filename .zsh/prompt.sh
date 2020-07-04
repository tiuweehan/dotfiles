# Set prompt to reevaluate prompt string
setopt prompt_subst

# Set Git prompt to use haskell stack for better performance
if [ -f ~/.zsh/zsh-git-prompt/src/.bin/gitstatus ]; then
  GIT_PROMPT_EXECUTABLE="haskell"
fi

# Source Git prompt
source ~/.zsh/zsh-git-prompt/zshrc.sh 

# Set prompt (Use single quotes to reload PS1 before every prompt)
# PS1="%(?.%F{green}√.%F{red}?%?)%f %B%{$fg[green]%}%n%{$fg[blue]%}@%{$fg[blue]%}%M %{$fg[cyan]%}%~%{$reset_color%} %# "
PS1='%{$fg[cyan]%}[%D{%H:%M:%S}] %(?.%F{green}√.%F{red}?%?)%f %B%{$fg[green]%}%n %{$fg[blue]%}%~%{$reset_color%} $(git_super_status)%# '

# Reset the prompt when a command is entered for accurate timestamp
TMOUT=1

redraw_tmout() {
  [ "$WIDGET" = "expand-or-complete" ] && [[ "$_lastcomp[insert]" =~ "^automenu$|^menu:" ]] || zle reset-prompt
}

TRAPALRM() {
  redraw_tmout
}

function preexec() {
  __timer=$(($(print -P %D{%s%6.})/1000))
}

function precmd() {
  if [ $__timer ]; then
    __now=$(($(print -P %D{%s%6.})/1000))
    __elapsed=$(($__now-$__timer))

    export RPROMPT="%F{cyan}${__elapsed}ms %{$reset_color%}"
    unset __timer
  fi
}
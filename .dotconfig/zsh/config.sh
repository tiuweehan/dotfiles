# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:

HISTSIZE=10000

SAVEHIST=10000

HISTFILE=~/.cache/zsh/history


#
# Basic auto/tab complete:

autoload -U compinit

zstyle ':completion:*' menu select

# Prevent URLs from auto complete
zstyle ':completion:*:open:argument*' tag-order - '! urls'

zmodload zsh/complist

compinit

_comp_options+=(globdots)		# Include hidden files.

# Default Editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:

HISTSIZE=10000

SAVEHIST=10000

HISTFILE=~/.cache/zsh/history

if [ "$USE_ZSH_AUTOCOMPLETE" = "1" ]; then
setopt autocd
source $DOT_CONFIG_ZSH_DIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh
else
# Basic auto/tab complete:

autoload -U compinit

zstyle ':completion:*' menu select

# Prevent URLs from auto complete
zstyle ':completion:*:open:argument*' tag-order - '! urls'

zmodload zsh/complist

compinit

_comp_options+=(globdots)		# Include hidden files.
fi

# Default Editor
export VISUAL=vim
export EDITOR="$VISUAL"


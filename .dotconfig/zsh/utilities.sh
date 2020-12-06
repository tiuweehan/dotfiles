# Utility

# fzf fd
if command -v fzf &> /dev/null && command -v fd &> /dev/null; then
### Fuzzy find and cd
function  ff() {
    local searchdir=.

    if [ ! -z "$1" ]; then
        searchdir="$1"
    fi

    local pattern=.

    if [ ! -z "$2" ]; then
        pattern="$2"
    fi

    local destdir=$(fd "$pattern" "$searchdir" --color="always" | fzf --ansi --no-mouse --preview 'bat --style=numbers --color=always --line-range :500 {}')

    if [ -z "$destdir" ]; then
      return 0
    fi

    if [ -f "$destdir" ]; then
        destdir="$(dirname $destdir)"
    fi

    cd $destdir
}

### Fast fuzzy find (without color) and cd
function  f() {
    local searchdir=.

    if [ ! -z "$1" ]; then
        searchdir="$1"
    fi

    local pattern=.

    if [ ! -z "$2" ]; then
        pattern="$2"
    fi

    local destdir=$(fd "$pattern" "$searchdir" --color="never" | fzf --no-mouse --preview 'bat --style=numbers --color=always --line-range :500 {}')

    if [ -z "$destdir" ]; then
      return 0
    fi

    if [ -f "$destdir" ]; then
        destdir="$(dirname $destdir)"
    fi

    cd $destdir
}

### Fuzzy find and vim
function  vv() {
    local searchdir=.

    if [ ! -z "$1" ]; then
        searchdir="$1"
    fi

    local pattern=.

    if [ ! -z "$2" ]; then
        pattern="$2"
    fi

    fd "$pattern" "$searchdir" --color="always" --type f | fzf \
      --ansi \
      --no-mouse \
      --preview 'bat --style=numbers --color=always --line-range :500 {}' \
      --bind 'enter:execute:vim {} < /dev/tty'

    return 0
}

### Fast fuzzy find (without color) and vim
function  v() {
    local searchdir=.

    if [ ! -z "$1" ]; then
        searchdir="$1"
    fi

    local pattern=.

    if [ ! -z "$2" ]; then
        pattern="$2"
    fi

    fd "$pattern" "$searchdir" --color="never" --type f | fzf \
      --no-mouse \
      --preview 'bat --style=numbers --color=always --line-range :500 {}' \
      --bind 'enter:execute:vim {} < /dev/tty'

    return 0
}
fi

# tmux
if command -v tmux &> /dev/null; then
### Attach tmux session
alias ta="tmux attach || tmux new"

### Detach tmux session
alias td="tmux detach"

##3 Kill tmux server
alias tk="tmux kill-server"
fi

# docker
if command -v docker &> /dev/null; then
### Enter docker container
dex() { docker exec -it $1 /bin/bash }

### Remove all Docker containers
drm() { docker rm -f "$(docker ps -a -q)" }
fi

# misc
join_by() { local IFS="$1"; shift; echo "$*"; }


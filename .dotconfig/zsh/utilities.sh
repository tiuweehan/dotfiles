# Utility

# fzf fd
if command -v fzf &> /dev/null; then
if command -v fd &> /dev/null; then
### Fast fuzzy find and cd
function  f() {
    local searchdir=.

    if [ ! -z "$1" ]; then
        searchdir="$1"
    fi

    local pattern=.

    if [ ! -z "$2" ]; then
        pattern="$2"
    fi

    local destdir=$(fd "$pattern" "$searchdir" --hidden --color="never" | fzf --reverse --no-mouse --preview 'bat --style=numbers --color=always --line-range :500 {}' --preview-window 'wrap')

    if [ -z "$destdir" ]; then
      return 0
    fi

    if [ -f "$destdir" ]; then
        destdir="$(dirname $destdir)"
    fi

    cd $destdir
}

### Fast fuzzy find and vim
function  v() {
    local searchdir=.

    if [ ! -z "$1" ]; then
        searchdir="$1"
    fi

    local pattern=.

    if [ ! -z "$2" ]; then
        pattern="$2"
    fi

    fd "$pattern" "$searchdir" --hidden --color="never" --type f | fzf \
      --reverse \
      --no-mouse \
      --preview 'bat --style=numbers --color=always --line-range :500 {}' \
      --preview-window 'wrap' \
      --bind 'enter:execute:vim {} < /dev/tty'

    return 0
}
fi

if command -v rg &> /dev/null; then
# Ripgrep, fuzzy find files containing string
function s() {
    rg  \
    --column \
    --line-number \
    --no-column \
    --no-heading \
    --fixed-strings \
    --ignore-case \
    --hidden \
    --follow \
    --glob '!.git/*' "$1" 2>/dev/null \
    | awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " start ":" end}' \
    | fzf \
      --reverse \
      --preview 'bat --wrap character --color always {1} --highlight-line {2} --line-range {3}' \
      --preview-window 'wrap'

  return 0
}

# Ripgrep, fuzzy find and vim files containing string
function vs() {
    rg  \
    --column \
    --line-number \
    --no-column \
    --no-heading \
    --fixed-strings \
    --ignore-case \
    --hidden \
    --follow \
    --glob '!.git/*' "$1" \
    | awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " start ":" end}' \
    | fzf \
      --reverse \
      --no-mouse \
      --preview 'bat --wrap character --color always {1} --highlight-line {2} --line-range {3}' \
      --preview-window 'wrap' \
      --bind 'enter:execute:vim {1} +{2} < /dev/tty'

  return 0
}
fi

if command -v rga &> /dev/null; then
# Ripgrep all, fuzzy find files containing string
function s() {
    rga  \
    --column \
    --line-number \
    --no-column \
    --no-heading \
    --fixed-strings \
    --ignore-case \
    --hidden \
    --follow \
    --glob '!.git/*' "$1" 2>/dev/null \
    | awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " start ":" end}' \
    | fzf \
      --reverse \
      --preview 'bat --wrap character --color always {1} --highlight-line {2} --line-range {3}' \
      --preview-window 'wrap'

  return 0
}
fi
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


# Functions

## Utility
join_by() { local IFS="$1"; shift; echo "$*"; }

# Use lf to switch directories and bind it to ctrl-o

if command -v lf &> /dev/null; then
  lfcd () {

      tmp="$(mktemp)"

      lf -last-dir-path="$tmp" "$@"

      if [ -f "$tmp" ]; then

          dir="$(cat "$tmp")"

          rm -f "$tmp"

          [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"

      fi

  }
  bindkey -s '^o' 'lfcd\n'
fi

## Docker

### Enter docker container
dex() { docker exec -it $1 /bin/bash }

### Remove all Docker containers
drm() { docker rm -f $(docker ps -a -q) }


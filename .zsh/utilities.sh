# Utility

# tmux
if command -v tmux &> /dev/null; then
### Attach tmux session
alias ta="tmux attach"

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
drm() { docker rm -f $(docker ps -a -q) }
fi

# misc
join_by() { local IFS="$1"; shift; echo "$*"; }


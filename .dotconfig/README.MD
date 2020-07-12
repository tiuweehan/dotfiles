# Wee Han's Dotfiles

## Setup

### Quick Setup

- **HTTP**
```
git clone --bare https://github.com/tiuweehan/dotfiles.git $HOME/.dotfiles; git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout; exec $SHELL;
```

- **SSH**
```
git clone --bare git@github.com:tiuweehan/dotfiles.git $HOME/.dotfiles; git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout; exec $SHELL;
```

&nbsp;
&nbsp;

### Detailed Setup

1. Clone this repo as a bare-bones repo into `$HOME/.dotfiles`
```
git clone --bare git@github.com:tiuweehan/dotfiles.git $HOME/.dotfiles
```
**Vertification:** `$HOME/.dotfiles` should exist

&nbsp;

2. Checkout the files to the `$HOME` directory
```
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```
**Vertification:** `.zshrc`, `.gitconfig`, `.gitignore` and `.zsh/` should be in `$HOME`

&nbsp;

3. Open a new zsh terminal

**Vertification:** `dot status` should be a valid command

## References

https://www.atlassian.com/git/tutorials/dotfiles \

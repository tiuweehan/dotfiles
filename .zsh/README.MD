# Wee Han's Dotfiles

## Setup

1. Clone this repo as a bare-bones repo into `$HOME/.dotfiles`
```
  git clone --bare git@github.com:tiuweehan/dotfiles.git $HOME/.dotfiles
```
**Vertification:** `$HOME/.dotfiles` should exist

&nbsp;

2.  Create a temporary `dot` command with the git directory in `$HOME/.dotfiles` but a work tree in the `$HOME` directory.
```
  alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
**Vertification:** `dot status` should be a valid command

&nbsp;

3. Checkout the files to the `$HOME` directory
```
  dot checkout
```
**Vertification:** `.zshrc`, `.gitconfig`, `.gitignore` and `.zsh/` should be in `$HOME`

&nbsp;

4. (Optional) For better performance, use Haskell for retrieving information about git.\
Ensure that [haskell-stack](https://docs.haskellstack.org/en/stable/README/) is installed before attempting this.
```
  ~/.zsh/zsh-git-prompt/haskell-setup.sh
```
**Vertification:** `echo $GIT_PROMPT_EXECUTABLE` should output `haskell` instead of `python`

&nbsp;

## References

https://www.atlassian.com/git/tutorials/dotfiles \
https://github.com/olivierverdier/zsh-git-prompt

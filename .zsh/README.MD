# Wee Han's Dotfiles

## Setup

### Quick Setup

- With Haskell Stack
```
git clone --bare git@github.com:tiuweehan/dotfiles.git $HOME/.dotfiles; git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout; ~/.zsh/zsh-git-prompt/haskell-setup.sh;
```

- Without Haskell Stack
```
git clone --bare git@github.com:tiuweehan/dotfiles.git $HOME/.dotfiles; git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout;
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

3. (Optional) For better performance, use Haskell for retrieving information about git.\
Ensure that [haskell-stack](https://docs.haskellstack.org/en/stable/README/) is installed before attempting this.
```
~/.zsh/zsh-git-prompt/haskell-setup.sh
```
**Vertification:** `echo $GIT_PROMPT_EXECUTABLE` should output `haskell` instead of `python`

&nbsp;

4. Open a new zsh terminal

**Vertification:** `dot status` should be a valid command

## References

https://www.atlassian.com/git/tutorials/dotfiles \
https://github.com/olivierverdier/zsh-git-prompt

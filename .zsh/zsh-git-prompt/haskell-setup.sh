if ! type stack > /dev/null; then
  echo Please install haskell-stack first.
  exit 1
fi

cd ~/.zsh/zsh-git-prompt/
stack setup
stack build
stack install


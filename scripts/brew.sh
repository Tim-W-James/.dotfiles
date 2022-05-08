#!/bin/bash
if [ -x "$(command -v brew)" ]; then
  brew update;
  brew upgrade;
  brew install diff-so-fancy;
  brew install thefuck;
  brew install fzf;
  $(brew --prefix)/opt/fzf/install;
  brew install bat;
  brew install ripgrep;
  brew install glow;
  brew install fpp;
  brew install wget;
  brew install gh;
  brew install orf/brew/gping;
  brew install procs;
  brew install duf;
  brew install broot;
  brew install dog;
else
  echo "brew not found";
fi
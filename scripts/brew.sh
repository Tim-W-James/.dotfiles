if [ -x "$(command -v brew)" ]; then
  brew update;
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
else
  echo "brew not found";
fi
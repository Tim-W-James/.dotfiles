#!/bin/bash
if [ -x "$(command -v curl)" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  nvm install --lts
  nvm use --lts
  nvm alias default --lts
else
  echo "curl not found"
fi
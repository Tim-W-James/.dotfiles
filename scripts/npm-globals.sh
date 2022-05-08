#!/bin/bash
if [ -x "$(command -v npm)" ]; then
  npm i -g yarn;
  npm i -g commitizen;
  npm i -g eslint;
  npm i -g fkill;
  npm i -g np;
  npm i -g ndb;
  npm i -g npm-name-cli;
  npm i -g prettier;
  npm i -g serverless;
  npm i -g vtop;
  npm i -g corepack;
  npm i -g tldr;
  npm i -g typescript;
  npm i -g ts-node;
  npm i -g @types/node;
  npm i -g how-2;
  npm i -g create-vite;
  npm i -g create-react-app;
  npm i -g nodemon;
else
  echo "npm not found";
fi
#!/bin/bash

if [[ -x "$(command -v fzf)" ]]; then
  __git-checkout-search() {
    if [ $# -eq 0 ]; then
      git switch $(git branch -a -vv --color=always --sort=committerdate --sort=upstream |
        grep -v '/HEAD\s' | fzf --height 40% --ansi --multi --tac | sed 's/^..//' |
        awk '{print $1}' | sed 's#^remotes/[^/]*/##')
    else
      git switch $1
    fi
  }
else
  __git-checkout-search() {
    "git checkout"
  }
fi

__git-checkout-search "$@"

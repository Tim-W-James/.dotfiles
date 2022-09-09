#!/bin/bash

if [[ -x "$(command -v fzf)" ]]; then
  __git_checkout_search() {
    if [ -z $1 ]; then
      __git_logs="git log --color=always --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
      __current_branch=$(git branch --show-current | sed -e 's/[]\/$*.^[]/\\&/g')
      __default_branch=$(awk -F / '{print $NF}' .git/refs/remotes/origin/HEAD)
      clear='\033[0m'
      green='\033[0;32m'
      blue='\033[0;34m'
      git switch $(git branch -a -vv --color=never --sort=committerdate | sed -e "/HEAD/d; /\.*\[origin/d; s/\*/ /" | sed -e '/remotes\/origin\//! s/               //' | sed -e "s/remotes\/origin\///g" | uniq | sed -e '/origin/!s/'"  $__current_branch /$(printf "* $green$__current_branch $clear")/" | sed -e '/origin/!s/'" $__default_branch /$(printf "$blue $__default_branch $clear")/" | fzf --height 40% --ansi --multi --tac --preview="$__git_logs {1} 2>/dev/null || (git fetch origin {1} 2>/dev/null && $__git_logs FETCH_HEAD) || echo \"Branch {1} does not exist on remote origin\"" | sed 's/^..//' |
        awk '{print $1}' | sed 's#^remotes/[^/]*/##')
    else
      git checkout $1
    fi
  }
else
  __git_checkout_search() {
    git checkout $1
  }
fi

cd $1
__git_checkout_search "$2"

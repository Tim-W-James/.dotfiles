# ~/.oh-my-zsh/custom/aliases.zsh

# general
alias help="man"
alias t="tail -f"
alias ff="find . -type f -name"
(($ + commands[fd])) || alias fd='find . -type d -name'
alias fd="find . -type d -name"
alias grep="grep --color"
alias sgrep="grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}"
alias processes="ps -f"

# git
# ! define in ~/.gitconfig

# alias to avoid making mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# networking
alias ports="netstat -tulnp | grep LISTEN"
alias router="ip route | grep default"
alias ip-private="hostname -I | awk {'print $1}'"
alias ip-public="curl -4 ifconfig.co"

# compilers, repl, etc.
# alias python="python3"

# directories
# alias goto-dev="cd ~/dev/"

# zsh
alias zshrc="code ~/.zshrc"
alias zsh-alias="code ~/.oh-my-zsh/custom/aliases.zsh"
alias refreshenv="source $HOME/.zshrc"

# tmux
alias tmain="~/.dotfiles/scripts/tmux-folder-session.sh ' main'"
alias tmuxconf="code ~/.tmux.conf.local"

# git
# ! define in ~/.gitconfig
if [ -x "$(command -v fzf)" ]; then
  alias commits="git log --oneline | fzf --preview 'git show --name-only {1}'"
fi

# firefox developer
alias firefox-dev="/opt/firefox/firefox"

# environment
alias env-export="export \$(cat .env)"
path-add() {
  export PATH=$PATH:$1
}

# alternatively, use the 'take' command
mkdircd() {
  mkdir $1
  cd $1
}

# backup file
bak() {
  cp $1{,.bak}
}

# add all permissions
perm-all() {
  chmod -R 777 $1
}

# change owner to me
claim() {
  sudo chown -R $USER $1
}

# file size
alias size-file-list="du -d 1 -ah | sort -h -r"
size-file() {
  du -h $1
}

# directory size
alias size-dir-list="du -d 1 -h | sort -h -r"
size-dir() {
  du -hs $1
}

# tar
compress() {
  tar -czvf archive.tar.gz $1
}
decompress() {
  tar -zxv -f $1
}

# search and use bat as a previewer
if [[ -x "$(command -v fzf)" ]] && [[ -x "$(command -v bat)" ]]; then
  alias fp="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

  supersearch() {
    if [ $# -eq 0 ]; then
      fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
    else
      if [ -d $1 ]; then
        grep -R "$(find $1/* -type f -exec cat {} \; | fzf)" $1/
      else
        cat $1 | fzf
      fi
    fi
  }

  alias sps=supersearch
fi

# base64 -> jwt (requires jq: sudo apt-get install jq)
if [ -x "$(command -v jq)" ]; then
  decode_base64_url() {
    local len=$((${#1} % 4))
    local result="$1"
    if [ $len -eq 2 ]; then
      result="$1"'=='
    elif [ $len -eq 3 ]; then
      result="$1"'='
    fi
    echo "$result" | tr '_-' '/+' | openssl enc -d -base64
  }
  decode_jwt() {
    decode_base64_url $(echo -n $2 | cut -d "." -f $1) | jq .
  }
  # Decode JWT header
  alias jwth="decode_jwt 1"
  # Decode JWT Payload
  alias jwtp="decode_jwt 2"
fi

# colorls: https://github.com/athityakumar/colorls#installation
if [ -x "$(command -v colorls)" ]; then
  alias ls="colorls --group-directories-first"
  alias la="colorls -Al --gs --group-directories-first"
  alias lt="colorls -Al --tree=3 --gs --group-directories-first"
fi

# diff-so-fancy: https://github.com/so-fancy/diff-so-fancy#install
if [ -x "$(command -v diff-so-fancy)" ]; then
  diffs() {
    diff -u $1 $2 | diff-so-fancy
  }
fi

# docker
if [ -x "$(command -v docker)" ]; then
  alias dw="watch \"docker ps --format \\\"table {{.Names}}\t{{.Status}}\\\"\""
  alias dwa="watch \"docker ps --format \\\"table {{.Names}}\t{{.Status}}\\\" -a\""
fi

if [[ -x "$(command -v fzf)" ]] && [[ -x "$(command -v docker)" ]]; then
  alias de='docker exec -it $( docker ps --format "{{.Names}}" | fzf --prompt="Choose docker container: " ) bash'

  __docker_pre_test() {
    if [[ -z "$1" ]] && [[ $(docker ps --format '{{.Names}}') ]]; then
      return 0
    fi

    if [[ ! -z "$1" ]] && [[ $(docker ps -a --format '{{.Names}}') ]]; then
      return 0
    fi

    echo "No containers found"
    return 1
  }

  __docker_logs() (
    local since=""
    if [ ! -z "$1" ]; then
      since="--since $1 "
    fi

    local count=$(wc -l <<<$2)
    if [[ -z "$2" ]]; then
      return 1
    fi
    if [[ "$count" -eq "1" ]]; then
      eval "docker logs -f $since$2"
      return 0
    fi

    local resetColor="\x1b[39m\x1b[49m"
    #list of 48 distinct colors
    local allColors="\x1b[90m\n\x1b[92m\n\x1b[93m\n\x1b[94m\n\x1b[95m\n\x1b[96m\n\x1b[97m\n\x1b[30m\n\x1b[31m\n\x1b[32m\n\x1b[33m\n\x1b[34m\n\x1b[35m\n\x1b[36m\n\x1b[40m\x1b[90m\n\x1b[40m\x1b[91m\n\x1b[40m\x1b[92m\n\x1b[40m\x1b[94m\n\x1b[40m\x1b[95m\n\x1b[40m\x1b[96m\n\x1b[40m\x1b[97m\n\x1b[41m\x1b[90m\n\x1b[41m\x1b[93m\n\x1b[41m\x1b[95m\n\x1b[41m\x1b[97m\n\x1b[42m\x1b[90m\n\x1b[42m\x1b[93m\n\x1b[42m\x1b[97m\n\x1b[43m\x1b[90m\n\x1b[43m\x1b[93m\n\x1b[43m\x1b[97m\n\x1b[44m\x1b[91m\n\x1b[44m\x1b[92m\n\x1b[44m\x1b[93m\n\x1b[44m\x1b[95m\n\x1b[44m\x1b[97m\n\x1b[45m\x1b[93m\n\x1b[45m\x1b[97m\n\x1b[46m\x1b[90m\n\x1b[46m\x1b[91m\n\x1b[46m\x1b[92m\n\x1b[46m\x1b[93m\n\x1b[46m\x1b[96m\n\x1b[46m\x1b[97m\n\x1b[47m\x1b[90m\n\x1b[47m\x1b[95m\n\x1b[47m\x1b[96m\n"
    #list of `$count` number of distinct colors
    local colors=$(echo -e "$allColors" | shuf -n $count)

    local allPids=()
    local writeToTmpFilePids=()
    local tmpFile="/tmp/fzf-docker-logs-$(date +'%s')"

    function _exit {
      for pid in "${allPids[@]}"; do
        # ignore if process is not alive anymore
        kill -9 $pid >/dev/null 2>/dev/null
      done

      test -e $tmpFile && rm -f $tmpFile
    }
    trap _exit INT TERM SIGTERM

    while read -r name; do
      # last color from list
      local color=$(echo -e "$colors" | tail -n 1)
      # update list - remove last color from list
      colors=$(echo -e "$colors" | head -n -1)

      # in bash, to get the pid for `docker logs` (so we can kill it in _exit), use `command1 > >(command2)` instead of `command1 | command2` - see https://stackoverflow.com/a/8048493/2732818
      # sed -u needed as explained in https://superuser.com/a/792051
      eval "docker logs --timestamps -f $since\"$name\" 2>&1 > >(sed -u -e \"s/^/${color}[${name}]${resetColor} /\" >> $tmpFile) &"
      local pid=($!)

      allPids+=($pid)
      writeToTmpFilePids+=($pid)
    done <<<"$2" # bash executes while loops in pipe in subshell, meaning pids will not be available outside of loop when using `echo -e "$2" | while...`

    #wait for all historc logs being written into $tmpFile
    sleep 2

    local removeTimestamp='sed -r -u "s/((\x1b\[[0-9]{2}m){0,2}\[.*\]\x1b\[39m\x1b\[49m )[^ ]+ /\1/"'

    #sort historic logs
    local numOfLines=$(wc -l <$tmpFile)
    eval "head -n $numOfLines $tmpFile | sort --stable --key=2 | $removeTimestamp"

    #show new logs
    local numOfLines=$((numOfLines + 1))
    #2>/dev/null because "tail: /tmp/fzf-docker-logs: file truncated" is outputed every time $tmpFile is emptied
    eval "tail -f -n +$numOfLines $tmpFile > >($removeTimestamp) 2>/dev/null &"
    allPids+=($!)

    #we don't really need to keep the logs on the hdd in $tmpFile so every minute empty it. But keep one line, so the "tail -f" can keep track
    eval "while true; do tail -n 1 $tmpFile > $tmpFile; sleep 10s; done &"
    allPids+=($!)

    #wait for all docker containers have stoped, i.e. no more logs can be generated
    for pid in "${writeToTmpFilePids[@]}"; do
      wait $pid
    done

    #this also kills the `tail -f $tmpFile` process
    _exit
  )

  dlogs() {
    __docker_pre_test "all"
    if [ $? -eq 0 ]; then
      local containers="$(docker ps -a --format '{{.Names}}' | fzf -n1 --reverse --tac --preview='docker logs --tail 20 {1}' --preview-window=down:50% --bind=ctrl-p:toggle-preview --header="^P: Preview Logs")"
      __docker_logs "$1" "$containers"
    fi
  }
fi

# kubernetes
if [[ -x "$(command -v kubectl)" ]] && [[ -x "$(command -v fzf)" ]]; then
  klogs() {
    pod="$(kubectl get po -o wide | tail -n+2 | fzf -n1 --reverse --tac --preview='kubectl logs --tail=20 --all-containers=true {1}' --preview-window=down:50% --bind=ctrl-p:toggle-preview --header="^P: Preview Logs")"
    if [[ -n $pod ]]; then
      kubectl logs --all-containers=true $pod
    fi
  }
fi

# browser
if [[ -n "$BROWSER" ]]; then
  _browser_fts=(htm html de org net com at cx nl se dk)
  for ft in $_browser_fts; do alias -s $ft='$BROWSER'; done
fi

# URL encoding
if [ -x "$(command -v node)" ]; then
  alias urlencode='node --eval "console.log(encodeURIComponent(process.argv[1]))"'
  alias urldecode='node --eval "console.log(decodeURIComponent(process.argv[1]))"'
fi

# remove node_modules
alias node-clean="rm -rf node_modules/"
alias node-clean-lockfile="node-clean && rm -f package-lock.json && rm -f yarn.lock && rm -f pnpm-lock.yaml"

# ! WSL2 only
# TODO set username
# alias cd-windows="cd \"/mnt/c/Users/twj/Documents/\""

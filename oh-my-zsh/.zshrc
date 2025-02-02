# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation (may need to be modified depending on username).
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# update manually with: omz update

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Commented plugins require manual install
# https://github.com/unixorn/awesome-zsh-plugins#plugins
plugins=(
  z sudo web-search command-not-found magic-enter
  copypath copyfile copybuffer jsontools aliases
  history dirhistory last-working-dir
  colorize colored-man-pages
  git gh git-auto-fetch
  # nvm node npm yarn
  # direnv
  # aws
  # docker docker-compose kubectl
  # terraform
  # brew
  # vscode
  # python pip rust scala sbt ruby gem gradle
  # tmux
  # httpie
  # multipass
  # minikube
  # lpass
  # fzf
  # asdf
  # zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete
)

# required by plugins before sourcing oh-my-zsh
# export FZF_BASE=/home/linuxbrew/.linuxbrew/opt/fzf/shell

source $ZSH/oh-my-zsh.sh

# User configuration

# ====================
# env vars
# ====================

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
  alias -s {cs,ts,html,json,xml,md}=code
fi
# Or just use vim for everything
# export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# golang
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
fi

# ====
# path
# ====

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# golang
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
fi

# set PATH to include Go binaries if Go is installed
if [ ! -z "$GOPATH" ] && [ -d "$GOPATH/bin" ]; then
  export PATH="$GOPATH/bin:$PATH"
  export PATH=$PATH:/usr/local/go/bin
fi

# aws v2
# export PATH="/usr/local/aws-cli/v2/2.7.35/bin:$PATH"

# firefox developer
# export PATH=/opt/firefox/firefox:$PATH

# ! WSL2 only - browser path
# export BROWSER='/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe'

# =======
# aliases
# =======

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# ! defined in ~/.oh-my-zsh/custom/aliases.zsh

# Use oh-my-posh (adjust theme name as required):
# eval "$(oh-my-posh --init --shell zsh --config ~/.mytheme.omp.json)"

# ====================
# plugin configuration
# ====================

export DIRENV_LOG_FORMAT="" # silent output

# autosuggestion fixes
# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste up-line-or-search down-line-or-search expand-or-complete accept-line push-line-or-edit)

# magic enter
alias __magic_enter_prefix='(command -v direnv 2>/dev/null 1>/dev/null && ((((direnv status | grep -iE "Found RC allowed (false|1)") && direnv allow) 2>/dev/null 1>/dev/null) && echo "direnv allow"))'
if [ -x "$(command -v colorls)" ]; then
  export MAGIC_ENTER_OTHER_COMMAND=' __magic_enter_prefix || colorls -Al --group-directories-first .'
  export MAGIC_ENTER_GIT_COMMAND=' __magic_enter_prefix || colorls -Al --gs --group-directories-first .'
else
  export MAGIC_ENTER_OTHER_COMMAND=' __magic_enter_prefix || ls -la .'
  export MAGIC_ENTER_GIT_COMMAND=' __magic_enter_prefix || git status -sb .'
fi
# Ignore such commands from history
setopt HIST_IGNORE_SPACE

# https://github.com/nvbn/thefuck
# eval $(thefuck --alias wtf)

# completion config
zstyle ':completion:*' file-sort access
# workaround for "do you wish to see all x possibilities" prompt eating input
zstyle ':completion:*' menu select=long
# fuzzy matching for completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# zsh-autocomplete config https://github.com/marlonrichert/zsh-autocomplete/blob/main/.zshrc
# zstyle ':autocomplete:*' list-lines 7
# zstyle ':autocomplete:*' widget-style menu-select
# zle -A {.,}history-incremental-search-forward
# zle -A {.,}history-incremental-search-backward
# requires fzf to be installed
# zstyle ':autocomplete:*' fzf-completion yes
# requires z to be installed
# zstyle ':autocomplete:*' recent-dirs zsh-z

# auto complete colors
# zstyle ':completion:*:default' list-colors \
#   "ow=30;43"

# ls colors
eval "$(dircolors ~/.dircolors)"

# ========
# keybinds
# ========

bindkey '^H' backward-kill-word
bindkey '\e[A' history-beginning-search-backward
bindkey '\eOA' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey '\eOB' history-beginning-search-forward

# override zsh-autocomplete
# bindkey -M menuselect '\r' accept-line
# bindkey '\0' set-mark-command

# ==========
# load tools
# ==========

# auto-load nvmrc
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  [[ -e .nvmrc ]] || return
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# pyenv
if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# load SSH key with keychain
# if [ -z "$SSH_AUTH_SOCK" ]; then
#   eval $(keychain --quiet --eval --agents ssh github_id_ed25519)
# fi
# GPG key
# export GPG_TTY=$TTY

# ========================
# Terminal Specific Config
# ========================

# VSCode
if [[ $TERM_PROGRAM == "vscode" ]]; then
  # start a tmux session
  if [[ $VSCODE_TERM_PROFILE == "tmux" ]]; then
    if [ -z "$TMUX" ]; then
      $HOME/.dotfiles/scripts/tmux-folder-session.sh
    fi
  fi
fi


# =========================
# environment var overrides
# =========================

# source from file
# allows extended syntax such as comments and variable expansion
if [[ -f ~/globals.env ]] && [[ -s ~/globals.env ]]; then
  set -a
  source <((cat ~/globals.env | sed -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g") | envsubst)
  set +a
fi

# ================================
# ! source additional config below
# (p10k, fzf, etc.)
# ================================

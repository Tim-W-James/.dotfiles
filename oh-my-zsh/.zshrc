# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation (may need to be modified depending on username).
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mytheme"

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
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
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
# COMPLETION_WAITING_DOTS="true" # ! not compatable with zsh-autocomplete

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
  sudo web-search dotenv command-not-found magic-enter
  copypath copyfile copybuffer 
  history dirhistory 
  colorize colored-man-pages
  git gh 
  nvm node npm 
  aws 
  docker docker-compose kubectl jsontools
  brew 
  vscode 
  python pip rust scala ruby gradle
  # fzf fzf-tab zsh-z
  # zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete
  # tmux
  # multipass
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# =================
# preferred editors
# =================

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
  alias -s {cs,ts,html,json,xml,md}=code
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# ! defined in ~/.oh-my-zsh/custom/aliases.zsh

# ============
# auto install
# ============

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use oh-my-posh (adjust theme name as required):
# eval "$(oh-my-posh --init --shell zsh --config ~/.mytheme.omp.json)"

# store environment variables here - must not be empty
export $(cat ~/.my_env)

# ====================
# plugin configuration
# ====================

export ZSH_DOTENV_PROMPT=false

# fzf
# export FZF_BASE=/home/linuxbrew/.linuxbrew/opt/fzf

# autosuggestion fixes
# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste up-line-or-search down-line-or-search expand-or-complete accept-line push-line-or-edit)

# magic enter
if [ -x "$(command -v colorls)" ]; then
  export MAGIC_ENTER_OTHER_COMMAND='colorls -Al .'
  export MAGIC_ENTER_GIT_COMMAND='colorls -Al --gs .'
else
  export MAGIC_ENTER_OTHER_COMMAND='ls -la .'
  export MAGIC_ENTER_GIT_COMMAND='git status -sb .'
fi

# https://github.com/nvbn/thefuck
# eval $(thefuck --alias wtf)

# zsh-autocomplete config https://github.com/marlonrichert/zsh-autocomplete/blob/main/.zshrc
# zstyle ':autocomplete:*' list-lines 7
# zstyle ':autocomplete:*' widget-style menu-select
# zle -A {.,}history-incremental-search-forward
# zle -A {.,}history-incremental-search-backward
# requires fzf to be installed
# style ':autocomplete:*' fzf-completion yes
# requires z to be installed
# zstyle ':autocomplete:*' recent-dirs zsh-z

# auto complete colors
# zstyle ':completion:*:default' list-colors \
#   "ow=30;43"

# ls colors
eval "$(dircolors ~/.dircolors)";

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

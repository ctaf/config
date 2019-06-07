# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"
# Default User
DEFAULT_USER="$USER"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Don't forget that common-aliases has been customized!
# (no interactive mode for rm, cp and mv)
plugins=(git debian common-aliases sudo tmux)

# Load config from oh-my-zsh first

source $ZSH/oh-my-zsh.sh

# Cause interactive mode for rm, mv is annoying
unalias rm

# Env vars
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export EDITOR='vim'

# NPM global packagages
NPM_GLOBALS=/home/ptaf/.npm-global/bin
PATH=$NPM_GLOBALS:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Prevent duplicate lines from being added to history
setopt HIST_IGNORE_DUPS

# Load dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Personal aliases

alias df='df -h'
alias du='du -cksh'
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias -g G='| grep'

# Equivalent commands in plugin 'common-aliases'
# alias ll='ls -l'
# alias la='ls -a'
# alias lt='ls -lrt'

# Machine specific config
if [[ -e ~/.zvar ]]; then
  source ~/.zvar
fi

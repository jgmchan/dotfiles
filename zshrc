# Path to your oh-my-zsh configuration.  
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jeff"
#ZSH_THEME="random"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ss="source ~/.zshrc"
alias rake="noglob rake"
alias vi="vim"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Adjust the path for Brew Installed python
which brew > /dev/null && export PATH=$(brew --prefix)/bin:$PATH
which brew > /dev/null && export PATH=$(brew --prefix)/share/python:$PATH

# Do some stuff for virtualenvwrapper
export WORKON_HOME=~/.python_envs
source /usr/local/share/python/virtualenvwrapper.sh

# Don't print out history expansions, just do them
unsetopt HIST_VERIFY

# Slightly modify the colours
export LSCOLORS="Fxfxcxdxbxegedabagacad"

# Add the rbenv stuff
which rbenv > /dev/null && eval "$(rbenv init -)"

# Add an alias to set the proxies
LOCAL_PROXY="http://localhost:3128"
alias set_proxy="export {all_proxy,http_proxy,https_proxy}=$LOCAL_PROXY" 
alias unset_proxy="unset {all_proxy,http_proxy,https_proxy}"

# Export the .bin directory for bundler binstubs
export PATH=.bin:$PATH

# Source the z configuration
. `brew --prefix`/etc/profile.d/z.sh

# Lets try using the Vim bindings :)
set -o vi
bindkey "^R" history-incremental-search-backward

# Turn on rednose for python nosetest
NOSE_REDNOSE=1

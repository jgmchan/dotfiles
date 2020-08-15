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
alias vi="nvim"
alias vim="nvim"

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
plugins=(git kubectl docker helm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Adjust the path for Brew Installed python
which brew > /dev/null && export PATH=$(brew --prefix)/bin:$PATH

# Do some stuff for virtualenvwrapper
export WORKON_HOME=~/.python_envs

# Set up pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Don't print out history expansions, just do them
unsetopt HIST_VERIFY

# Slightly modify the colours
export LSCOLORS="Exfxcxdxbxegedabagacad"

# Configure chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Export the .bin directory for bundler binstubs
export PATH=.bin:$PATH

# Source the z configuration
. `brew --prefix`/etc/profile.d/z.sh

# Set Vim bindings
set -o vi
bindkey "^R" history-incremental-search-backward

# Set up my GOPATH
export GOPATH=~/workspace/scm/go
export PATH=$GOPATH/bin:$PATH

# Set the default ruby to be 2.1.0
chruby 2.1.0

# Set some aliases for Docker
dr() {
  docker run -i -t $@ /bin/bash
}

de() {
  docker exec -i -t $@ /bin/bash
}

# Set the JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home`

# Source some secret stuff
source ~/.zshrc.secrets

# NVM
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python Anaconda
#export PATH="/Users/jeff/anaconda3/bin:$PATH"

# Haskell
export PATH="$HOME/.local/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Google Cloud
#export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.google/account.json"
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# Elixir/Kiex
#test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
export ERL_AFLAGS="-kernel shell_history enabled"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Brew
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

# Gigalixir
export PATH="~/.asdf/installs/python/3.7.6/bin:$PATH"


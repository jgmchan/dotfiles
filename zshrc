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

# Set up pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Don't print out history expansions, just do them
unsetopt HIST_VERIFY

# Slightly modify the colours
export LSCOLORS="Fxfxcxdxbxegedabagacad"

# Configure chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Export the .bin directory for bundler binstubs
export PATH=.bin:$PATH

# Add the ovftool
export PATH=/Applications/VMware\ OVF\ Tool:$PATH

# Source the z configuration
. `brew --prefix`/etc/profile.d/z.sh

# Set Vim bindings
set -o vi
bindkey "^R" history-incremental-search-backward

# Turn on rednose for python nosetest
NOSE_REDNOSE=1

# Set up my GOPATH
export GOPATH=~/workspace/scm/go
export PATH=$GOPATH/bin:$PATH

# Set up docker-machine
eval $(docker-machine env)

# Set the default ruby to be 2.1.0
chruby 2.1.0

# Set some aliases for Docker
dr() {
  docker run -i -t $@ /bin/bash
}

# Set the JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home`

# Source some stuff for work
alias set_prod='source ~/.zshrc.arbor_prod'
alias set_test='source ~/.zshrc.arbor_test'
alias set_sync='source ~/.zshrc.arbor_sync'

# Add some keys to the current shell
ssh-add ~/.ssh/cfn_mayhem_production_rsa
ssh-add ~/.ssh/cfn_mayhem_staging_rsa

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


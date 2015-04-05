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

# Do some stuff for virtualenvwrapper
export WORKON_HOME=~/.python_envs
source $(brew --prefix)/bin/virtualenvwrapper.sh

# Don't print out history expansions, just do them
unsetopt HIST_VERIFY

# Slightly modify the colours
export LSCOLORS="Fxfxcxdxbxegedabagacad"

# Configure chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Add an alias to set the proxies
LOCAL_PROXY="http://localhost:3128"
alias set_proxy="export {all_proxy,http_proxy,https_proxy}=$LOCAL_PROXY" 
alias unset_proxy="unset {all_proxy,http_proxy,https_proxy}"

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

# Set up the gpg-agent
#if [ ! -f "${HOME}/.gpg-agent-info" ]; then
  #gpg-agent --daemon --write-env-file "${HOME}/.gpg-agent-info"
#fi

#if [ -f "${HOME}/.gpg-agent-info" ]; then
    #. "${HOME}/.gpg-agent-info"
    #export GPG_AGENT_INFO
    #export SSH_AUTH_SOCK
    #export SSH_AGENT_PID
#fi

# Set up my GOPATH
export GOPATH=~/workspace/scm/go
export PATH=$GOPATH/bin:$PATH

# Set up boot2docker
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
export DOCKER_CERT_PATH=~/.docker/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Set the default ruby to be 2.1.0
chruby 2.1.0

# Set some aliases for Docker
dr() {
  docker run -i -t $@ /bin/bash
}

# Set the JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home`

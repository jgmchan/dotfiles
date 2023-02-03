#
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
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

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

# Add brew completions, MUST be done before loading oh-my-zsh
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Some homebrew formulae installs the bin to here for whatever reason
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

# Set some aliases for Docker
dr() {
  docker run -i -t $@ /bin/bash
}

de() {
  docker exec -i -t $@ /bin/bash
}

# Source some secret stuff
source ~/.zshrc.secrets

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Haskell
export PATH="$HOME/.local/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Google Cloud
#export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.google/account.json"
#source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
#source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_path '\"$HOME/.erlang-history\"'"


# asdf
. "$(brew --prefix asdf)"/libexec/asdf.sh

# asdf Erlang
# Install the docs into Erlang so we can take advantage of them in ElixirLS
export KERL_BUILD_DOCS=yes

# Brew
export PATH="$(brew --prefix openssl@1.1)/bin:$PATH"
export PATH="$(brew --prefix curl)/bin:$PATH"
export PATH="$(brew --prefix postgresql@11)/bin:$PATH"
# Required to compile Erlang, 2.71 does not work.
export PATH="$(brew --prefix autoconf@2.69)/bin:$PATH"

# Gigalixir
export PATH="~/.asdf/installs/python/3.7.6/bin:$PATH"

# Sentregroup
export VAULT_ADDR="https://vault.scentregroup.cloud"

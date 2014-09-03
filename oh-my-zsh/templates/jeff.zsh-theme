# Custom ZSH Theme - Based off bira

# Small function to get git configs
function get_git_config() {
  config=$(git config --get $1 2> /dev/null)
  echo $config
}

function git_prompt_username {
  git rev-parse --git-dir >/dev/null 2>&1 || return
  echo "$(get_git_config user.name)@"
}
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Set up the different pieces of the prompt and their colours
local user_host='%{$fg[green]%}%n@%m%{$reset_color%}'
#local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'

# Work out which version of ruby is being used
local ruby_version=''
if which rvm-prompt &> /dev/null; then
  ruby_version='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    ruby_version='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

# Work out the python version
local python_env="%{$fg[blue]%}<$(python --version 2>&1 | awk '{print $2}')>%{$reset_color%}"

# Git plugin stuff
local git_branch='$(git_prompt_username)$(git_prompt_info)%{$reset_color%}'

# And assemble everything together 
PROMPT="╭─${user_host} ${git_branch}${current_dir}  
╰─%{$fg[blue]%}$%{$reset_color%} "
RPS1="${return_code}"
# Show some useful info in the right prompt
RPROMPT="${ruby_version} ${python_env}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

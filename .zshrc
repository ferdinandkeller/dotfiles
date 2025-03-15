# define XDG parameters for services that support it
export XDG_CONFIG_HOME="$HOME/.config/"

# load homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# load direnv
eval "$(direnv hook zsh)"

# oh-my-zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7
plugins=(tmux git gh 1password multipass docker minikube terraform)
source $ZSH/oh-my-zsh.sh

# add 1password SSH socket
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# source 1password CLI
source "$HOME/.config/op/plugins.sh"

# enable fuzzy finder
source <(fzf --zsh)

# enable zoxide
eval "$(zoxide init zsh)"

# # terragrunt completion
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt
# . "$HOME/.local/bin/env"

# tmux alias with tx
# t command show either the list of tmux sessions or
# easily create/attach to an existing one
alias tx="tmux"
t() {
  if [ -z "$1" ]; then
    tmux ls
  else
    tmux new -A -s "$1"
  fi
}
_t() {
  local -a sessions
  sessions=( ${(f)"$(tmux ls -F '#S' 2>/dev/null)"} )
  _arguments \
    '1:tmux session name:->session' \
    '*:: :->args'
  if [[ $state == session ]]; then
    compadd -a sessions
    return
  fi
}
compdef _t t

# aliases for lazygit & lazydocker
alias lg="lazygit"
alias ld="lazydocker"

# alias for neovim
alias nv="nvim"

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# alias for postgres
alias psql="psql-17"

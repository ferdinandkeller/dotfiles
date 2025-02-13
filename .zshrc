# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7
plugins=(1password git gh multipass docker terraform)
source $ZSH/oh-my-zsh.sh

# add 1password SSH socket
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# source 1password CLI
source "$HOME/.config/op/plugins.sh"

# added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.cache/lm-studio/bin"

# added by NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# terragrunt completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt

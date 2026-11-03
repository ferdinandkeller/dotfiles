# define XDG parameters for services that support it
export XDG_CONFIG_HOME="$HOME/.config/"

# load homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# oh-my-zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7
# only load plugins if interactive shell
if [[ -t 1 ]] then
    plugins=(gh 1password docker kubectl)
    source $ZSH/oh-my-zsh.sh
fi

# add 1password SSH socket
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
# export default kubeconfig location
export KUBECONFIG="./kubeconfig"
# add LM Studio
export PATH="~/.lmstudio/bin:$PATH"
# enable opencode exa websearch
export OPENCODE_ENABLE_EXA=1

# enable fuzzy finder
source <(fzf --zsh)
# enable zoxide
eval "$(zoxide init zsh)"
# enable mise-en-place
eval "$(mise activate zsh)"
# enable just completions
eval "$(just --completions=zsh)"

# alias for neovim
alias nv="nvim"
# alias for opencode
alias oc="opencode"
# alias for kubernetes
alias k="kubectl"
# alias for telepresence
alias tp="telepresence"
# alias for just
alias j="just"
# alias for nix develop
alias nd="nix develop"

# jujutsu completion
source <(COMPLETE=zsh jj)
alias jja="jj log -r 'all()' --limit=100"
jjc() { jj commit -i }
jjb() { jj bookmark set "$1" -r @- && jj bookmark track "$1" --remote=origin }
jjba() { jj bookmark advance -t @- }
jjp() { jj git push }
jjf() { jj git fetch && jj new "${1:-main@origin}" }

# reload completions
autoload -Uz compinit
compinit

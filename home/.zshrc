EDITOR="nvim"

alias cat="bat"

alias eza="eza --icons auto"
alias ls="eza"
alias ll="eza -l"
alias tree="eza -T"

alias tmux="tmux -u"

alias btop="btop --utf-force"

source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

source /usr/share/nvm/init-nvm.sh

bindkey -v
KEYTIMEOUT=1

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

neofetch

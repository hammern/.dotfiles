EDITOR="nvim"

alias cat="bat"

alias eza="eza --icons auto"
alias ls="eza"
alias ll="eza -l"
alias tree="eza -T"

alias tmux="tmux -u"

alias btop="btop --utf-force"

bindkey -v
KEYTIMEOUT=1

eval "$(starship init zsh)"

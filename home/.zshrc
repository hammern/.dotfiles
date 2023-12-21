if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias cat="bat"
alias eza="eza --icons auto"
alias ls="eza"
alias ll="eza -l"
alias tree="eza -T"

source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

neofetch

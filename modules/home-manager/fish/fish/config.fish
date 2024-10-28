alias cat="bat"
alias eza="eza --icons auto"
alias ls="eza"
alias ll="eza -l"
alias tree="eza -T"

fzf_configure_bindings --directory=\cf

starship init fish | source

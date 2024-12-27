{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    neovim

    # Tools & Languages
    fd
    gcc
    gnumake
    go
    lazydocker
    lazygit
    lldb
    nodejs
    ripgrep
    rustup
    tree-sitter

    # LSPs
    bash-language-server
    dockerfile-language-server-nodejs
    gopls
    lua-language-server
    nixd
    typescript-language-server
    yaml-language-server

    # Formatters
    black
    gofumpt
    isort
    nixfmt-classic
    prettierd
    shellcheck
    shfmt
    stylua

    # Linters
    eslint_d
    golangci-lint
    markdownlint-cli
    yamllint
  ];

  home.sessionVariables = { EDITOR = "nvim"; };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    /home/hammern/.dotfiles/modules/home-manager/nvim/nvim;
}

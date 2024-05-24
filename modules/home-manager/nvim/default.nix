{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    neovim

    cmake
    fd
    gcc
    gnumake
    go
    lazydocker
    lazygit
    lldb
    nixfmt
    nodejs
    ripgrep
    rustup
    tree-sitter
    unzip
    wget
  ];

  home.sessionVariables = { EDITOR = "nvim"; };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    /home/hammern/.dotfiles/modules/home-manager/nvim/nvim;
}

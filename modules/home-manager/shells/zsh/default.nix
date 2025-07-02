{ pkgs, ... }: {
  imports = [ ../default.nix ];

  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh";

    antidote = {
      enable = true;
      plugins = [
        # Completion on tab
        "zsh-users/zsh-completions"
        "Freed-Wu/fzf-tab-source"
        "Aloxaf/fzf-tab kind:defer"

        # Syntax highlighting and suggestions
        "zdharma-continuum/fast-syntax-highlighting"
        "zsh-users/zsh-autosuggestions"
      ];
    };

    initExtra = builtins.readFile ./zsh/.zshrc;
  };
}

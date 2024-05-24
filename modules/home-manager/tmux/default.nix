{ pkgs, ... }: {
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      prefix-highlight
      vim-tmux-navigator
    ];

    extraConfig = builtins.readFile ./tmux/tmux.conf;
  };

  xdg.configFile."tmux/themes".source = ./tmux/themes;
  xdg.configFile."tmux/scripts".source = ./tmux/scripts;
}

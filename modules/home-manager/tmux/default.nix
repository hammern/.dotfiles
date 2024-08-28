{ pkgs, ... }: {
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
      {
        plugin = prefix-highlight;
        extraConfig = builtins.readFile ./tmux/themes/tokyonight_night.tmux;
      }
    ];

    extraConfig = builtins.readFile ./tmux/tmux.conf;
  };

  xdg.configFile."tmux/themes".source = ./tmux/themes;
  xdg.configFile."tmux/scripts".source = ./tmux/scripts;
}

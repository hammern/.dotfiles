{ pkgs, ... }: {
  imports = [ ../default.nix ];

  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./fish/config.fish;
    interactiveShellInit = ''
      set fish_greeting # Disabled greeting
    '';
    plugins = [{
      name = "fzf";
      src = pkgs.fishPlugins.fzf-fish.src;
    }];
  };
}

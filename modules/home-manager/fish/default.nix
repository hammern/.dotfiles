{ pkgs, ... }: {
  home.packages = with pkgs; [
    bat
    btop
    caligula
    cmatrix
    cowsay
    eza
    ffmpeg
    fzf
    ncdu
    p7zip
    starship
  ];

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

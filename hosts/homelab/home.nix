{ ... }:
{
  home.username = "hammern";
  home.homeDirectory = "/home/hammern";

  imports =
    builtins.foldl' (acc: module: [ ../../modules/home-manager/${module}/default.nix ] ++ acc)
      [ ]
      [
        "git"
        "shells/fish"
        "tmux"
        "nvim"
      ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}

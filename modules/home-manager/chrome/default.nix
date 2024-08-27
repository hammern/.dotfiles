{ pkgs, lib, ... }: {
  home.packages = with pkgs; [ google-chrome ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "google-chrome" ];
}

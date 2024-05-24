{ pkgs, lib, ... }: {
  home.packages = with pkgs; [ discord ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "discord" ];
}

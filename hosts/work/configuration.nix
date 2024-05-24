{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ] ++ builtins.foldl'
    (acc: module: [ ../../modules/nixos/${module}/default.nix ] ++ acc)
    [ ] [ "audio" "bluetooth" "bootloader" "fonts" "locale" ];

  networking.hostName = "work";

  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  users.users.hammern = {
    isNormalUser = true;
    description = "hammern";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.settings.auto-optimise-store = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ git home-manager vim ];

  programs.zsh.enable = true;

  programs.hyprland.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/hammern/.dotfiles";
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ stdenv.cc.cc ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}

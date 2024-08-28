{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ] ++ builtins.foldl'
    (acc: module: [ ../../modules/nixos/${module}/default.nix ] ++ acc)
    [ ] [ "audio" "bluetooth" "bootloader" "fonts" "locale" "nvidia" "usb" ];

  networking.hostName = "home";

  networking.networkmanager.enable = true;

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
  services.gvfs.enable = true;

  programs.steam.enable = true;

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

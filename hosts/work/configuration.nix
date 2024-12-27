{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ] ++ builtins.foldl'
    (acc: module: [ ../../modules/nixos/${module}/default.nix ] ++ acc) [ ] [
      "audio"
      "bluetooth"
      "bootloader"
      "docker"
      "fonts"
      "locale"
      "usb"
      "shells/fish"
    ];

  networking.hostName = "work";

  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  users.users.hammern = {
    isNormalUser = true;
    description = "hammern";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.settings.auto-optimise-store = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ git home-manager vim ];

  programs.hyprland.enable = true;
  services.gvfs.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/hammern/.dotfiles";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}

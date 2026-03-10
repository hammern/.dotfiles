{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ]
  ++
    builtins.foldl' (acc: module: [ ../../modules/nixos/${module}/default.nix ] ++ acc)
      [ ]
      [
        "audio"
        "bluetooth"
        "bootloader"
        "fonts"
        "locale"
        "nh"
        "nvidia"
        "usb"
        "shells/zsh"
      ];

  networking.hostName = "home";

  networking.networkmanager.enable = true;

  users.users.hammern = {
    isNormalUser = true;
    description = "hammern";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nix.settings.auto-optimise-store = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    home-manager
    vim
  ];

  programs.hyprland.enable = true;
  services.gvfs.enable = true;

  programs.steam.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.05";
}

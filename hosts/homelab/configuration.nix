{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ]
  ++
    builtins.foldl' (acc: module: [ ../../modules/nixos/${module}/default.nix ] ++ acc)
      [ ]
      [
        "bootloader"
        "fonts"
        "locale"
        "nh"
        "usb"
        "shells/fish"
      ];

  networking.hostName = "homelab";

  networking.networkmanager.enable = true;

  services.openssh.enable = true;

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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.05";
}

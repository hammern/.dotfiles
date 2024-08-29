{ pkgs, ... }: {
  home.packages = with pkgs; [
    cliphist
    dunst
    firefox
    gedit
    grimblast
    hypridle
    hyprlock
    hyprpaper
    nautilus
    qbittorrent
    vlc
    waybar
    wl-clipboard
    wlogout
    wofi
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # hint electron apps to use wayland
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };

  xdg.configFile."hypr".source = ./hypr;
}

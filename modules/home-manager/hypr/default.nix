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
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark";
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  xdg.configFile."hypr".source = ./hypr;
}

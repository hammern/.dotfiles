{ pkgs, ... }:
let gtkTheme = "Adwaita-dark";
in {
  home.packages = with pkgs; [
    clipse
    dunst
    firefox
    gedit
    grimblast
    hypridle
    hyprlock
    hyprpaper
    nautilus
    pipewire
    playerctl
    qbittorrent
    vlc
    waybar
    wireplumber
    wlogout
    wofi
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # hint electron apps to use wayland
    GTK_THEME = gtkTheme;
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
      package = pkgs.gnome-themes-extra;
      name = gtkTheme;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  xdg.configFile."hypr".source = ./hypr;
}

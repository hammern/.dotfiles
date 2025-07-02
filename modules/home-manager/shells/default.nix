{ pkgs, ... }: {
  home.packages = with pkgs; [
    bat
    btop
    caligula
    cmatrix
    cowsay
    eza
    ffmpeg
    fzf
    ncdu
    p7zip
    starship
  ];
}

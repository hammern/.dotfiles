{ pkgs, ... }: {
  home.packages = with pkgs; [ git ];

  programs.git = {
    enable = true;
    userName = "Nadav Hammer";
    userEmail = "twindata36@gmail.com";
  };
}

{ pkgs, ... }: {
  users.users.hammern.shell = pkgs.fish;

  programs.fish.enable = true;
}

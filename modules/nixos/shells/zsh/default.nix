{ pkgs, ... }: {
  users.users.hammern.shell = pkgs.zsh;

  programs.zsh.enable = true;
}

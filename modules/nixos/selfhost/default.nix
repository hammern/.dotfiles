{ ... }:
let
  domain = "domain.local";
in
{
  imports = [
    (import ./caddy.nix { inherit domain; })
    (import ./homepage.nix { inherit domain; })
  ];

  services.immich.enable = true;

  services.jellyfin.enable = true;
}

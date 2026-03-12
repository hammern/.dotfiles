{ domain, ... }:
{
  # for testing locally, delete later
  networking.extraHosts = ''
    127.0.0.1 homepage.${domain}
    127.0.0.1 immich.${domain}
    127.0.0.1 jellyfin.${domain}
  '';

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  services.caddy = {
    enable = true;
    virtualHosts =
      builtins.foldl'
        (
          acc: service:
          acc
          // {
            "${service.name}.${domain}".extraConfig = ''
              tls internal
              reverse_proxy http://localhost:${service.port}
            '';
          }
        )
        { }
        [
          {
            name = "homepage";
            port = "8082";
          }
          {
            name = "immich";
            port = "2283";
          }
          {
            name = "jellyfin";
            port = "8096";
          }
        ];
  };
}

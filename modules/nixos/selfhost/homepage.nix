{ domain, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    allowedHosts = "homepage.${domain}";
    services = [
      {
        Media = [
          {
            Jellyfin = {
              icon = "jellyfin.svg";
              href = "https://jellyfin.${domain}";
              description = "The free software media server";
              widget = {
                type = "jellyfin";
                url = "https://jellyfin.${domain}";
                key = "api-key";
                version = 2;
              };
            };
          }
          {
            Immich = {
              icon = "immich.svg";
              href = "https://immich.${domain}";
              description = "Self-hosted photo and video management solution";
              widget = {
                type = "immich";
                url = "https://immich.${domain}";
                key = "api-key";
                version = 2;
              };
            };
          }
        ];
      }
    ];
    widgets = [
      {
        resources = {
          cpu = true;
          memory = true;
          disk = "/";
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];
  };
}

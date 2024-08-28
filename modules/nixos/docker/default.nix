{ ... }: {
  users.users.hammern.extraGroups = [ "docker" ];

  virtualisation.docker.enable = true;

  networking.firewall = {
    enable = true;
    extraCommands = ''
      iptables -I INPUT 1 -s 172.16.0.0/12 -p tcp -d 172.17.0.1 -j ACCEPT
      iptables -I INPUT 2 -s 172.16.0.0/12 -p udp -d 172.17.0.1 -j ACCEPT
    '';
  };
}

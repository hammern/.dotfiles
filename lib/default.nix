{
  inputs,
  system,
  specialArgs,
  pkgs,
}: {
  mkSystem = hostname:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = [../hosts/${hostname}/configuration.nix];
    };

  mkHome = hostname:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [../hosts/${hostname}/home.nix];
    };
}

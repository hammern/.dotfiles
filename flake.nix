{
  description = "Nadav Hammer's NixOS Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${system};
      specialArgs = { inherit pkgs-stable; };

      utils =
        import ./lib/default.nix { inherit inputs system specialArgs pkgs; };
    in {
      nixosConfigurations = {
        home = utils.mkSystem "home";
        work = utils.mkSystem "work";
      };
      homeConfigurations = {
        "hammern@home" = utils.mkHome "home";
        "hammern@work" = utils.mkHome "work";
      };

      packages = {
        default = self.packages.${system}.install;

        install = pkgs.writeShellApplication {
          name = "install";
          runtimeInputs = with pkgs; [ fzf git nh ];
          text = builtins.readFile ./install/install.sh;
        };
      };

      apps = {
        default = self.apps.${system}.install;

        install = {
          type = "app";
          program = "${self.packages.${system}.install}/bin/install";
        };
      };
    };
}

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    home-manager,
    nixgl,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        unfree-pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
        username = "comavius";
      in {
        packages.homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            ./modules/shell
            ./modules/terminal
          ];
          extraSpecialArgs = {
            inherit pkgs unfree-pkgs username nixgl;
          };
        };
        formatter = pkgs.alejandra;
      }
    );
}

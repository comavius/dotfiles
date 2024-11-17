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
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            nixgl.overlay
          ];
        };
        unfree-pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        username = "comavius";
      in {
        packages.homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            ./modules/shell
            ./modules/terminal
            ./modules/sway/mako.nix
            ./modules/sway/sway.nix
            ./modules/sway/sway-launcher.nix
            ./modules/sway/waybar.nix
            ./modules/sway/desktop-entry.nix
            ./modules/i18n
          ];
          extraSpecialArgs = {
            inherit pkgs unfree-pkgs username;
          };
        };
        formatter = pkgs.alejandra;
      }
    );
}

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
    ubuntu-wallpapers = {
      url = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/ubuntu-wallpapers/24.10.3/ubuntu-wallpapers_24.10.3.orig.tar.gz";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    home-manager,
    nixgl,
    ubuntu-wallpapers,
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
            ./modules/sway/rofi.nix
            ./modules/sway/waybar.nix
            ./modules/sway/desktop-entry.nix
            ./modules/sway/swayidle.nix
            ./modules/i18n
            ./modules/home-manager
            ./modules/utils
          ];
          extraSpecialArgs = {
            inherit pkgs unfree-pkgs username ubuntu-wallpapers;
          };
        };
        formatter = pkgs.alejandra;
      }
    );
}

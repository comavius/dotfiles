{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        username = "comavius";
      in
        {
          packages.homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              (import ./home.nix { inherit pkgs; })
            ];
          };
        }
    );
}
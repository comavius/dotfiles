{pkgs, username, ...}: let
  home-manager-directory = pkgs.stdenv.mkDerivation {
    name = "home-manager-directory";
    src = ./.;
    phases = "installPhase";
    installPhase = ''
      mkdir -p $out
      cp -r * $out
    '';
  };
in
 {
  home = {
    homeDirectory = "/home/${username}";
    file = {
      ".home-manager".source = home-manager-directory;
    };
  };
}
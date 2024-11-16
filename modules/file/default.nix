{pkgs, username, ...}: let
  home-manager-directory = pkgs.stdenv.mkDerivation {
    name = "home-manager-directory";
    src = ./.home-manager;
    phases = "installPhase";
    installPhase = ''
      mkdir -p $out
      ln -s $src/* $out
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
{pkgs, username, ...}: let
  home-switch = pkgs.writeShellScriptBin "home-switch" ''
    #!${pkgs.zsh}/bin/zsh
    cd /home/${username}/dotfiles
    git pull
    home-manager --flake . switch
    cd -
  '';
in {
  home = {
    packages = [
      home-switch
      pkgs.home-manager
    ];
  };
}
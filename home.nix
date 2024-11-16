{ pkgs, username, ... }: {
  home = {
    inherit username;
    stateVersion = "24.05";
    packages = [
      pkgs.bottom
      pkgs.home-manager
    ];
    homeDirectory = "/home/${username}";
  };

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
  programs.home-manager.enable = true;
}
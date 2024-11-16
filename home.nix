{ pkgs, username, ... }: {
  home = {
    inherit username;
    stateVersion = "24.05";
    packages = [
      pkgs.bottom
    ];
    homeDirectory = "/home/${username}";
  };

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
}
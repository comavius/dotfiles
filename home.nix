{ pkgs, username, ... }: {
  home.username = username;

  home.stateVersion = "24.05";

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  home.packages = [
    pkgs.bottom
  ];
}
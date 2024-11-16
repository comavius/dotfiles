{
  pkgs,
  username,
  ...
}: {
  home = {
    inherit username;
    stateVersion = "24.05";
    packages = [
      pkgs.bottom
      pkgs.gping
      pkgs.home-manager
    ];
    homeDirectory = "/home/${username}";
    sessionVariables = {
      SHELL = "zsh";
    };
  };

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
}

{
  pkgs,
  unfree-pkgs,
  username,
  nixgl,
  ...
}: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    packages = [
      pkgs.bottom
      pkgs.gping
      pkgs.home-manager
      unfree-pkgs.helvetica-neue-lt-std
      pkgs.noto-fonts
      nixgl
    ];
    sessionVariables = {
      SHELL = "zsh";
    };
  };

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
}

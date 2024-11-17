{
  pkgs,
  unfree-pkgs,
  username,
  ...
}: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    packages = [
      pkgs.libreoffice
      pkgs.bottom
      pkgs.gping
      unfree-pkgs.helvetica-neue-lt-std
      pkgs.noto-fonts
      pkgs.nixgl.nixGLMesa
    ];
    sessionVariables = {
      SHELL = "zsh";
    };
  };

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
}

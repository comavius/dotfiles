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

  home.file.".config/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-application-prefer-dark-theme=1
  '';
}

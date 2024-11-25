{
  username,
  pkgs,
  ...
}:
{
  home.file = {
    ".home-manager/sway/sway.desktop".text = ''
      [Desktop Entry]
      Name=Sway
      Comment=An cd-compatible Wayland compositor
      Exec=/home/${username}/.home-manager/sway/entry.sh
      Type=Application
      DesktopNames=sway
    '';
    ".home-manager/sway/entry.sh" = {
      text = ''
        #!${pkgs.zsh}/bin/zsh
        source /home/${username}/.pshenv
        source /home/${username}/.zshrc
        ${pkgs.nixgl.nixGLMesa}/bin/nixGLMesa ${pkgs.sway}/bin/sway
      '';
      executable = true;
    };
  };
}

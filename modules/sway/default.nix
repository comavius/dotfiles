{ username, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty"; 
      startup = [
      ];
    };
    wrapperFeatures.gtk = true;
  };
  home.file = {
    ".home-manager/sway/sway.desktop".text = ''
      [Desktop Entry]
      Name=Sway
      Comment=An cd-compatible Wayland compositor
      Exec=/home/${username}/.home-manager/sway/sway-session.sh
      Type=Application
      DesktopNames=sway
    '';
    ".home-manager/sway/sway-session.sh".text = ''
      /home/${username}/.nix-profile/bin/nixGLMesa /home/${username}/.nix-profile/bin/sway
    '';
  };
}
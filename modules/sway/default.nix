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
      Exec=sh /home/${username}/.home-manager/sway/sway-session.sh
      Type=Application
      DesktopNames=sway
    '';
    ".home-manager/sway/sway-session.sh".text = ''
      su - ${username}
      /home/${username}/.nix-profile/bin/zsh
      source /home/${username}/.zshrc
      nixGLMesa sway
    '';
  };
}
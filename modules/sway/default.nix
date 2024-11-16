{ ... }: {
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
      Exec=sway
      Type=Application
    '';
  };
}
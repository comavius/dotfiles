{ ... }: {
  wayland.windowManager.sway = {
    enable = true;
  };
  home.file = {
    ".home-manager/sway/sway.Desktop".text = ''
      [Desktop Entry]
      Name=Sway
      Comment=An i3-compatible Wayland compositor
      Exec=sway
      Type=Application
    '';
  };
}
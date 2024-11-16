{ ... }: {
  wayland.windowManager.sway = {
    enable = true;
    extraPackages = pkgs: with pkgs; [
      swaybg
      swayidle
      swaylock
      waybar
    ];
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
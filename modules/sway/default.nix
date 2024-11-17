{username, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [
      ];
    bars = [ ];
    };
    wrapperFeatures.gtk = true;
  };
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = ["sway/workspaces" "sway/mode" "wlr/taskbar"];
        modules-center = ["sway/window"];
        modules-right = ["mpd" "temperature"];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
      };
    };
  };
  programs.swaylock.enable = true;
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
      /home/${username}/.nix-profile/bin/sway
    '';
  };
}

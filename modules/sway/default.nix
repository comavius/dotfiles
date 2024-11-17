{
  username,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [
      ];
      window = {
        titlebar = false;
      };
      focus = {
        followMouse = "always";
        newWindow = "focus";
      };
      bars = [
        {
          command = "${pkgs.waybar}/bin/waybar";
        }
      ];
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
        modules-left = ["sway/workspaces" "wlr/taskbar"];
        modules-center = ["sway/window"];
        modules-right = [
          "pulseaudio"
          "memory"
          "cpu"
          "battery"
          "clock"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
        };
        "clock" = {
          "format" = "{:%Y/%m/%d %H:%M}";
        };
        "cpu" = {
          "interval" = 10;
          "format" = "CPU: {usage}%";
        };
        "memory" = {
          "interval" = 10;
          "format" = "RAM: {used:0.1f}GiB";
        };
        "battery" = {
          "bat" = "BAT0";
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 10;
          };
          "format" = "BAT0: {capacity}%";
          "format-charging" = "BAT0: {capacity}% (charging)";
          "format-plugged" = "BAT0: {capacity}% (plugged)";
        };
        "pulseaudio" = {
          "format" = "{volume}%";
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

args @ {
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
      menu = "rofi -show drun";
      floating.criteria = [
        {title = "sway-launcher-desktop";}
      ];
      input = {
        "type:keyboard" = {
            xkb_layout = "jp";
        };
        "type:touchpad" = {
            natural_scroll = "enabled";
        };
      };
    };
    wrapperFeatures.gtk = true;
  };
  programs.swaylock.enable = true;
  environment.variables = {
    GTK_THEME = "Adwaita:dark";
  };
}

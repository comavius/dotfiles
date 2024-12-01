{
  username,
  pkgs,
  ubuntu-wallpapers,
  ...
}:
let
  # change color
  wallpaper = pkgs.stdenv.mkDerivation {
    name = "wallpaper";
    src = ubuntu-wallpapers;
    buildInputs = [ pkgs.imagemagick ];
    installPhase = ''
      mkdir -p $out
      magick convert $src/hardy_wallpaper_uhd.png -modulate 80,40,220 $out/wallpaper.png
    '';
  };
  workspace = number: "workspace number ${toString number}";
  terminal = "kitty";
  menu = "rofi -show drun";
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      inherit terminal menu;

      startup =
        [
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
      floating.criteria = [
        { title = "sway-launcher-desktop"; }
      ];
      input = {
        "type:keyboard" = {
          xkb_layout = "jp";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
          tap = "enabled";
        };
      };
      modes = {
        resize = {
          Down = "exec swaymsg resize grow height 10 px";
          Escape = "exec swaymsg mode default";
          Left = "exec swaymsg resize shrink width 10 px";
          Return = "exec swaymsg mode default";
          Right = "exec swaymsg resize grow width 10 px";
          Up = "exec swaymsg resize shrink height 10 px";
        };

      };
      keybindings =
        let
          win = "Mod4";
          hyper = "shift";
        in
        {
          "${win}+1" = "${workspace 1}";
          "${win}+2" = "${workspace 2}";
          "${win}+3" = "${workspace 3}";
          "${win}+4" = "${workspace 4}";
          "${win}+5" = "${workspace 5}";
          "${win}+6" = "${workspace 6}";
          "${win}+7" = "${workspace 7}";
          "${win}+8" = "${workspace 8}";
          "${win}+9" = "${workspace 9}";
          "${win}+0" = "${workspace 10}";
          "${win}+r" = "mode resize";
          "${win}+${hyper}+q" = "kill";
          "${win}+Return" = "exec ${terminal}";
          "${win}+d" = "exec ${menu}";

          "${win}+Left" = "move left";
          "${win}+Down" = "move down";
          "${win}+Up" = "move up";
          "${win}+Right" = "move right";
        };
    };
    extraConfig = ''
      output * bg ${wallpaper}/wallpaper.png stretch
    '';
    wrapperFeatures.gtk = true;
  };
}

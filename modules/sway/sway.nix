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
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";

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
      menu = "rofi -show drun";
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
    };
    extraConfig = ''
      output * bg ${wallpaper}/wallpaper.png stretch
    '';
    wrapperFeatures.gtk = true;
  };
}

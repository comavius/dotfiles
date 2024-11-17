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
        "*" = {
            xkb_layout = "jp";
            libinput = "{natural_scrolling: \"disabled\"}";
        };
      };
    };
    wrapperFeatures.gtk = true;
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

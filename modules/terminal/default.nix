{pkgs, ...}: let
in {
  programs.kitty = {
    enable = true;
    themeFile = "${pkgs.kitty-themes}/themes/Dracula.conf";
  };
}
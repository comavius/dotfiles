{pkgs, ...}: let
in {
  home.packages = [
    pkgs.glfw
  ];
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";
  };
}

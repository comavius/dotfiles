{ pkgs, ... }:
let
in
{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";
  };
}

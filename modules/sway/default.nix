let
  sway = import ./sway.nix;
  waybar = import ./waybar.nix;
  mako = import ./mako.nix;
  launcher = import ./sway-launcher.nix;
in 
[
  sway
  waybar
  mako
  launcher
]
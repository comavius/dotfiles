args @ {...}: let
  sway = import ./sway.nix args;
  waybar = import ./waybar.nix args;
in
  sway // waybar

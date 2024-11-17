args @ {...}: let
  sway = import ./sway.nix args;
  waybar = import ./waybar.nix args;
  mako = import ./mako.nix args;
in
  sway // waybar // mako

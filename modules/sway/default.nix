args @ {...}: let
  sway = import ./sway.nix args;
  waybar = import ./waybar.nix args;
  mako = import ./mako.nix args;
  fzf = import ./fzf.nix args;
in
  sway // waybar // mako // fzf

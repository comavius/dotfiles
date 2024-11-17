{pkgs, ...}: {
  home.packages = [
    pkgs.sway-launcher-desktop
  ];
  home.file.".home-manager/sway/sway-launcher.sh" = {
    text = ''
      #!${pkgs.zsh}/bin/zsh
      kitty ${pkgs.sway-launcher-desktop}/bin/sway-launcher-desktop &
      while ! swaymsg -t get_tree | grep -q sway-launcher-desktop; do
        sleep 0.1
      done
      swaymsg '[title="sway-launcher-desktop"]' focus
    '';
    executable = true;
  };
}
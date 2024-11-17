{pkgs, ...}: {
  home.packages = [
    pkgs.sway-launcher-desktop
  ];
  home.file.".home-manager/sway/sway-launcher.sh" = {
    text = ''
      #!${pkgs.zsh}/bin/zsh
      ${pkgs.sway-launcher-desktop}/bin/sway-launcher-desktop &
      sleep 0.1
      swaymsg '[title="sway-launcher-desktop"]' floating enable
      swaymsg '[title="sway-launcher-desktop"]' focus
    '';
    executable = true;
  };
}
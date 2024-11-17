{pkgs, ...}: {
  home.packages = [
    pkgs.networkmanager
    pkgs.pavucontrol
    pkgs.brightnessctl
  ];
}

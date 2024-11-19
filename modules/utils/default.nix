{pkgs, ...}: {
  home.packages = [
    pkgs.networkmanager
    pkgs.pavucontrol
    pkgs.brightnessctl
    pkgs.libreoffice
    pkgs.bottom
    pkgs.gping
    pkgs.nixd
    pkgs.pre-commit
  ];
}

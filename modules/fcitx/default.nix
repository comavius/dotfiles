{pkgs, ...}: {
  home.packages = [
    pkgs.fcitx5
    pkgs.fcitx5-configtool
    pkgs.fcitx5-mozc
  ];
}

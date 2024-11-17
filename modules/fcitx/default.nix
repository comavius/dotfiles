{pkgs, ...}: {
  home.packages = [
    pkgs.fcitx
    pkgs.fcitx-configtool
    pkgs.fcitx-mozc
  ];
}

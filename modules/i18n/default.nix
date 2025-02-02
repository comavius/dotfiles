{ pkgs, ... }:
{
  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = [
          pkgs.fcitx5-configtool
          pkgs.fcitx5-mozc
        ];
      };
    };
  };
  programs.zsh.localVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
}

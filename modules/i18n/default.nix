{pkgs, ...}: {
  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons =[
          pkgs.fcitx5-configtool
          pkgs.fcitx5-mozc
        ];
      };
    };
  };
  programs.zsh.localVariables = {
    GTK_IM_MODULE = "fcitx5";
    QT_IM_MODULE = "fcitx5";
    XMODIFIERS = "@im=fcitx5";
  };
}
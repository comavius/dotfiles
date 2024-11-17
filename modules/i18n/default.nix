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
    defaultLocale = "ja_JP.UTF-9";
  };
}
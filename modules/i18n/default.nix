{pkgs, ...}: {
  i18n = {
    inputMethod = {
      enable = true;
      fcitx5 = {
        addons =[
          pkgs.fcitx5-configtool
          pkgs.fcitx5-mozc
        ];
        waylandFrontend = true;
      };
    };
  };
}
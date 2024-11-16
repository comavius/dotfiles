{username, ...}: {
  home = {
    homeDirectory = "/home/${username}";
    file = {
      ".home-manager/.profile".text = ''
        if type zsh > /dev/null 2>&1; then
          export SHELL="zsh"
          exec zsh
        fi
      '';
    };
  };
}
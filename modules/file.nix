{username, pkgs, ...}: {
  home = {
    homeDirectory = "/home/${username}";
    file = {
      ".profile".text = ''
        if type zsh > /dev/null 2>&1; then
          export SHELL="zsh"
          exec zsh
        else
          exec ${pkgs.bash}/bin/bash
        fi
      '';
    };
  };
}
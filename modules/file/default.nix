{username, ...}: {
  home = {
    homeDirectory = "/home/${username}";
    file = {
      ".home-manager/.bashrc"  = {
        source = ./.bashrc;
      };
    };
  };
}
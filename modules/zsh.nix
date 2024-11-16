{username, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
      ];
    };
    history = {
      size = 10000;
      path = "/home/${username}/.zsh_history";
    };
  };
  home.sessionVariables.SHELL = "zsh";
}

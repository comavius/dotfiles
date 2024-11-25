{ username, ... }:
{
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
    envExtra = ''
      if [ -f "/home/${username}/.profile" ]; then
      source "/home/${username}/.profile"
      fi
    '';
  };
  home.sessionVariables.SHELL = "zsh";
}

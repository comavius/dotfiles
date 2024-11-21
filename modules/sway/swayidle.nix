{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    timeouts = [
      # use external swaylock command to make sure pam works
      {
        timeout = 270;
        command = "/usr/bin/swaylock -e -L -c 222222";
      }
      {
        timeout = 300;
        command = "systemctl suspend";
      }
    ];
  };
}

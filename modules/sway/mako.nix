{unfree-pkgs, ...}: {
  services.mako = {
    enable = true;
    font = unfree-pkgs.helvetica-neue-lt-std;
    layer = "top";
    icons = true;
    anchor = "top-right";
    defaultTimeout = 20000;
  };
}
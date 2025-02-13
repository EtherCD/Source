{ inputs, pkgs, ... }: {

  imports = [
    ./source.nix
  ];

	environment.systemPackages = with pkgs; [
    hyprpaper
    hyprpicker
    clipse
    wl-clipboard
    grim
    tofi
    swaynotificationcenter
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  nixpkgs.overlays = [
    (import ./flameshot)
  ];
}
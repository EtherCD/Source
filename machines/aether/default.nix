let

pkgs = import <nixpkgs> {}; 

in 

{
  imports = [
    ./hardware-configuration.nix
    ../../packages/source.nix
    ../../modules/sound
    ../../modules/trim
    ../../modules/plymouth
    ../../modules/boot
    ../../modules/plasma6
    #../../modules/xanmod
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  time.timeZone = "Pacific/Auckland";

  nix.gc = {
    automatic = true;
    dates = "daily";
  };

  nix.settings.auto-optimise-store = true;


  users.users.ethercd = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "input" "networkmanager" ]; 
  };
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11";

  networking.hostName = "aether";
}

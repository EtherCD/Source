{
  imports = [
    ./hardware-configuration.nix
    ../../modules/plasma6
    ../../modules/xanmod
    ../../modules/boot
    ../../modules/plymouth
    ../../modules/sound
    ../../modules/trim
    ../../packages/source.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  time.timeZone = "Pacific/Auckland";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  }; 

  users.users.ethercd = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" ]; 
  };
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";

  networking.hostName = "aether";
}

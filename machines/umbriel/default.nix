{
  imports = [
    ./hardware-configuration.nix
    ../../modules/dwm
    ../../modules/boot
    ../../modules/network
    ../../packages/umbriel.nix
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

  networking.hostName = "umbriel";
}

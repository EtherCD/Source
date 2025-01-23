let

pkgs = import <nixpkgs> {}; 

in 

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/dwm
    ../../modules/boot
    ../../modules/ssh
    ../../modules/samba
    ../../packages/umbriel.nix
  ];

  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
    };
  };

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
    shell = pkgs.zsh;
  };
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";

  networking.hostName = "umbriel";
}

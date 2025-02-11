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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  time.timeZone = "Pacific/Auckland";

  nix.gc = {
    automatic = true;
    dates = "daily";
  };

  nix.settings.auto-optimise-store = true;

  networking.firewall.allowedTCPPorts = [ 22 445 139 ];

  users.users = {
    ethercd = {
      isNormalUser = true;
      extraGroups = [ "wheel" "input" "networkmanager" ]; 
      shell = pkgs.zsh;
    };
    jrethercd = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11";

  networking.hostName = "umbriel";
}

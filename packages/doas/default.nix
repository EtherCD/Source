let

pkgs = import <nixpkgs> {}; 

in 

{
  environment.etc."doas.conf".text = pkgs.lib.mkDefault ''
    permit :wheel
  '';

  security.doas.enable = true;
  #security.sudo.enable = false;
  security.doas.extraRules = [{
    users = [ "ethercd" ];
    keepEnv = true;
  }];
}
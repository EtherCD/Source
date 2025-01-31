# Umbriel

{ pkgs, ... }: {
  services = {
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
    };

    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.override {
          patches = [
            (pkgs.fetchpatch {
							url = "https://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.4.diff"; 
							hash = "sha256-+OXRqnlVeCP2Ihco+J7s5BQPpwFyRRf8lnVsN7rm+Cc="; 
						})
          ];
        };
      };

      xkb.layout = "us,ru";
      xkb.options = "grp:alt_shift_toggle";

      videoDrivers = [ "intel" ];
    };
	};
}
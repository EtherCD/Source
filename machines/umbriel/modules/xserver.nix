# Umbriel

{ pkgs, ... }: {

	services = {
		libinput = {
			enable = true;
			mouse.accelProfile = "flat";
		};

		xserver = {
			enable = true;
            windowManager.dwm.enable = true;
            windowManager.dwm.package = pkgs.dwm.override {
                src = ./dmw;
            };

			xkb.layout = "us,ru";
			xkb.options = "grp:alt_shift_toggle";
			
			videoDrivers = [ "intel" ];
		};
	};


}

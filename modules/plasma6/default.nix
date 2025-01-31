{ pkgs, ... }: {
	services = {
		desktopManager.plasma6.enable = true;
		displayManager = {
			sddm.enable = true;
			defaultSession = "plasma";
		};

		libinput = {
			enable = true;
			mouse.accelProfile = "flat";
		};

		xserver = {
			enable = true;

			xkb.layout = "us,ru";
			xkb.options = "grp:alt_shift_toggle";

			extraConfig = ''
				Section "InputClass"
					Identifier "pointer"
					MatchDriver "libinput"
					MatchProduct "Logitech G305"
					Option "AccelSpeed" "2.3"
				EndSection
			'';
			
			videoDrivers = [ "amdgpu" ];
		};
	};
}

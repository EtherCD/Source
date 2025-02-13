{ config, pkgs, ... }: {
	home = {
		username = "ethercd";
		homeDirectory = "/home/ethercd";
		stateVersion = "24.05";
		
		packages = with pkgs; [
			vscode
			vlc
			kitty
			lsd
			bat
			btop
			fzf
			viber
			fastfetch
			cpufetch
			nerdfetch
		];
	};

	imports =
		[
			./git
			./firefox
			./vscode
			./obs-studio
			./kitty
			./lsd
			./bat
			./zsh
			./flameshot
		];

	programs.home-manager = {
		enable = true;
	};
}


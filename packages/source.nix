# Packages for Source

{ inputs, pkgs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = [ "electron-25.9.0" "openssl-1.1.1w" ];
		packageOverrides = pkgs: rec {
			nur = import (builtins.fetchTarball {
				sha256 = "sha256:0j0sdnq4dkz10yjq0in4v6q6r05vbhssyzi8k6apmmz2lwpaj7r5";
				url = "https://github.com/nix-community/NUR/archive/9fa2187952b1050eb4da2d969f0c7a267697dace.tar.gz";
			}) {
				inherit pkgs;
			};
		};
	};

	# Here stuff for all machines 

	environment.systemPackages = with pkgs; [
		audacity
		obs-studio
		obsidian
		spotify
		steam
		vesktop

		# Util Stuff
		flameshot
		upscayl

		# Coding
		vscode
		jetbrains.idea-community


		# Coding stuff
		mongodb-compass
		docker
		bun
		gnumake
		yarn
		wget
		gcc
		ffmpeg
		nodejs
		cargo
		rustc
		ninja
		cmake
		gh
		dnsutils
		nmap

		amdgpu_top

		python311

		home-manager
		(import ./spotify-adblock)
		(import ./beefetch)
		
		doas
	];

	imports = [
		./doas
	];

	programs.java = { enable = true; package = pkgs.jdk17; };

	programs.steam = {
		enable = true;
	};
	
	home-manager = {
		useGlobalPkgs = true;
	};

	programs.zsh = {
		enable = true;
	};

	fonts.packages = with pkgs; [
		jetbrains-mono
		noto-fonts
		noto-fonts-emoji
		twemoji-color-font
		font-awesome
		(nerdfonts.override { fonts = ["FantasqueSansMono" "NerdFontsSymbolsOnly"]; })
		comic-relief
	];
}

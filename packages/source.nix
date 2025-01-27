# Packages for Source

{ inputs, pkgs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = [ "electron-25.9.0" "openssl-1.1.1w" ];
		packageOverrides = pkgs: rec {
			nur = import (builtins.fetchTarball {
				sha256 = "0nr4csla421yx7q74a4zca2m3sqwyawpjwqxjnf33yzlin8ld0r5";
				url = "https://github.com/nix-community/NUR/archive/23d88faa35dc9de0e35fc3dc2a863c4cf451a8f8.tar.gz";
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
		firefox
		spotify
		figma-linux
		steam
		vesktop
		audacity
		haguichi

		# Util Stuff
		flameshot
		upscayl
		vlc

		# Coding
		vscode
		jetbrains.idea-community
		jetbrains.webstorm


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

		pipewire
		pulseaudio
		pamixer
		amdgpu_top

		python311
		fastfetch
		mpv

		home-manager
		(import ./spotify-adblock)
		(import ./beefetch)
	];


	programs.java = { enable = true; package = pkgs.openjdk22; };

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

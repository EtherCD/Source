# Packages for Umbriel

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

	environment.systemPackages = with pkgs; [
		alacritty

		yarn
		gcc
		gnumake
		cmake
		wget
		nodejs
		gh

		fastfetch
		htop
		btop
		python311
		lm_sensors

		home-manager
		(import ./beefetch)
	];

	programs.zsh = {
		enable = true;
	};

	home-manager = {
		useGlobalPkgs = true;
	};

	fonts.packages = with pkgs; [
		jetbrains-mono
		noto-fonts
		twemoji-color-font
		font-awesome
		(nerdfonts.override { fonts = ["FantasqueSansMono"]; })
	];
}

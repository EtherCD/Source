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

	# Here stuff for all machines 

	environment.systemPackages = with pkgs; [
    alacritty

		gnumake
		yarn
		wget
		gcc
		nodejs
		cargo
		rustc
		ninja
		cmake
		gh

		python311

		home-manager
		(import ./beefetch)
	];


	home-manager = {
		useGlobalPkgs = false;
	};

	fonts.packages = with pkgs; [
		font-awesome
		(nerdfonts.override { fonts = ["FantasqueSansMono"]; })
	];
}

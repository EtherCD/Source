{ config, pkgs, ... }: {
	home = {
		username = "ethercd";
		homeDirectory = "/home/ethercd";
		stateVersion = "24.05";
	};
}
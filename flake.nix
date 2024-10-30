{
	description = "Aether";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		pipewire-screenaudio.url = "github:IceDBorn/pipewire-screenaudio";

		plasma-manager.url = "github:nix-community/plasma-manager";
	};

	outputs = {nixpkgs, home-manager, pipewire-screenaudio, plasma-manager, ...} @ inputs: {
		nixosConfigurations.aether = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [ 
				./configuration.nix 
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.ethercd = import ./machines/source/home-manager;
				}
			];
		};
	};
}

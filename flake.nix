{
	description = "NixOS \"Source\" configurations";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};


    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
	};

	outputs = {nixpkgs, home-manager, ...} @ inputs: {
		nixosConfigurations = {
			aether = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [ 
					./machines/aether
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.ethercd = import ./home-manager/source.nix;
					}
				];
			};
			eos = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [ 
					./machines/eos
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.ethercd = import ./home-manager/eos.nix;
					}
				];
			};
			umbriel = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [ 
					./machines/umbriel 
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.ethercd = import ./home-manager/umbriel.nix;
					}
				];
			};
		};
	};
}

<div align="center"> 
<h1>My NixOS configuration</h1>
<img src="./stuff/icons/favicon.png" width="64">
<p>Simple configuration, maded by dreamer</p>
<b>Version of NixOS 24.05, gruvbox styled</b>
</div>

## Structure

In `modules` setting upped services and de/wm

In `packages` custom packages, and `source.nix` `umbriel.nix` that files contains packages, `source.nix` for Eos and Aether (contains all packages I need), and `umbriel.nix` only for server

In `home-manager` custom configs and packages for user, and and the same files `source.nix` and `umbriel.nix`.

In `machines` machines configuration files

## Machines

This configuration is not finished yet.

### Aether

This is for my PC Configuration, with plasma6

`I should definitely make the plasma6 configuration reproducible`

Now uses custom kernel ([xanmod](https://xanmod.org/)) which compiles

### Eos

For my laptop, still not written...

### Umbriel

For my new home server.

Uses dwm, and minimal set of programs

## Usage

1. Generate configuration

   This is necessary for Nix to create `hardware-configuration.nix`

2. Clone repository, and change `configuration.nix`

   Copy your `hardware-configuration.nix` to path of the selected configuration

```nix
{
  imports = [
    ./machines/<machine name config>
  ];
}
```

3. Don't forget change in `flake.nix` this line:

```nix
18 | 		nixosConfigurations.aether = nixpkgs.lib.nixosSystem {
```

to

```nix
18 | 		nixosConfigurations.<machine name config> = nixpkgs.lib.nixosSystem {
```

3. And build!

**If you find bug or something like that, create issue on this repository!**

_If, of course, this configuration will be useful to someone.._

## Wallpapers

This is my special power!

<details>
  <summary>Full HD Wallpapers</summary>

![Not loaded wallpaper for Eos :(](./stuff/wallpapers/Umbriel-0.png)

![Not loaded wallpaper for Eos :(](./stuff/wallpapers/Eos-0.png)

![Not loaded wallpaper for Eos :(](./stuff/wallpapers/Eos-1.png)

![Not loaded wallpaper for Eos :(](./stuff/wallpapers/Eos-2.png)

![Not loaded wallpaper for Aether :(](./stuff/wallpapers/Aether-0.png)

![Not loaded wallpaper for Aether :(](./stuff/wallpapers/Aether-1.png)

![Not loaded wallpaper for Aether :(](./stuff/wallpapers/Aether-2.png)

![Imagine vector wallpaper in Gruvbox style..](./stuff/wallpapers/Aether-3.png)

![Imagine vector wallpaper in Gruvbox style..](./stuff/wallpapers/Source-0.png)

**All these wallpapers you can use anywhere!**

</details>

## License

[MIT License](./LICENSE.txt)

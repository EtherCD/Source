{ pkgs, ... }:

{
  boot.kernelPackages = let
      linux_xanmod_pkg = { fetchurl, buildLinux, lib, ... } @ args:

        buildLinux (args // rec {
          version = "6.13.2-xanmod1";
          modDirVersion = version;

          src = fetchurl {
            url = "https://gitlab.com/xanmod/linux/-/archive/${version}/linux-${version}.tar.gz";
            hash = "sha256-A0WAuJ5nVvsQ+F3u/oUr9IkPIY/hlLv0NoWo8EgzU40=";
          };

          nativeBuildInputs = with pkgs; [
            coreutils
            kmod
            bc
            cpio
            gettext
            libelf
            llvm
            lld
            clang
            pahole
            perl
            xz
            zstd
            linux-firmware
            modprobed-db
            wireless-redgb
            clangStdenv
          ];

          extraMeta.branch = "6.11";
        } // (args.argsOverride or {}));
      linux_xanmod = pkgs.callPackage linux_xanmod_pkg{};
    in 
      pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_xanmod);
}


let

pkgs = import <nixpkgs> {}; 

in

final: prev: {
  flameshot = prev.flameshot.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "flameshot-org";
      repo = "flameshot";
      rev = "7aa69e4e253b0a69b67c018b701db5ee8448142c";
      sha256 = "sha256-1OPZsOoe+z7xql1o44BisxF/pWqd5vx2a+Ar0gLerVA=";
    };
    cmakeFlags = [
      "-DUSE_WAYLAND_CLIPBOARD=1"
      "-DUSE_WAYLAND_GRIM=1"
    ];
    buildInputs = oldAttrs.buildInputs ++ [ pkgs.libsForQt5.kguiaddons ];
  });
}
{ haskell }:

haskell.packages.ghc844.callPackage (
  import ../mkPurescriptPkg.nix {
    version = "0.12.3";
    sha256 = "0h4216x80cgqdvl7l0glw9xxhnpakh8272p65yc2d5zwbvvfra6k";
  }
) {}

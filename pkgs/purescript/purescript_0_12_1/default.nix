{ haskell }:

haskell.packages.ghc844.callPackage
  (
    import ../mkPurescriptPkg.nix {
      version = "0.12.1";
      sha256 = "81ab67e994a85e4ee455d35a5023b5ee2f191c83e9de2be65a8cd2892e302454";
    }
  )
{ }

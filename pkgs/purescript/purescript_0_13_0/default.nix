{ haskell }:
let
  ghc = haskell.packages.ghc864;
  networkPkg =
    { mkDerivation
    , base
    , bytestring
    , deepseq
    , directory
    , hspec
    , hspec-discover
    , HUnit
    , stdenv
    }:
    mkDerivation {
      pname = "network";
      version = "3.0.1.1";
      sha256 = "d2bc064ea56c14275ff755800c3dd033ad6092fb24ad1783f9ec10c70bdd4cf5";
      libraryHaskellDepends = [ base bytestring deepseq ];
      testHaskellDepends = [ base bytestring directory hspec HUnit ];
      testToolDepends = [ hspec-discover ];
      homepage = "https://github.com/haskell/network";
      description = "Low-level networking interface";
      license = stdenv.lib.licenses.bsd3;
    };
  purescriptPkg = import ../mkPurescriptPkg.nix {
    version = "0.13.0";
    sha256 = "1cpdbb48a8qs57adc37qkcfaszj3m6gds6gdq07iq11b6gmfzr3q";
    extraDepends = [ packages.happy ];
  };
  packages = ghc.override {
    overrides = haskellPackagesNew: _: rec {
      network = haskellPackagesNew.callPackage networkPkg { };
      purescript = haskellPackagesNew.callPackage purescriptPkg { };
    };
  };
in
packages.purescript

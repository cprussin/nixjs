{ callPackage, nixpkgs }:
let
  buildNodejs = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" { };
in
buildNodejs {
  version = "12.16.2";
  sha256 = "0y5yd6h13fr34byi7h5xdjaivgcxiz0ykcmpk9nm5ra01b54fp2m";
}

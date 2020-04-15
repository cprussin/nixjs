{ stdenv, callPackage, lib, libuv_1_34_0 }:

let
  libuv = libuv_1_34_0;
  buildNodejs = callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> { inherit libuv; };
in
buildNodejs {
  version = "12.16.2";
  sha256 = "0y5yd6h13fr34byi7h5xdjaivgcxiz0ykcmpk9nm5ra01b54fp2m";
}

{ stdenv, callPackage, lib, libuv_1_24_0 }:

let
  libuv = libuv_1_24_0;
  buildNodejs = callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> { inherit libuv; };
in
  buildNodejs {
    version = "10.13.0";
    sha256 = "0hg6z89lczjs4cc8ljqqdy4h1n5ccwclniyyj2651yr81imck04d";
  }

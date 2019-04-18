{ stdenv, callPackage, lib, openssl_1_1, libuv_1_24_0 }:

let
  openssl = openssl_1_1;
  libuv = libuv_1_24_0;
  buildNodejs = callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> { inherit openssl libuv; };
in
  buildNodejs {
    version = "10.14.1";
    sha256 = "0d5hg8hf4c1sshh77a6hy944bzm3q3ipqggbyim61q3r2szngvrx";
  }

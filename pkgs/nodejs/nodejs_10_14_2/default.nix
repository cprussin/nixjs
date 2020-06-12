{ callPackage, openssl_1_1, libuv_1_24_0 }:

let
  openssl = openssl_1_1;
  libuv = libuv_1_24_0;
  buildNodejs = callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> { inherit openssl libuv; };
in

buildNodejs {
  version = "10.14.2";
  sha256 = "1lxcjl7q59zp3hp6gri6gg2d717x1694h1wczgmlv3yawdayq6mf";
}

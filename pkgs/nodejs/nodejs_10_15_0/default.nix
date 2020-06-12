{ callPackage, openssl_1_1, libuv_1_24_0, http-parser_2_9_0 }:

let
  openssl = openssl_1_1;
  libuv = libuv_1_24_0;
  http-parser = http-parser_2_9_0;
  buildNodejs = callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> { inherit openssl libuv http-parser; };
in

buildNodejs {
  version = "10.15.0";
  sha256 = "0gnygq4n7aar4jrynnnslxhlrlrml9f1n9passvj2fxqfi6b6ykr";
}

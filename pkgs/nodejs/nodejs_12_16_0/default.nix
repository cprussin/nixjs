{ callPackage, libuv_1_34_0 }:

let
  libuv = libuv_1_34_0;
  buildNodejs = callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> { inherit libuv; };
in

buildNodejs {
  version = "12.16.0";
  sha256 = "09grij355z210mkzkzarb6gwz8b02lnaxzdll1249kiz8wvhdjdq";
}

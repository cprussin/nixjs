{ callPackage }:

let
  libuv_1_24_0 = callPackage ./libraries/libuv_1_24_0 {};
in

{
  inherit libuv_1_24_0;

  electron_3_0_0-beta_5 = callPackage ./electron/electron_3_0_0-beta_5 {};

  nodejs_10_14_1 = callPackage ./nodejs/nodejs_10_14_1 { inherit libuv_1_24_0; };
  nodejs_10_14_2 = callPackage ./nodejs/nodejs_10_14_2 { inherit libuv_1_24_0; };

  purescript_0_12_1 =
    let
      purescript = import ./purescript { version = "0.12.1"; sha256 = "81ab67e994a85e4ee455d35a5023b5ee2f191c83e9de2be65a8cd2892e302454"; };
    in
      callPackage purescript {};
  purescript_0_12_2 =
    let
      purescript = import ./purescript { version = "0.12.2"; sha256 = "1y7bcfj6fdlwmisdd75xcdkz7grch0pcmb9xsh6zwyvi6c40a3g2"; };
    in
      callPackage purescript {};

  yarn_1_12_3 = callPackage ./yarn/yarn_1_12_3 {};
}

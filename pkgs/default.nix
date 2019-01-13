{ callPackage }:

let
  libuv_1_24_0 = callPackage ./libraries/libuv_1_24_0 {};
in

{
  inherit libuv_1_24_0;

  electron_3_0_0-beta_5 = callPackage ./electron/electron_3_0_0-beta_5 {};

  nodejs_10_14_1 = callPackage ./nodejs/nodejs_10_14_1 { inherit libuv_1_24_0; };
  nodejs_10_14_2 = callPackage ./nodejs/nodejs_10_14_2 { inherit libuv_1_24_0; };

  purescript_0_12_1 = callPackage ./purescript/purescript_0_12_1 {};

  yarn_1_12_3 = callPackage ./yarn/yarn_1_12_3 {};
}

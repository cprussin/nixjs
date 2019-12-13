{ callPackage }:

let
  libuv_1_24_0 = callPackage ./libraries/libuv_1_24_0 {};
  http-parser_2_9_0 = callPackage ./libraries/http-parser_2_9_0 {};
in

{
  inherit libuv_1_24_0 http-parser_2_9_0;

  electron_3_0_0-beta_5 = callPackage ./electron/electron_3_0_0-beta_5 {};
  electron_4_0_4 = callPackage ./electron/electron_4_0_4 {};

  nodejs_10_13_0 = callPackage ./nodejs/nodejs_10_13_0 { inherit libuv_1_24_0; };
  nodejs_10_14_1 = callPackage ./nodejs/nodejs_10_14_1 { inherit libuv_1_24_0; };
  nodejs_10_14_2 = callPackage ./nodejs/nodejs_10_14_2 { inherit libuv_1_24_0; };
  nodejs_10_15_0 = callPackage ./nodejs/nodejs_10_15_0 { inherit libuv_1_24_0 http-parser_2_9_0; };
  nodejs_10_15_1 = callPackage ./nodejs/nodejs_10_15_1 { inherit libuv_1_24_0 http-parser_2_9_0; };
  nodejs_10_15_3 = callPackage ./nodejs/nodejs_10_15_3 { inherit libuv_1_24_0 http-parser_2_9_0; };

  purescript_0_12_1 = callPackage ./purescript/purescript_0_12_1 {};
  purescript_0_12_2 = callPackage ./purescript/purescript_0_12_2 {};
  purescript_0_12_3 = callPackage ./purescript/purescript_0_12_3 {};
  purescript_0_12_4 = callPackage ./purescript/purescript_0_12_4 {};
  purescript_0_12_5 = callPackage ./purescript/purescript_0_12_5 {};
  purescript_0_13_0 = callPackage ./purescript/purescript_0_13_0 {};

  spago_0_7_2_0 = callPackage ./purescript/spago_0_7_2_0 {};
  spago_0_7_5_0 = callPackage ./purescript/spago_0_7_5_0 {};

  yarn_1_12_3 = callPackage ./yarn/yarn_1_12_3 {};
  yarn_1_16_0 = callPackage ./yarn/yarn_1_16_0 {};
  yarn_1_21_1 = callPackage ./yarn/yarn_1_21_1 {};
}

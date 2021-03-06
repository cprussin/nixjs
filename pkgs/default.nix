{ callPackage, nixpkgs }:

{
  electron_3_0_0-beta_5 = callPackage ./electron/electron_3_0_0-beta_5 { };
  electron_4_0_4 = callPackage ./electron/electron_4_0_4 { };

  nodejs_9_10_1 = callPackage ./nodejs/nodejs_9_10_1 { inherit nixpkgs; };
  nodejs_10_13_0 = callPackage ./nodejs/nodejs_10_13_0 { inherit nixpkgs; };
  nodejs_10_14_1 = callPackage ./nodejs/nodejs_10_14_1 { inherit nixpkgs; };
  nodejs_10_14_2 = callPackage ./nodejs/nodejs_10_14_2 { inherit nixpkgs; };
  nodejs_10_15_0 = callPackage ./nodejs/nodejs_10_15_0 { inherit nixpkgs; };
  nodejs_10_15_1 = callPackage ./nodejs/nodejs_10_15_1 { inherit nixpkgs; };
  nodejs_10_15_3 = callPackage ./nodejs/nodejs_10_15_3 { inherit nixpkgs; };
  nodejs_10_19_0 = callPackage ./nodejs/nodejs_10_19_0 { inherit nixpkgs; };
  nodejs_12_14_1 = callPackage ./nodejs/nodejs_12_14_1 { inherit nixpkgs; };
  nodejs_12_16_0 = callPackage ./nodejs/nodejs_12_16_0 { inherit nixpkgs; };
  nodejs_12_16_2 = callPackage ./nodejs/nodejs_12_16_2 { inherit nixpkgs; };

  purescript_0_12_1 = callPackage ./purescript/purescript_0_12_1 { };
  purescript_0_12_2 = callPackage ./purescript/purescript_0_12_2 { };
  purescript_0_12_3 = callPackage ./purescript/purescript_0_12_3 { };
  purescript_0_12_4 = callPackage ./purescript/purescript_0_12_4 { };
  purescript_0_12_5 = callPackage ./purescript/purescript_0_12_5 { };
  purescript_0_13_0 = callPackage ./purescript/purescript_0_13_0 { };

  spago_0_7_2_0 = callPackage ./purescript/spago_0_7_2_0 { };
  spago_0_7_5_0 = callPackage ./purescript/spago_0_7_5_0 { };

  yarn_1_12_3 = callPackage ./yarn/yarn_1_12_3 { };
  yarn_1_16_0 = callPackage ./yarn/yarn_1_16_0 { };
  yarn_1_21_1 = callPackage ./yarn/yarn_1_21_1 { };
  yarn_1_22_0 = callPackage ./yarn/yarn_1_22_0 { };
  yarn_1_22_4 = callPackage ./yarn/yarn_1_22_4 { };
  yarn_2_0_0-rc_27 = callPackage ./yarn/yarn_2_0_0-rc_27 { };
}

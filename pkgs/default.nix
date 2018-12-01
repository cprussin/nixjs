{ callPackage }:

{
  libuv_1_24_0 = callPackage ./libraries/libuv_1_24_0 {};
  nodejs_10_14_1 = callPackage ./nodejs/nodejs_10_14_1 {};
  yarn_1_12_3 = callPackage ./yarn/yarn_1_12_3 {};
}

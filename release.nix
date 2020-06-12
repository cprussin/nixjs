let
  nixjs = import (./.);
  pkgsBase = import <nixpkgs> { overlays = []; };

  pkgVersions = collection:
    let
      chompPackageName =
        builtins.replaceStrings ["${collection}_"] [""];
      collectionDir = (toString ./pkgs + "/${collection}");
    in
      map chompPackageName (builtins.attrNames (
        builtins.readDir collectionDir
      ));

  #allVersions =
  #  let
  #    attrize = (nodejs: yarn: { inherit nodejs yarn; });
  #  in
  #    pkgsBase.lib.crossLists attrize
  #      [
  #        (pkgVersions "nodejs")
  #        (pkgVersions "yarn")
  #      ];

  allVersions = [
    {nodejs = "12_16_2"; yarn = "1_22_4"; }
  ];

  pkgs = versions: (import <nixpkgs> {
    overlays = [ (nixjs versions) ];
  });
in

map (versions:
  let
    pkgs' = pkgs versions;
  in
    [ pkgs'.nodejs pkgs'.yarn ]
) allVersions

let
  sources = import ./sources.nix;
in

{ nix-linter ? sources.nix-linter
, nixpkgs ? sources.nixpkgs
}:

  let
    nix-linter-overlay = self: _: {
      nix-linter = (self.callPackage nix-linter {}).nix-linter;
    };

    files = import ./files.nix;

    pkgs = import nixpkgs {
      overlays = [
        nix-linter-overlay
      ];
    };
  in

    pkgs.writeShellScriptBin "lint" "${pkgs.nix-linter}/bin/nix-linter $@ ${files}"

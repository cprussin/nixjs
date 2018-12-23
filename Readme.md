# nixjs

This repository contains nix packages for nodejs versions and associated tools
and libraries that are not available in nixpkgs.  The package set can be
consumed as an overlay.

## Usage

This repository can be consumed as a nixpkgs overlay.  For instance, to pull in
purescript and a specific node and yarn version, you could use the following
`shell.nix`:

```nix
{ nixjs ? import (fetchTarball "https://github.com/cprussin/nixjs/archive/0.0.1.tar.gz")
, nixpkgs ? import <nixpkgs> { overlays = [ nixjs ]; }
}:

nixpkgs.mkShell {
  buildInputs = with nixpkgs; [
    nodejs_10_14_2
    yarn_1_12_3.override { nodejs = nodejs_10_14_2; }
    purescript_0_12_1
  ];
}
```

## Contributing

This repository is open to contributions!  We welcome the following packages in
this repository:

- All versions of nodejs
- Versions of nodejs libraries that aren't in nixpkgs or aren't reliable in
  nixpkgs
- Javascript ecosystem tools like yarn, pnpm, etc.
- Tooling for languages that compile to javascript--for instance, purescript,
  elm, and typescript

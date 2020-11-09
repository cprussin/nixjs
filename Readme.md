# nixjs

This repository contains nix packages for various versions of javascript tools
and associated libraries.  It is indended for development on javascript projects
where being precise about your tooling versioning is important.  To see a
complete list of available packages, take a look in
[pkgs/default.nix](pkgs/default.nix).

## Usage

It is recommended to consume this package set as an overlay.  To create the
overlay, simply `import` the default module and pass it a set containing keys
for the package names you want, and values which are the versions you want.  For
instance, to pull in purescript and a specific node and yarn version, you could
use the following `shell.nix`:

```nix
{
  nodejs ? "12.16.2",
  yarn ? "1.22.4",
  nixjs ? fetchTarball "https://github.com/cprussin/nixjs/tarball/release-20.03",
  nixpkgs ? <nixpkgs>
}:

let
  nixjs-overlay = import nixjs {
    inherit nixpkgs;
    versions = {
      inherit nodejs yarn;
    };
  };
  pkgs = import nixpkgs { overlays = [ nixjs-overlay ]; };
in

pkgs.mkShell {
  buildInputs = [ pkgs.nodejs pkgs.yarn ];
}
```

## Binary Cache

- **Cache URL**: `https://nixjs.cachix.org`
- **Public Key**: `nixjs.cachix.org-1:3v2zgxvA0y7kmoD1/oIXfVRnDWZA+F3ysfT9TbBBg/E=`

There is a [binary cache at cachix](https://app.cachix.org/cache/nixjs) that you
can use.  Not all combinations are pre-built, but if you're using relatively
modern versions you shouldn't have to build.

To set up the cache, you can use the cachix client:

```bash
cachix use nixjs
```

Alternatively, you can add the appropriate options to `nix.conf` manually:

```
substituters = https://nixjs.cachix.org
trusted-public-keys = nixjs.cachix.org-1:3v2zgxvA0y7kmoD1/oIXfVRnDWZA+F3ysfT9TbBBg/E=
```

Or with in your NixOS `configuration.nix`:

```nix
{ ... }:

{
  nix = {
    binaryCaches = [ "https://nixjs.cachix.org" ];
    binaryCachePublicKeys = [ "nixjs.cachix.org-1:3v2zgxvA0y7kmoD1/oIXfVRnDWZA+F3ysfT9TbBBg/E=" ];
  };
}
```

## Contributing

This repository is open to contributions!  We welcome the following packages in
this repository:

- All versions of nodejs
- Javascript ecosystem tools that are generally not installed via node package
  managers, such as the package managers themselves (yarn, pnpm, etc.)
- Portions of tooling for languages that compile to javascript that aren't
  generally installed through node package managers (for instance, the
  purescript compiler)
- Versions of system libraries necessary to support any of the above that aren't
  in nixpkgs or aren't reliable in nixpkgs

Things we would prefer not to have in this package set:

- Node modules / bower components.  There are better tools out there that do a
  more holistic job at solving nix packaging for these portions of the
  ecosystem, such as `node2nix` and `bower2nix`.  This includes things like
  `psc` for purescript or `bower` itself, which are best installed through a
  node package manager.
- Versions of system libraries that are available and supported in nixpkgs.

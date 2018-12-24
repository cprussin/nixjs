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
  nodejsVersion ? "10.14.1",
  yarnVersion ? "1.12.3",
  purescriptVersion ? "0.12.1",
  nixjs ? fetchTarball "https://github.com/cprussin/nixjs/archive/0.0.2.tar.gz",
  nixpkgs ? <nixpkgs>
}:

with import nixpkgs {
  overlays = [
    (import nixjs {
      nodejs = nodejsVersion;
      yarn = yarnVersion;
      purescript = purescriptVersion;
    })
  ];
};

mkShell {
  buildInputs = [ nodejs yarn purescript ];
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

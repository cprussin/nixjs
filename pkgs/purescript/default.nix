{ version, sha256 }: { haskell }:

haskell.packages.ghc843.callPackage (
  { mkDerivation, aeson, aeson-better-errors, ansi-terminal
  , ansi-wl-pprint, base, base-compat, blaze-html, bower-json, boxes
  , bytestring, Cabal, cheapskate, clock, containers, data-ordlist
  , deepseq, directory, dlist, edit-distance, file-embed, filepath
  , fsnotify, gitrev, Glob, haskeline, hspec, hspec-discover
  , http-types, HUnit, language-javascript, lifted-base
  , microlens-platform, monad-control, monad-logger, mtl, network
  , optparse-applicative, parallel, parsec, pattern-arrows, process
  , protolude, regex-tdfa, safe, scientific, semigroups, sourcemap
  , split, stdenv, stm, stringsearch, syb, tasty, tasty-hspec, text
  , time, transformers, transformers-base, transformers-compat
  , unordered-containers, utf8-string, vector, wai, wai-websockets
  , warp, websockets
  }:

  mkDerivation {
    pname = "purescript";
    version = version;
    sha256 = sha256;
    isLibrary = true;
    isExecutable = true;
    libraryHaskellDepends = [
      aeson aeson-better-errors ansi-terminal base base-compat blaze-html
      bower-json boxes bytestring Cabal cheapskate clock containers
      data-ordlist deepseq directory dlist edit-distance file-embed
      filepath fsnotify Glob haskeline language-javascript lifted-base
      microlens-platform monad-control monad-logger mtl parallel parsec
      pattern-arrows process protolude regex-tdfa safe scientific
      semigroups sourcemap split stm stringsearch syb text time
      transformers transformers-base transformers-compat
      unordered-containers utf8-string vector
    ];
    executableHaskellDepends = [
      aeson aeson-better-errors ansi-terminal ansi-wl-pprint base
      base-compat blaze-html bower-json boxes bytestring Cabal cheapskate
      clock containers data-ordlist deepseq directory dlist edit-distance
      file-embed filepath fsnotify gitrev Glob haskeline http-types
      language-javascript lifted-base microlens-platform monad-control
      monad-logger mtl network optparse-applicative parallel parsec
      pattern-arrows process protolude regex-tdfa safe scientific
      semigroups sourcemap split stm stringsearch syb text time
      transformers transformers-base transformers-compat
      unordered-containers utf8-string vector wai wai-websockets warp
      websockets
    ];
    testHaskellDepends = [
      aeson aeson-better-errors ansi-terminal base base-compat blaze-html
      bower-json boxes bytestring Cabal cheapskate clock containers
      data-ordlist deepseq directory dlist edit-distance file-embed
      filepath fsnotify Glob haskeline hspec hspec-discover HUnit
      language-javascript lifted-base microlens-platform monad-control
      monad-logger mtl parallel parsec pattern-arrows process protolude
      regex-tdfa safe scientific semigroups sourcemap split stm
      stringsearch syb tasty tasty-hspec text time transformers
      transformers-base transformers-compat unordered-containers
      utf8-string vector
    ];
    testToolDepends = [ hspec-discover ];
    doCheck = false;
    homepage = "http://www.purescript.org/";
    description = "PureScript Programming Language Compiler";
    license = stdenv.lib.licenses.bsd3;
  }
) {}
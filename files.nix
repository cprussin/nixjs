"$(find . -name '*.nix' $(printf '! -path %s ' $(cat .checkignore)))"

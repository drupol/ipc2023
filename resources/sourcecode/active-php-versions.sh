#!/usr/bin/env nix-shell
#! nix-shell -i bash --pure
#! nix-shell -p bash cacert curl jq
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/01441e14af5e29c9d27ace398e6dd0b293e25a54.tar.gz

curl -s https://www.php.net/releases/active | jq -r .[].[].version

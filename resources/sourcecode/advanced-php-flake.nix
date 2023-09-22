{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.nix-shell.url = "github:loophp/nix-shell";

  outputs = { self, nixpkgs, nix-shell }: {
    devShells.x86_64-linux.default = let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [ nix-shell.overlays.default ];
        };
      in pkgs.mkShellNoCC {
        name = "php81-devshell";

        packages = let
          php = pkgs.api.buildPhpFromComposer {
            php = pkgs.php81;
            src = self;
          };
        in [
          php
          php.packages.composer
          pkgs.cowsay
        ];
      };
  };
}

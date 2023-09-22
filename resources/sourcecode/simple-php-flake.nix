{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default = let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in pkgs.mkShellNoCC {
        name = "php81-devshell";

        buildInputs = [
          pkgs.php81
          pkgs.php81.packages.composer
        ];
      };
  };
}

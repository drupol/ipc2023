{ pkgs ? (import <nixpkgs> {}) }:

pkgs.mkShell {
  packages = [
    pkgs.php
    pkgs.php.packages.composer
  ];
}

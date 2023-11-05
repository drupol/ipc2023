{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShellNoCC {
  packages = [
    pkgs.vhs
    pkgs.php.packages.composer
    pkgs.tmux
    pkgs.asciinema
  ];
}

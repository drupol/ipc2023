{ pkgs ? import <nixpkgs> {} }:

pkgs.writeShellApplication {
  name = "run-scenario";

  runtimeInputs = [
    pkgs.vhs
    pkgs.php.packages.composer
    pkgs.tmux
    pkgs.asciinema
  ];

  text = ''
    vhs "$@"
    rm ./*.gif
  '';
}

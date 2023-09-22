{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildLayeredImage {
  name = "Composer";
  tag = pkgs.php.packages.composer.version;
  config = {
    Entrypoint = [ "${pkgs.php.packages.composer}/bin/composer" ];
  };
  extraCommands = "mkdir -m 0777 tmp";
}

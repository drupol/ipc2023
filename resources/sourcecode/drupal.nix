{ pkgs ? (import <nixpkgs> {}) }:
{
  drupal = pkgs.php.buildComposerProject {
    pname = "drupal";
    version = "11.0.0-dev";

    src = pkgs.fetchFromGitHub {
      owner = "drupal";
      repo = "drupal";
      rev = "72e7c019993f7d8491de277c66f40354a0967b00";
      hash = "sha256-nrR+jj8wCTN2RLWxik19emEGyVqzoBiUo6aAfNQZG8Q=";
    };

    vendorHash = "sha256-39cCLG4x8/C9XZG2sOCpxO1HUsqt3DduCMMIxPCursw=";
  };
}

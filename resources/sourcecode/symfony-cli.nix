{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "symfony-cli";
  version = "5.5.6";

  src = fetchFromGitHub {
    owner = "symfony-cli";
    repo = "symfony-cli";
    rev = "v${version}";
    hash = "sha256-lE8RBjBXucL0DJjEnBLbHqOVE6g358rwmaEUqU6QhOw=";
  };

  vendorHash = "sha256-AfgDsd4W8wV0GeymD9SLeHtOeFP9qbFy+GTdMxQSkDA=";
}

{ rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "pdfpc-extractor";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "andreasKroepelin";
    repo = "polylux";
    rev = "v${version}";
    hash = "sha256-jErxl2s2xez2huUwpsT6N1pZANvuZMdIt4taFOurCtU=";
  };

  sourceRoot = "${src.name}/pdfpc-extractor";

  cargoHash = "sha256-VTJRfDFprKIrwfw5lU9/RnDuGLQ7nXBEc/dms5YVupM=";

  meta.mainProgram = "polylux2pdfpc";
}

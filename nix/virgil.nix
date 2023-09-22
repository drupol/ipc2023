{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "virgil";
  version = "0.16.1";

  src = fetchFromGitHub {
    owner = "excalidraw";
    repo = "excalidraw";
    rev = "5b94cffc74668c59dbc00c11b780774c6b97e7a4";
    hash = "sha256-ey7qROQ7a5j0r4T6nlJP21zeXv67/qlOB5vPCqAVZAY=";
  };

  installPhase = ''
    runHook preInstall

    install -D $src/public/FG_Virgil.ttf $out/share/fonts/truetype/FG_Virgil.ttf

    runHook postInstall
  '';
})

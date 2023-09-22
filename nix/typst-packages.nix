{ stdenvNoCC
, src
}:

stdenvNoCC.mkDerivation {
  inherit src;

  name = "typst-packages";

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/typst/packages
    cp -r packages/preview $out/typst/packages/

    runHook postInstall
  '';
}

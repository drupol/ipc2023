{
  description = "IPC 2023 document";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    typst-dev.url = "github:typst/typst";
    typst-packages = {
      flake = false;
      url = "github:typst/packages";
    };
  };

  outputs = inputs @ { self, flake-parts, typst-dev, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = import inputs.systems;

    perSystem = { config, self', inputs', pkgs, system, lib, ... }:
      let
        typst-packages = pkgs.callPackage ./nix/typst-packages.nix { src = inputs.typst-packages; };
        pdfpc-extractor = pkgs.callPackage ./nix/pdfpc-extractor.nix { };
        virgil = pkgs.callPackage ./nix/virgil.nix { };

        fontsConf = pkgs.symlinkJoin {
          name = "typst-fonts";
          paths = [
            pkgs.iosevka
            pkgs.inconsolata-nerdfont
            virgil
          ];
        };

        mkBuildDocumentDrv = documentName: pkgs.stdenvNoCC.mkDerivation {
          name = "build-" + documentName;

          src = pkgs.lib.cleanSource ./.;

          buildInputs = [
            pkgs.typst-dev
            pdfpc-extractor
          ];

          XDG_CACHE_HOME = typst-packages;

          buildPhase = ''
            runHook preBuild

            ${lib.getExe pkgs.typst-dev} \
              compile \
              --root ./. \
              --font-path ${fontsConf} \
              ./src/${documentName}/main.typ \
              ${documentName}.pdf

            ${lib.getExe pdfpc-extractor} \
              --root ./. \
              ./src/${documentName}/main.typ

            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall

            mkdir -p $out
            cp ${documentName}.* $out/

            mv ./src/${documentName}/main.pdfpc $out/${documentName}.pdfpc

            runHook postInstall
          '';
        };

        mkBuildDocumentScript = documentName: pkgs.writeShellApplication {
          name = "build-${documentName}";
          runtimeInputs = [
            pkgs.typst-dev
            pdfpc-extractor
          ];

          text = ''
            export XDG_CACHE_HOME=${typst-packages}

            ${lib.getExe pkgs.typst-dev} \
              compile \
              --root ./. \
              --font-path ${fontsConf} \
              ./src/${documentName}/main.typ \
              ${documentName}.pdf

            ${lib.getExe pdfpc-extractor} \
              --root ./. \
              ./src/${documentName}/main.typ

            mv ./src/${documentName}/main.pdfpc ${documentName}.pdfpc
          '';
        };

        mkWatchDocumentScript = documentName: pkgs.writeShellApplication {
          name = "watch-${documentName}";
          runtimeInputs = [
            pkgs.typst-dev
            pdfpc-extractor
          ];
          text = ''
            export XDG_CACHE_HOME=${typst-packages}

            ${lib.getExe pkgs.typst-dev} \
              watch \
              --root ./. \
              --font-path ${fontsConf} \
              ./src/${documentName}/main.typ \
              ${documentName}.pdf

            ${lib.getExe pdfpc-extractor} \
              --root ./. \
              ./src/${documentName}/main.typ

            mv ./src/${documentName}/main.pdfpc ${documentName}.pdfpc

            ${pkgs.inotify-tools}/bin/inotifywait --exclude '\.pdf|\.git' -qre close_write .; \
          '';
        };

        documentNames = (lib.attrNames (lib.filterAttrs (k: v: (v == "directory")) (builtins.readDir ./src)));

        documentDrvs = lib.foldl'
          (a: i: a // {
            "${i}" = mkBuildDocumentDrv i;
          })
          { }
          documentNames;

        scriptDrvs = lib.foldl'
          (a: i: a // {
            "build-${i}" = mkBuildDocumentScript i;
            "watch-${i}" = mkWatchDocumentScript i;
          })
          { }
          documentNames;
      in
      {
        _module.args.pkgs = import self.inputs.nixpkgs {
          inherit system;
          overlays = [
            typst-dev.overlays.default
          ];
        };

        formatter = pkgs.nixpkgs-fmt;

        packages = documentDrvs;

        devShells.default = pkgs.mkShellNoCC {
          name = "typst-devshell";
          buildInputs = (lib.attrValues scriptDrvs) ++ [
            pkgs.pdfpc
            pkgs.typst-dev
            pkgs.typst-fmt
            pdfpc-extractor
            typst-packages
            pkgs.asciinema
            pkgs.asciinema-agg
            pkgs.gnuplot
          ];
        };
      };
  };
}

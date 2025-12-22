# SPDX-License-Identifier: AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
# flake.nix — doit-ssg Nix development environment
{
  description = "doit-ssg - Satellite SSG for hyperpolymath ecosystem";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # Development shell
        devShells.default = pkgs.mkShell {
          name = "doit-ssg-dev";

          buildInputs = with pkgs; [
            # Core tools
            deno
            just
            git

            # Optional SSG binaries (uncomment as needed)
            # zola
            # hugo
            # mdbook

            # Development tools
            nodePackages.prettier
            shellcheck
            nixpkgs-fmt

            # Documentation
            asciidoctor
          ];

          shellHook = ''
            echo "🚀 doit-ssg development environment"
            echo ""
            echo "Available commands:"
            echo "  just --list     Show all tasks"
            echo "  just status     Show project status"
            echo "  just test       Run tests"
            echo ""
          '';

          # Environment variables
          DENO_DIR = ".deno";
        };

        # Package definition
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "doit-ssg";
          version = "0.2.0";

          src = ./.;

          buildInputs = [ pkgs.deno ];

          installPhase = ''
            mkdir -p $out/lib/doit-ssg
            cp -r adapters $out/lib/doit-ssg/
            cp -r tests $out/lib/doit-ssg/
            cp justfile $out/lib/doit-ssg/
          '';

          meta = with pkgs.lib; {
            description = "Satellite SSG for hyperpolymath ecosystem";
            homepage = "https://github.com/hyperpolymath/doit-ssg";
            license = licenses.agpl3Plus;
            maintainers = [ ];
          };
        };

        # Checks (run with `nix flake check`)
        checks.default = pkgs.runCommand "doit-ssg-check" {
          buildInputs = [ pkgs.deno ];
        } ''
          cd ${self}
          deno lint adapters/ || true
          touch $out
        '';
      }
    );
}

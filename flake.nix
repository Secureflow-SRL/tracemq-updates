{
  description = "TraceMQ development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            permittedInsecurePackages = [
              "webkitgtk-2.44.2"
            ];
          };
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go_1_24
            nodejs_20
            pkg-config
            gtk3
            webkitgtk_4_1
            libayatana-appindicator
            gobject-introspection
          ];

          shellHook = ''
            export GOTOOLCHAIN=auto
            echo "TraceMQ Dev Environment"
            echo "Go: $(go version)"
            echo "Node: $(node --version)"
          '';
        };
      }
    );
}

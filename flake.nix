{
    description = "A latex docker flake configuration";
  
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs";
        docker-flake.url = "github:ajahl/docker-flake";
        docker-flake.flake = true;
    };

    outputs = { self, nixpkgs, docker-flake }:

    let
        system = "x86_64-darwin";
        pkgs = nixpkgs.legacyPackages.${system};

    in {
      devShells.${system}.default = 
          docker-flake.devShell.${system}.overrideAttrs (oldAttrs: {

          buildInputs = oldAttrs.buildInputs ++ [
            pkgs.git
          ];

        shellHook = oldAttrs.shellHook + ''
            if [ -z "$WORKSPACE_PATH" ]; then
                export WORKSPACE_PATH="$PWD"
            fi
            echo "Start docker vscode environment in $WORKSPACE_PATH"
            code .
            '';
        });
    };
}
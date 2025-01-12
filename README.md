# LaTeX in Docker - VS Code LaTeX Docker Flake

The flake provides a LaTeX environment setup based on TeXLive.
It utilizes ```github:ajahl/docker-flake``` to install the required Docker environment.

> [!NOTE]  
> The project is a work in progress and is currently only usable on macOS.

The flake uses github:ajahl/docker-flake to install the required docker environment.

## Getting started

With flakes enabled
```console
WORKSPACE_PATH=<workspace-path> nix develop github:ajahl/latex-docker
```

With cloned repo 
```console
WORKSPACE_PATH=<workspace-path> nix develop
```

Update the flake
```console
nix flake update
```
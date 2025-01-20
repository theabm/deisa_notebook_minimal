{
  description = "Dask Playground Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        (pkgs.python3.withPackages (pp: [
          pp.dask
          pp.distributed
          pp.dask-ml

          # for Dask Dashboard
          pp.bokeh

          # for jupyter notebook (basics, for more advanced use jupyenv)
          pp.ipython
          pp.jupyter

          # graph visualization
          pp.graphviz
        ]))
      ];
    };
  };
}

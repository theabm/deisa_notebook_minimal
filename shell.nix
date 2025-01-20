let
  pkgs =
    import
    (
      fetchTarball
      "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz"
    ) {};
in {
  # "pure" nixpkgs version. Simplest to use and recommended unless you have to use
  # the latest bleeding edge or something not available on nixpkgs.
  nix-pure = pkgs.mkShell {
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
    shellHook = ''
      echo "Welcome to a pure nix python shell! -- WARNING: do not use pip."
    '';
  };
}

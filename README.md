# fcidecomp-conda-recipe
Conda recipe to build the FCIDECOMP HDF5 filter

Once the package is installed, but sure to export a couple environment variables:
```shell
export HDF5_PLUGIN_PATH=$HDF5_PLUGIN_PATH:$CONDA_PREFIX/hdf5/lib/plugin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib
```

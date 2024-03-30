
# Call this to enable GPU processing, once you've installed all the required components.
# See cuda_readme.md
CUDNN_PATH=$(dirname $(python -c "import nvidia.cudnn;print(nvidia.cudnn.__file__)"))
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/:$CUDNN_PATH/lib:/usr/lib/wsl/lib/

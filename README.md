# Keras' Deep Q-Learning for Atari Breakout as a standalone project

Forked from [here (Keras GitHub)](https://github.com/keras-team/keras-io/blob/master/examples/rl/deep_q_network_breakout.py)

## Setup
 > **IMPORTANT**: This does NOT work for Python 3.12, some dependencies are not available (like `ale-py`). Python 3.11 is verified to work.

Run the following the first time after you've checked out the repo and every
time you check it out to ensure you have the latest dependencies:
```
python -m venv venv
. venv/bin/activate
pip install -r requirements.txt
```

## Running on the CPU
To run the training on the CPU, simply call:
```
python deep_q_network_breakout.py
```

## Running on the GPU
I have tested this on both Windows/WSL2  with an x86/nvidia setup as well as on an Apple Silicon M3 system using
the `tensorflow-metal` plugin. In both setups, the GPU enabled variant performed a lot worse.
But since I went through it, the following sections have details on how to enable GPU support.

### Enabling Metal support on Apple Silicon
This couldn't be simpler. After you have set up the project as described above, install just one more package:

```
pip install tensorflow-metal
```

That's it. Simply re-run the script and you will see log lines showing you that Metal support is being used.

### Enabling Tensorflow/CUDA/GPU support through WSL2
For me this ended up working, but the training speed was a lot slower than the
CPU version. Even when running on a native Linux install, the results where the
same.

#### Inside Ubuntu 22 on WSL2
 - Install CUDA 11.8 (Not 12.X or a higher version, which doesn't seem to work!)
 - Follow https://www.tensorflow.org/install/pip#windows-wsl2
  - Don't use conda, but venv.
 - Follow this for 11.8: https://developer.nvidia.com/cuda-11-8-0-download-archive?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local
   - Instead of install cuda at the end, install cuda-11-8
    - See https://askubuntu.com/questions/1394352/force-cuda-toolkit-version-11-6-in-ubuntu-18-04-latest-in-repos-is-9-1

#### GPU Setup
Set the environment variables so that python can find CUDA and use it:
```
. env_vars.sh
```

Then run the script just as before:
```
python deep_q_network_breakout.py
```

#### How do I know it is using the GPU
 - On the command line, you should NOT see `Skipping registering GPU devices...` and instead something like:</br>
 ```I tensorflow/core/common_runtime/gpu/gpu_device.cc:1928] Created device /job:localhost/replica:0/task:0/device:GPU:0 with 9298 MB memory:  -> device: 0, name: NVIDIA GeForce RTX 3080 Ti, pci bus id: 0000:0b:00.0, compute capability: 8.6```

 - Furthermore, take a look at your task manager. You should your GPU doing work and
   having a lot of GPU memory occupied.

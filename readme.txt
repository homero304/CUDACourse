requirements:
  Ubuntu 20.04 OS
  install Cuda 11.0 - reference: https://docs.nvidia.com/cuda/
  NVIDIA compatible GPU
    To check GPU:
      short info: lspci | grep VGA
      detailed info: sudo lshw -C video 

# set executable permission to helper scripts
chmod +x ./compile
chmod +x ./run

save code.cu files in src folder
to compile run$ ./compile filename  # without the extension
to execute run$ ./run filename # without the extension

Please feel free to open an issue with suggestions on how to improve this repo.

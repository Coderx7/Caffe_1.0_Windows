@echo off
echo Downloading CUDA toolkit 9 ...
appveyor DownloadFile  https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_windows-exe -FileName cuda_9.0.176_windows.exe
echo Installing CUDA toolkit 9 ...
cuda_9.0.176_windows.exe -s compiler_9.0 ^
                           cublas_9.0 ^
                           cublas_dev_9.0 ^
                           cudart_9.0 ^
                           curand_9.0 ^
                           curand_dev_9.0 ^
                           nvml_dev_9.0
:: Add CUDA toolkit to PATH
set PATH=%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v9.0\bin;%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v9.0\libnvvp;%PATH%
nvcc -V

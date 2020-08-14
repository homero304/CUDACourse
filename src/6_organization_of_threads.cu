#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void hello_cuda()
{
  printf(" threadIdx.x : %d, threadIdx.y : %d, threadIdx.z : %d\n",
  threadIdx.x, threadIdx.y, threadIdx.z);
}

int main()
{
  int threads_count_in_x_axis;
  threads_count_in_x_axis = 16; 
  int threads_count_in_y_axis;
  threads_count_in_y_axis = 16;
  dim3 block(8, 8); 
  dim3 grid(threads_count_in_x_axis / block.x, threads_count_in_y_axis / block.y); 

  hello_cuda << < grid, block >> > ();
  cudaDeviceSynchronize();
  cudaDeviceReset();
  return 0;
}

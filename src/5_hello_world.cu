#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

// This function will execute in GPU device. A.K.A. Graphics Card
__global__ void hello_cuda()
{
	printf("Hello CUDA world \n");
}

// This function will execute in CPU Host. A.K.A. The Computer
int main()
{
  // Threads are organized in 3D Cartesian coordinates
  // Each block has a number of threads for x, y and z axes
  // The grid has a number of blocks for x, y and z axes
  // Imagine a big cube composed of smaller cubes if x=y=z
  // Or some other shape for x!=y!=z

  // to check thread count limitations in X Y Z for blocks and the grid,
  // compile and run ./deviceQuery from CUDA Samples
	int threads_count_in_x_axis;
	threads_count_in_x_axis = 1; // In this example, we are using only one thread
  // block limitations example -- X <= 1024, Y <= 1024, Z <= 64  --- X * Y * Z <= 1024
  // number of threads per block
	dim3 block(threads_count_in_x_axis); // axes: x, y, z
  // grid limitations example -- X <= 2147483647, Y <= 65535, Z <= 65535 -- X * Y * Z <= 2147483647
  // number of blocks in grid
	dim3 grid(threads_count_in_x_axis / block.x); // axes: x, y, z

  // execute code on GPU
	hello_cuda << < grid, block >> > ();
  // wait for GPU to finish running code
	cudaDeviceSynchronize();
  // Destroy all allocations and reset GPU
	cudaDeviceReset();
	return 0;
}

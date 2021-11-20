#include <iostream>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <curand.h>
#include <ctime>

using namespace std;

__global__ void runningSum(int *d)
{
    int threads = blockDim.x;
    int tid = threadIdx.x;

    for (int tc = threads, step = 1; tc > 0; step *= 2)
    {
        if (tid < tc)
        {
            d[tid + step] += d[tid];
        }
        tc -= step;
    }

}

int main()
{
    int const count = 16;
    int const size = count * sizeof(int);
    int h[count];
    for (int i = 0; i < count; ++i)
    {
        h[i] = i + 1;
    }

    int *d;
    cudaMalloc(&d, size);
    cudaMemcpy(d, h, size, cudaMemcpyHostToDevice);

    runningSum<<<1, count - 1>>>(d);
    cudaMemcpy(h, d, size, cudaMemcpyDeviceToHost);

    for (int i = 0; i < count; ++i)
    {
        cout << h[i] << "\t";
    }

    cudaFree(d);

    return 0;
}

#include <iostream>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <curand.h>
#include <ctime>

using namespace std;

__global__ void sumSingleBlock(int *d)
{
    auto tid = threadIdx.x;

    for (int tc = blockDim.x, stepSize = 1; tc > 0; tc >>= 1, stepSize <<= 1)
    {
        if (tid < tc)
        {
            int pa = tid * stepSize * 2;
            int pb = pa + stepSize;
            d[pa] += d[pb];
        }
    }
}

int main()
{
    int const count = 512;
    int const size = count * sizeof(int);
    int h[count];

    for (int i = 0; i < count; ++i)
    {
        h[i] = i + 1;
    }

    int *d;
    cudaMalloc(&d, size);
    cudaMemcpy(d, h, size, cudaMemcpyHostToDevice);

    sumSingleBlock<<<1, count / 2>>>(d);

    int res;
    cudaMemcpy(&res, d, sizeof(int), cudaMemcpyDeviceToHost);
    cout<<"Sum is: "<<res<<endl;
    cudaFree(d);
    return 0;
}
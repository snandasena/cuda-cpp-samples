#include <iostream>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void addArr(int const *a, int const *b, int *c) // CUDA kernel
{
    auto i = threadIdx.x;
    c[i] = a[i] + b[i];
}

int main()
{
    int const cont = 5;
    int const size = cont * sizeof(int);

    int ha[] = {1, 2, 3, 4, 5};
    int hb[] = {10, 20, 30, 40, 50};
    int hc[cont];

    int *da, *db, *dc;
    cudaMalloc(&da, size);
    cudaMalloc(&db, size);
    cudaMalloc(&dc, size);

    cudaMemcpy(da, ha, size, cudaMemcpyHostToDevice);
    cudaMemcpy(db, hb, size, cudaMemcpyHostToDevice);

    addArr<<<1, cont>>>(da, db, dc);
    cudaMemcpy(hc, dc, size, cudaMemcpyDeviceToHost);
    for (int i = 0; i < cont; ++i)
    {
        printf("%d ", hc[i]);
    }
    return 0;
}

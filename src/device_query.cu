#include <iostream>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

using namespace std;

int main()
{
    int cont;
    cudaGetDeviceCount(&cont);
    cout << cont << endl;
    cudaDeviceProp prop;
    for (int i = 0; i < cont; ++i)
    {
        cudaGetDeviceProperties(&prop, i);
        cout << "Device name: " << prop.name << endl;
        cout << "Compute capabilities: " << prop.major << "." << prop.minor << endl;

        cout << "Max grid dimensions (" << prop.maxGridSize[0] << " X " << prop.maxGridSize[1] << " X "
             << prop.maxGridSize[2] << ")\n";

        cout << "Max block dimensions (" << prop.maxThreadsDim[0] << " X " << prop.maxThreadsDim[1] << " X "
             << prop.maxThreadsDim[2] << ")\n";

    }
    return 0;
}
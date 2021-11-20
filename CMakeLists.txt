cmake_minimum_required(VERSION 3.19)
project(cudaproject CUDA)

set(CMAKE_CUDA_STANDARD 14)
set(CUDA_LIBS PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

add_executable(cudaproject src/main.cu)
set_target_properties(cudaproject ${CUDA_LIBS})

add_executable(devicequery src/device_query.cu)
set_target_properties(devicequery ${CUDA_LIBS})

add_executable(mapdemo src/map_demo.cu)
set_target_properties(mapdemo ${CUDA_LIBS})
target_link_libraries(mapdemo -lcurand)


add_executable(reduce src/reduce.cu)
set_target_properties(reduce ${CUDA_LIBS})
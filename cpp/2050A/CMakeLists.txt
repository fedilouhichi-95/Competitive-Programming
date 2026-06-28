cmake_minimum_required(VERSION 3.10)
project(cpp_2050A)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(ENABLE_DEBUG "Enable debug macros" OFF)
if(ENABLE_DEBUG)
    add_definitions(-DDEBUG)
endif()

add_executable(cpp_2050A main.cpp)
target_compile_options(cpp_2050A PRIVATE -Wall -Wextra -Wshadow)

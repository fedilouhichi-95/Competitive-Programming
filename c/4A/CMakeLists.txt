cmake_minimum_required(VERSION 3.10)
project(c_4A C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

option(ENABLE_DEBUG "Enable debug macros" OFF)
if(ENABLE_DEBUG)
    add_definitions(-DDEBUG)
endif()

add_executable(c_4A main.c)
target_compile_options(c_4A PRIVATE -Wall -Wextra -Wshadow)

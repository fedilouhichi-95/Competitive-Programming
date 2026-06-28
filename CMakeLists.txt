cmake_minimum_required(VERSION 3.10)
project(Competitive_Programming)

# ─── Global settings ────────────────────────────────────────
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ─── Debug mode ─────────────────────────────────────────────
option(ENABLE_DEBUG "Enable debug macros (assertions + dbg output)" OFF)
if(ENABLE_DEBUG)
    add_definitions(-DDEBUG)
endif()

# ─── Sanitizers (CLion profile: Debug-Sanitizers) ───────────
option(ENABLE_SANITIZERS "Enable ASan + UBSan" OFF)
if(ENABLE_SANITIZERS)
    set(SAN_FLAGS "-fsanitize=address,undefined -fno-omit-frame-pointer")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SAN_FLAGS}")
    set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   ${SAN_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${SAN_FLAGS}")
endif()

# ─── Compiler warnings ─────────────────────────────────────
add_compile_options(-Wall -Wextra -Wshadow -Wno-unused-result)

# ─── Auto-discover C++ problems ─────────────────────────────
file(GLOB CPP_PROBLEMS cpp/*/CMakeLists.txt)
foreach(CMAKELISTS_PATH ${CPP_PROBLEMS})
    get_filename_component(PROB_DIR ${CMAKELISTS_PATH} DIRECTORY)
    add_subdirectory(${PROB_DIR})
endforeach()

# ─── Auto-discover C problems ───────────────────────────────
file(GLOB C_PROBLEMS c/*/CMakeLists.txt)
foreach(CMAKELISTS_PATH ${C_PROBLEMS})
    get_filename_component(PROB_DIR ${CMAKELISTS_PATH} DIRECTORY)
    add_subdirectory(${PROB_DIR})
endforeach()

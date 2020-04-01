#/* !@file CMakeLists.txt

CMAKE_MINIMUM_REQUIRED(VERSION 3.10)

file(TO_CMAKE_PATH "$ENV{SOLUTION_DIR}" SOLUTION_DIR)
file(TO_CMAKE_PATH "$ENV{BIN_DIR}" BIN_DIR)

SET(EXECUTABLE_OUTPUT_PATH  ${BIN_DIR})

MESSAGE(STATUS "**************************************************************************")
MESSAGE(STATUS "SOLUTION_DIR=${SOLUTION_DIR}")
MESSAGE(STATUS "BIN_DIR=${BIN_DIR}")
MESSAGE(STATUS "**************************************************************************")

# static build
#SET(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
#SET(BUILD_SHARED_LIBS OFF)
#SET(CMAKE_EXE_LINKER_FLAGS "-static")

PROJECT("bdt")

ADD_SUBDIRECTORY(${SOLUTION_DIR}/src src)

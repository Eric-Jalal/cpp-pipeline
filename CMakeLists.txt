cmake_minimum_required(VERSION 3.10)
project(CPP-Test-App VERSION 1.0)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

add_executable(main main.cpp)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/release-1.10.0.zip
)

# Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()
add_executable(
  main_test
  tests/main_test.cpp
)

target_link_libraries(
  main_test
  gtest_main
)

include(GoogleTest)
gtest_discover_tests(main_test)

option(ENABLE_COVERAGE "Enable coverage reporting" OFF)

# Enable coverage report
if(ENABLE_COVERAGE)
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")
endif()



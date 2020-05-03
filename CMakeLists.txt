## BSD 3-Clause License
#
# Copyright (c) 2020, bodand
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## CMake shenanigans
cmake_minimum_required(VERSION 3.14)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

## Project options
option(LIBREX_BUILD_TESTS "Build the InfoGrammatik test suite [On]" On)

project(librex
        VERSION 0.1.0
        LANGUAGES CXX)

## Project settings
set(INFO_PROJECT_NAME librex)
set(INFO_PROJECT_NAMESPACE info::librex)

## Debug flags
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -D_GLIBCXX_DEBUG")

## Require C++20
set(CMAKE_CXX_STANDARD 20)

## Project level macros
set(${INFO_PROJECT_NAME}_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include")
set(${INFO_PROJECT_NAME}_HEADER_PATH "${${INFO_PROJECT_NAME}_INCLUDE_DIR}/librex")
set(${INFO_PROJECT_NAME}_TARGET rex)

## Initialize target
add_library(${${INFO_PROJECT_NAME}_TARGET} INTERFACE)
add_library(info::librex ALIAS ${${INFO_PROJECT_NAME}_TARGET})

# Check for required features and
#  applicable warnings
include(FeatureTests)

# Add warnings
target_compile_options(${${INFO_PROJECT_NAME}_TARGET}
                       INTERFACE
                       ${${INFO_PROJECT_NAME}_WARNINGS})

# Dependencies
include(Dependencies)

## Get dependencies
target_link_libraries(${${INFO_PROJECT_NAME}_TARGET}
                      INTERFACE
                      info::utils
                      )

## Set target properties
target_include_directories(${${INFO_PROJECT_NAME}_TARGET}
                           INTERFACE
                           $<INSTALL_INTERFACE:include>
                           $<BUILD_INTERFACE:${${INFO_PROJECT_NAME}_INCLUDE_DIR}>
                           )

## Optionally enable tests
if (LIBREX_BUILD_TESTS)
    add_subdirectory(test)
endif ()


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


## CMake dependency manager capabilities
include(FetchContent)
message(STATUS "Registering dependencies")

FetchContent_Declare( # Info utility library
        InfoUtils
        GIT_REPOSITORY https://github.com/isbodand/InfoUtils.git
        GIT_TAG v1.3.1
        )

message(STATUS "Registering dependencies - done")

## Dependencies
## Test dependencies
if (LIBREX_BUILD_TESTS)
    message(STATUS "Registering test dependencies")

    FetchContent_Declare( # Pulls in Boost
            Boost-CMake
            GIT_REPOSITORY https://github.com/Orphis/boost-cmake.git
            # USE MASTER
            )

    message(STATUS "Registering test dependencies - done")
endif ()

## Get dependencies
message(STATUS "Getting dependencies")

FetchContent_MakeAvailable(InfoUtils)

message(STATUS "Getting dependencies - done")

## Get test dependencies
if (LIBREX_BUILD_TESTS)
    message(STATUS "Getting test dependencies")

    FetchContent_MakeAvailable(Boost-CMake)

    message(STATUS "Getting test dependencies - done")
endif ()


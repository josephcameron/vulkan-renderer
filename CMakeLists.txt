# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-10.

cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

option(JFC_BUILD_TESTS "Build unit tests" ON)
set(JFC_TARGET_PLATFORM "${CMAKE_HOST_SYSTEM_NAME}" CACHE STRING "Platform to compile the project for")

set(JFC_CXX_COMPILER_FEATURE_REQUIREMENTS PRIVATE
    cxx_variadic_templates
    cxx_nullptr
    cxx_lambdas)

add_subdirectory(tests)
add_subdirectory(thirdparty)
add_subdirectory(shaders)
add_subdirectory(src)

get_cmake_property(_variableNames VARIABLES)
list (SORT _variableNames)
foreach (_variableName ${_variableNames})
    message(STATUS "${_variableName}=${${_variableName}}")
endforeach()
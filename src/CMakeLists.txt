# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-10.

include("${CMAKE_SOURCE_DIR}/cmake/jfclib.cmake")

project("Vulkan-Renderer"
    VERSION "1.0" 
    DESCRIPTION "executable demo using the Vulkan API to draw 3D graphics")

add_executable(${PROJECT_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${glfw_INCLUDE_DIR}
    ${glm_INCLUDE_DIR}
    ${stb_INCLUDE_DIR}
    ${tinyobjloader_INCLUDE_DIR})

target_link_libraries(${PROJECT_NAME}
    ${glfw_LIBRARIES})

set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build)

target_compile_features(${PROJECT_NAME} 
    ${JFC_CXX_COMPILER_FEATURE_REQUIREMENTS})

if(JFC_AUTO_RUN_APP)
    add_custom_command (TARGET ${PROJECT_NAME} POST_BUILD 
        COMMAND ${PROJECT_NAME}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/build COMMENT "Automatically running ${PROJECT_NAME}" VERBATIM)
else()
    jfc_log(STATUS "Auto Run" "Skipping auto run.")
endif()

# Format source files
function(jfc_format_c_cpp_source_recursive)
    find_program(FORMATTER clang-format)

    if(NOT FORMATTER)
        jfc_log(FATAL_ERROR ${TAG} "clang-format not found! It is required to format the source code.")
    else()
        file(GLOB_RECURSE JFC_SOURCES
            *.h *.hpp
            *.cpp *.cxx
            *.c)

            set(TAG "Code formatting stage")

        foreach(JFC_SOURCE ${JFC_SOURCES})
            execute_process(COMMAND clang-format -i ${JFC_SOURCE}
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
                RESULT_VARIABLE FORMATTER_RETURN_VALUE
                OUTPUT_VARIABLE FORMATTER_ERRORS)

            get_filename_component(JFC_SOURCE_NAME ${JFC_SOURCE} NAME)

            if(FORMATTER_RETURN_VALUE)
                jfc_log(FATAL_ERROR ${TAG} "\"${JFC_SOURCE_NAME}\" failed to format: ${FORMATTER_ERRORS}")
            else()
                jfc_log(STATUS ${TAG} "\"${JFC_SOURCE_NAME}\" successfully formatted")
            endif()
        endforeach()
    endif()
endfunction()
jfc_format_c_cpp_source_recursive()

# Generated header
function(jfc_generate_cmake_header)
    string(RANDOM LENGTH 15 JFC_RANDOM_128BITS)
    string(TOUPPER ${JFC_TARGET_PLATFORM} JFC_TARGET_PLATFORM)

    execute_process(COMMAND git rev-parse HEAD 
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
        OUTPUT_VARIABLE JFC_GIT_COMMIT_HASH OUTPUT_STRIP_TRAILING_WHITESPACE)

    execute_process(COMMAND git log -1 --format=%cd --date=local HEAD 
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
        OUTPUT_VARIABLE JFC_GIT_COMMIT_DATE OUTPUT_STRIP_TRAILING_WHITESPACE)

    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake.h.in 
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake.h @ONLY)
endfunction()
jfc_generate_cmake_header()

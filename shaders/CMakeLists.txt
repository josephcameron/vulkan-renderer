# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-13.

include("${PROJECT_SOURCE_DIR}/cmake/jfclib.cmake")

set(TAG "Shader compiling stage")

find_program(GLSL_COMPILER glslangValidator)

if(NOT GLSL_COMPILER)
    jfc_log(FATAL_ERROR ${TAG} "glslangValidator not found! It is required to compile GLSL source to SPIR-V.")
endif()

file(GLOB_RECURSE GLSL_SOURCE_FILES 
    *.vert *.tesc *.tese *.geom *.frag *.comp)

foreach(GLSL ${GLSL_SOURCE_FILES})
    get_filename_component(FILE_NAME ${GLSL} NAME)

    set(SPIRV "${PROJECT_SOURCE_DIR}/build/shaders/${FILE_NAME}.spv")

    make_directory("${PROJECT_SOURCE_DIR}/build/shaders/")

    execute_process(COMMAND ${GLSL_COMPILER} -V ${GLSL} -o ${SPIRV}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        RESULT_VARIABLE GLSL_COMPILER_RETURN_VALUE
        OUTPUT_VARIABLE GLSL_COMPILER_ERRORS)

    if (GLSL_COMPILER_RETURN_VALUE)
        jfc_log(FATAL_ERROR ${TAG} "\"${FILE_NAME}\" failed to compile: ${GLSL_COMPILER_ERRORS}")
    else()
        jfc_log(STATUS ${TAG} "\"${FILE_NAME}\" successfully compiled")
    endif()
endforeach(GLSL)

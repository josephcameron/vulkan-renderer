# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-16.

include("${CMAKE_SOURCE_DIR}/cmake/jfclib.cmake")

set(TAG "Documentation")

find_program(DOXYGEN doxygen)

if(NOT DOXYGEN)
    jfc_log(FATAL_ERROR ${TAG} "doxygen not found! It is required to generate documentation.")
else()
    execute_process(COMMAND git rev-parse HEAD 
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
        OUTPUT_VARIABLE JFC_GIT_COMMIT_HASH OUTPUT_STRIP_TRAILING_WHITESPACE)

    execute_process(COMMAND git rev-parse --show-toplevel
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
        OUTPUT_VARIABLE JFC_GIT_REPO_NAME OUTPUT_STRIP_TRAILING_WHITESPACE)
    get_filename_component(JFC_GIT_REPO_NAME "${JFC_GIT_REPO_NAME}" NAME)

    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/.config/doxy.config.in 
        ${CMAKE_CURRENT_SOURCE_DIR}/doxy.config @ONLY)

    execute_process(COMMAND ${DOXYGEN} doxy.config
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        RESULT_VARIABLE DOXYGEN_RETURN_VALUE
        OUTPUT_VARIABLE DOXYGEN_ERRORS)

    if (DOXYGEN_RETURN_VALUE)
        jfc_log(FATAL_ERROR ${TAG} "Doxygen failed: ${DOXYGEN_ERRORS}")
    else()
        jfc_log(STATUS ${TAG} "Doxygen successfully completed")
    endif()
endif()

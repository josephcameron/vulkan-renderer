# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-16.

include("${CMAKE_SOURCE_DIR}/cmake/jfclib.cmake")

set(TAG "Documentation")

function(jfc_generate_docs)
    #[[! Generate README.md ]]
    function(jfc_generate_readmemd)
        jfc_log(WARNING ${TAG} "Readme gen is unimplemented.")
    endfunction()
    jfc_generate_readmemd()

    #[[! Generate src docs using doxygen ]]
    function(jfc_generate_doxygen_docs)
        find_program(DOXYGEN doxygen)

        if(NOT DOXYGEN)
            jfc_log(FATAL_ERROR ${TAG} "doxygen not found! It is required to generate documentation.")
        else()
            set(DOXY_CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
            set(DOXY_CONFIG_FILENAME "doxy.config")

            execute_process(COMMAND git rev-parse HEAD 
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
                OUTPUT_VARIABLE JFC_GIT_COMMIT_HASH OUTPUT_STRIP_TRAILING_WHITESPACE)

            execute_process(COMMAND git rev-parse --show-toplevel
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
                OUTPUT_VARIABLE JFC_GIT_REPO_NAME OUTPUT_STRIP_TRAILING_WHITESPACE)
            get_filename_component(JFC_GIT_REPO_NAME "${JFC_GIT_REPO_NAME}" NAME)

            configure_file(${DOXY_CONFIG_DIR}/${DOXY_CONFIG_FILENAME}.in 
                ${CMAKE_CURRENT_SOURCE_DIR}/${DOXY_CONFIG_FILENAME} @ONLY)

            execute_process(COMMAND ${DOXYGEN} ${DOXY_CONFIG_FILENAME}
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                RESULT_VARIABLE DOXYGEN_RETURN_VALUE
                OUTPUT_VARIABLE DOXYGEN_ERRORS)

            if (DOXYGEN_RETURN_VALUE)
                jfc_log(FATAL_ERROR ${TAG} "Doxygen failed: ${DOXYGEN_ERRORS}")
            else()
                jfc_log(STATUS ${TAG} "Doxygen successfully completed")
            endif()
        
            file(REMOVE "${CMAKE_CURRENT_SOURCE_DIR}/${DOXY_CONFIG_FILENAME}")
        endif()
    endfunction()

    jfc_generate_doxygen_docs()
endfunction()

if(JFC_BUILD_DOCS)
    jfc_generate_docs()
else()
    jfc_log(STATUS ${TAG} "Skipping documentation.")
endif()

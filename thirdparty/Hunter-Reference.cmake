# © 2017 Joseph Cameron - All Rights Reserved
# Created on 2018-04-10.

function(jfc_load_personal_dependency JFC_DEPENDENCY_NAME JFC_DEPENDENCY_LIBRARIES)
    if((NOT ${JFC_DEPENDENCY_NAME}_INCLUDE_DIR) OR (NOT EXISTS ${${JFC_DEPENDENCY_NAME}_INCLUDE_DIR}))
        message(STATUS "[Library loader] Package \"${JFC_DEPENDENCY_NAME}\" could not be found on the system. Initializing dependency from a submodule.")

        execute_process(COMMAND git submodule update --init -- ${CMAKE_CURRENT_SOURCE_DIR}/${JFC_DEPENDENCY_NAME}
                        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
        
        add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/${JFC_DEPENDENCY_NAME}/")

        set(${JFC_DEPENDENCY_NAME}_INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/${JFC_DEPENDENCY_NAME}/include
            CACHE PATH "${JFC_DEPENDENCY_NAME} include directory" FORCE)

        set(${JFC_DEPENDENCY_NAME}_LIBRARIES ${JFC_DEPENDENCY_LIBRARIES}
            CACHE PATH "${JFC_DEPENDENCY_NAME} output libraries" FORCE)
    else()
        message(STATUS "[Library loader] dependency \"${JFC_DEPENDENCY_NAME}\" already initialized. Skipping")
    endif()
endfunction()

jfc_load_personal_dependency("Hunter-Reference"
    "${CMAKE_CURRENT_LIST_DIR}/Hunter-Reference/build/libHunter-Reference.a;glfw"
)

# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-14.

add_subdirectory(${JFC_DEPENDENCY_NAME})

set(${JFC_DEPENDENCY_NAME}_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/${JFC_DEPENDENCY_NAME}/single_include/"
    CACHE PATH "${JFC_DEPENDENCY_NAME} include directory" FORCE)

set(${JFC_DEPENDENCY_NAME}_LIBRARIES ""
    CACHE PATH "${JFC_DEPENDENCY_NAME} library object list" FORCE)

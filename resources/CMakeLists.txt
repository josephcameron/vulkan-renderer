# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-14.

include("${CMAKE_SOURCE_DIR}/cmake/jfclib.cmake")

function(jfc_export_resource aResourceDirectory)
    set(TAG "Resource exporter")

    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${aResourceDirectory}" AND IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${aResourceDirectory}")
        jfc_log(STATUS ${TAG} "Exporting ${aResourceDirectory}")

        file(COPY "${aResourceDirectory}" 
            DESTINATION ${CMAKE_SOURCE_DIR}/build/)
    else()
        jfc_log(FATAL_ERROR ${TAG} "\"${aResourceDirectory}\" does not exist or is not a directory.")
    endif()
endfunction()

jfc_export_resource("models")
jfc_export_resource("textures")

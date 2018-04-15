# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-14.

include("${CMAKE_SOURCE_DIR}/cmake/jfclib.cmake")

set(TAG "Resource exporter")

function(jfc_export_resource aResourceDirectory)
    jfc_log(STATUS ${TAG} "Exporting ${aResourceDirectory}")

    file(COPY "${aResourceDirectory}" 
        DESTINATION ${CMAKE_SOURCE_DIR}/build/)
endfunction()

jfc_export_resource("models")
jfc_export_resource("textures")

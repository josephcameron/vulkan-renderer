# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-10.

project("Vulkan-Renderer" 
    VERSION "0.0.1" 
    DESCRIPTION "has no description!"
)
add_executable(${PROJECT_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)
target_include_directories(${PROJECT_NAME} PRIVATE
    ${glfw_INCLUDE_DIR}
    ${glm_INCLUDE_DIR}
    ${stb_INCLUDE_DIR}
    ${tinyobjloader_INCLUDE_DIR}
)
target_link_libraries(${PROJECT_NAME}
    ${glfw_LIBRARIES}
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build
)
target_compile_features(${PROJECT_NAME} ${JFC_CXX_COMPILER_FEATURE_REQUIREMENTS})

# Generated header
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

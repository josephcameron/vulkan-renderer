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

    #${VULKAN_INCLUDE_DIR}
    /Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/include
)
target_link_libraries(${PROJECT_NAME}
    ${glfw_LIBRARIES}
    
    #${VULKAN_LIBRARIES}
    /Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libvulkan.1.dylib
    /Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_core_validation.dylib
    /Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_object_tracker.dylib
    /Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_parameter_validation.dylib
    /Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_threading.dylib
    /Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_unique_objects.dylib
    /Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_utils.dylib
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build
)
#set_target_properties(${PROJECT_NAME} PROPERTIES VERSION ${PROJECT_VERSION})
target_compile_features(${PROJECT_NAME} ${JFC_CXX_COMPILER_FEATURE_REQUIREMENTS})

message(STATUS "\
Layer detection is working but the build scripts NEED refactoring. \
There is a strong dependency on env vars that MUST be either removed or asserted. \
Look at src/CMakeLists: fix hardcode. Look at ~/.bash_profile.")

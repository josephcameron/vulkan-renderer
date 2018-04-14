#!/usr/bin/env bash

cmake .. \
#-DVULKAN_INCLUDE_DIR=/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/include \
#-DVULKAN_LIBRARIES=/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libMoltenVK.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_core_validation.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_object_tracker.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_parameter_validation.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_threading.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_unique_objects.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_utils.dylib \
#-DVULKAN_LIBRARIES=/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libMoltenVK.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_core_validation.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_object_tracker.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_parameter_validation.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_threading.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_unique_objects.dylib;/Users/josephcameron/Workspace/vulkansdk-macos-1.0.69.0/macOS/lib/libVkLayer_utils.dylib \

make && pushd ../build && for file in *; do 
(
    [[ -x "$file" ]] && ./$file "${@:1}"
); done

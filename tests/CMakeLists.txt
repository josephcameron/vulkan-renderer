# © 2018 Joseph Cameron - All Rights Reserved
# Created on 2018-04-10.
enable_testing()

option(JFC_BUILD_TESTS "Build unit tests" ON)

if (JFC_BUILD_TESTS)
    #[[project("Unit-Tests")
    hunter_add_package(Catch)
    find_package(Catch2 CONFIG REQUIRED)
    add_executable(${PROJECT_NAME}
        ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
    )
    target_include_directories(${PROJECT_NAME} PRIVATE
    )
    target_link_libraries(${PROJECT_NAME} PRIVATE 
        Catch2::Catch
    )
    target_compile_features(${PROJECT_NAME} ${JFC_CXX_COMPILER_FEATURE_REQUIREMENTS})
    add_test(${PROJECT_NAME} ${PROJECT_NAME})
    ]]
else()
    message(STATUS "[Testing] Skipping unit test build step")
endif()

#!/usr/bin/env bash
clear

cmake \
-DJFC_BUILD_DOCS=ON \
-DJFC_BUILD_TESTS=OFF \
-DJFC_BUILD_APP=OFF \
-DJFC_AUTO_RUN_APP=OFF \
J-DFC_FORMAT_CODE=OFF \
 \
.. && make

#!/usr/bin/env bash
clear

cmake \
-DJFC_BUILD_DOCS=OFF \
-DJFC_BUILD_TESTS=OFF \
-DJFC_BUILD_APP=OFF \
-DJFC_AUTO_RUN_APP=OFF \
J-DFC_FORMAT_CODE=ON \
 \
.. && make

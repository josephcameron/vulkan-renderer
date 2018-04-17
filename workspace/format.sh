#!/usr/bin/env bash
clear

cmake \
-DJFC_BUILD_APP=OFF \
-DJFC_BUILD_DOCS=OFF \
-DJFC_BUILD_TESTS=OFF \
-DJFC_AUTO_RUN_APP=OFF \
 \
.. && make

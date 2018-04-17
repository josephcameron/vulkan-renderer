#!/usr/bin/env bash
clear

cmake \
-DJFC_BUILD_DOCS=OFF \
-DJFC_BUILD_TESTS=ON \
-DJFC_AUTO_RUN_APP=ON \
 \
.. && make

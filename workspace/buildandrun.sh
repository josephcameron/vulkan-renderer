#!/usr/bin/env bash

cmake \
-DJFC_BUILD_DOCS=OFF \
-DJFC_BUILD_TESTS=ON \
-DJFC_AUTO_RUN_APP=OFF \
 \
.. && make

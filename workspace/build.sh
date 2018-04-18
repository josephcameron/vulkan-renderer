#!/usr/bin/env bash

function getPathToScript()
{
    local relativePath=""

    if [ -L $0 ] ; then
        relativePath=$(readlink $0)
    else
        relativePath=$0
    fi
    
    echo "$(dirname $relativePath)"
}

clear

cd $(getPathToScript)

rm -R src

cmake \
-DJFC_BUILD_APP=ON  \
-DJFC_BUILD_DOCS=OFF \
-DJFC_BUILD_TESTS=ON  \
-DJFC_AUTO_RUN_APP=OFF \
 \
.. && make

#!/usr/bin/env bash

cmake .. \
-DOPENSSL_ROOT_DIR=/usr/local/opt/openssl \
-DOPENSSL_LIBRARIES=/usr/local/opt/openssl/lib \

make && for file in ../build/*; do 
(
    [[ -x "$file" ]] && $file "${@:1}"
); done

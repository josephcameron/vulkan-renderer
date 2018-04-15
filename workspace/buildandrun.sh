#!/usr/bin/env bash

cmake ..

make && pushd ../build && for file in *; do 
(
    [[ -x "$file" ]] && ./$file "${@:1}"
); done

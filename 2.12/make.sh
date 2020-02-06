#!/bin/bash

if [[ -z "$1" ]]; then
    printf "No file arg given\n"
    exit 1
fi

bnfc -m "$1" || exit 1
shift

sed -i 's/ghc -\([^d]\)/ghc -dynamic -\1/' Makefile
make "$@"

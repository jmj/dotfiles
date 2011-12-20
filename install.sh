#!/bin/bash

FILES=".zshrc .vimrc .vim .zsh.d"
DIRS=".zsh.d .vim"

scriptdir=$(dirname $(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}"))

DEST=${HOME}/tmp

for f in ${FILES}; do
    ln -s ${scriptdir}/${f} ${DEST}
done


#!/bin/zsh

setopt extended_glob
for zshrc_snipplet in ~/.zsh.d/[0-9][0-9]*[^~] ; do
    source $zshrc_snipplet
done

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

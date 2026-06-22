#!/usr/bin/env bash

# Arquivos a serem observados
FILES=(haunt.scm template/linktree.scm pages/index.md)

while inotifywait -e modify,attrib "${FILES[@]}"; do
    make linktree
done    

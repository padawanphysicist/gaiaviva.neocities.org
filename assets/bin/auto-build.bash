#!/usr/bin/env bash

# Arquivos a serem observados
FILES=(haunt.scm builder/linktree.scm assets/css/style.css)

while inotifywait -e modify,attrib "${FILES[@]}"; do
    make linktree
done    

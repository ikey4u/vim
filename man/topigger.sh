#!/usr/bin/env bash

for txt in *.txt
do
    if [[ -e ~/writer/special/vim ]]
    then
        pigger -o ~/writer/special/vim $txt
    else
        echo "Do not find ~/writer/special/vim !"
    fi
done

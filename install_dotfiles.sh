#!/bin/bash

find . -type f -regextype sed -regex ".*\/\.[a-z\_\.]\+" | xargs -I {} readlink -f {} | xargs -I {} ln -s {} $HOME

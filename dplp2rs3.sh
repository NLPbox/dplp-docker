#!/bin/bash

source ~/.profile
workon discoursegraphs

# input: input.parsetree input.merge
# output: input.rs3
python dplp2rs3.py $1 $2 ${1%.*}.rs3
deactivate

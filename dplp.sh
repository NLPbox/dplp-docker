#!/bin/bash

# set -x

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INPUT_ABSPATH=$(readlink -e $1)
INPUT_DIRPATH="$(dirname "$(readlink -e $1)")"

# usage: ./dplp.sh /path/to/plaintext_input.txt
# NOTE: dplp.sh MUST be called from this directory only!
# NOTE: the path to the input file MUST be an absolute path!

# call CoreNLP server and parse the input text file.
if [ -z "$CORENLP_ENDPOINT" ]; then # if env was not set in 'docker run' command
    python corenlp_client.py $INPUT_ABSPATH $INPUT_ABSPATH.xml &>> $INPUT_ABSPATH.log
else
    python corenlp_client.py --corenlp-endpoint $CORENLP_ENDPOINT $INPUT_ABSPATH $INPUT_ABSPATH.xml &>> $INPUT_ABSPATH.log
fi

# test if CoreNLP client succeeded
if [ $? -eq 0 ]; then
  true # Successfully parsed input file
else
  echo "Could not parse input file ..."
  cat $INPUT_ABSPATH.log
  exit 1
fi


# convert.py converts all CoreXML .xml files in the input file's directory into .conll files (9 columns)
python convert.py $INPUT_DIRPATH &>> $INPUT_ABSPATH.log

# segmenter.py converts all .conll files in the input file's directory, adds a 10th column (EDU number) into .merge files
# NOTE: this can be used for batch processing
# NOTE: this loads a model on startup, so idealy this would be a service of its own
python segmenter.py $INPUT_DIRPATH &>> $INPUT_ABSPATH.log

# rstparser.py converts all .merge files in the input file's directory into .brackets files
# NOTE: this can be used for batch processing
# NOTE: this loads a model on startup, so idealy this would be a service of its own
python rstparser.py $INPUT_DIRPATH True &>> $INPUT_ABSPATH.log

# DPLPs output comprises of several files, but we'll handle them as one
cat $INPUT_ABSPATH.merge $INPUT_ABSPATH.parsetree > complete_output.txt
cat complete_output.txt

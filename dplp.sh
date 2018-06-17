#!/bin/bash

set -x

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

# To construct RST trees out of DPLPs output, you'll need to look at
# the last column of the .merge file and the .brackets file.
# Alternatively, you can use the nltk Tree's that my modified code writes to the .parsetree file.
cat $INPUT_ABSPATH.merge output_break.txt $INPUT_ABSPATH.brackets > complete_output.txt
cat complete_output.txt

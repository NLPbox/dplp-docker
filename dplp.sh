#!/bin/bash

# usage: ./dplp.sh /path/to/plaintext_input.txt
# NOTE: dplp.sh MUST be called from this directory only!
# NOTE: the path to the input file MUST be an absolute path!

cd /opt/corenlp

# CoreNLP will take input.txt and return intput.txt.out (CoreNLP XML containing tokenization, POS tags etc
/usr/bin/java -mx2g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLP \
    -annotators tokenize,ssplit,pos,lemma,ner,parse -ssplit.eolonly \
    -tokenize.whitespace true -file $1 -outputDirectory $(dirname $1) \
    &>> $1.log

cd /opt/DPLP
mv $1.out $1.xml # rename CoreNLP output file for DPLP's convert.py script

# convert.py converts all CoreXML .xml files in the input file's directory into .conll files (9 columns)
python convert.py $(dirname $1) &>> $1.log

# segmenter.py converts all .conll files in the input file's directory, adds a 10th column (EDU number) into .merge files
# NOTE: this can be used for batch processing
# NOTE: this loads a model on startup, so idealy this would be a service of its own
python segmenter.py $(dirname $1) &>> $1.log

# rstparser.py converts all .merge files in the input file's directory into .brackets files
# NOTE: this can be used for batch processing
# NOTE: this loads a model on startup, so idealy this would be a service of its own
python rstparser.py $(dirname $1) False &>> $1.log

# To construct RST trees out of DPLPs output, you'll need to look at
# the last column of the .merge file and the .brackets file.
cat $1.merge output_break.txt $1.brackets > complete_output.txt
cat complete_output.txt

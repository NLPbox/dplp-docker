#!/bin/bash
cd /opt/corenlp
/usr/bin/java -mx2g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLP \
    -annotators tokenize,ssplit,pos,lemma,ner,parse -ssplit.eolonly \
    -tokenize.whitespace true -file $1 -outputDirectory $(dirname $1) \
    &>> $1.log

cd /opt/DPLP
python convert.py $(dirname $1) &>> $1.log
python segmenter.py $(dirname $1) &>> $1.log
python rstparser.py $(dirname $1) False &>> $1.log
cat $1.brackets

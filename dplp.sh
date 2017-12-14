#!/bin/bash
cd /opt/corenlp
/usr/bin/java -mx2g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLP \
    -annotators tokenize,ssplit,pos,lemma,ner,parse -ssplit.eolonly \
    -tokenize.whitespace true -file $1 -outputDirectory $(dirname $1) \
    &>> $1.log

cd /opt/DPLP
mv $1.out $1.xml # rename CoreNLP output file for DPLP's convert.py script
python convert.py $(dirname $1) &>> $1.log
python segmenter.py $(dirname $1) &>> $1.log
python rstparser.py $(dirname $1) False &>> $1.log

# To construct RST trees out of DPLPs output, you'll need to look at
# the last column of the .merge file and the .brackets file.
cat $1.merge output_break.txt $1.brackets > complete_output.txt
cat complete_output.txt

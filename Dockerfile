FROM ubuntu:16.04

# We can't use nltk from the repos, as it has a nltk tree drawing bug
RUN apt-get update -y && \
    apt-get install -y git python-scipy python-numpy python-sklearn python-pip && \
    pip install nltk==3.2.5

# we need discoursegraphs for conversion to .rs3
WORKDIR /opt
RUN git clone https://github.com/arne-cl/discoursegraphs.git

# discoursegraphs needs to be installed in a virtualenv, because it needs a newer
# version of nltk. We need to replace 'sh' with 'bash' to make virtualenv work.
SHELL ["/bin/bash", "-c"]

WORKDIR /opt/discoursegraphs
RUN apt-get install -y python-dev python-pip graphviz graphviz-dev \
    libxml2-dev libxslt-dev && rm -rf /var/lib/apt/lists/* && \
    pip2 install virtualenvwrapper==4.8.2 && \
    echo "export WORKON_HOME=$HOME/.virtualenvs" > ~/.profile && \
    echo "source /usr/local/bin/virtualenvwrapper.sh" > ~/.profile && \
    source ~/.profile && \
    mkvirtualenv -p python2.7 discoursegraphs

# on current Ubuntu systems you will need to install pygraphviz manually,
# cf. http://stackoverflow.com/questions/32885486/pygraphviz-importerror-undefined-symbol-agundirected
RUN source ~/.profile && workon discoursegraphs && pip2 install pygraphviz==1.3.1 \
    --install-option="--include-path=/usr/include/graphviz" \
    --install-option="--library-path=/usr/lib/graphviz/" && \
    pip2 install -r requirements.txt && deactivate


WORKDIR /opt
# We'll install my fork to produce RST trees as nltk trees
RUN git clone https://github.com/arne-cl/DPLP.git


RUN pip install pytest sh requests

ADD dplp.sh test_dplp.py dplp2rs3.* corenlp_client.py input_long.txt input_short.txt /opt/DPLP/


WORKDIR /opt/DPLP
ENTRYPOINT ["./dplp.sh"]
CMD ["/opt/DPLP/input_long.txt"]

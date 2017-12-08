FROM nlpbox/corenlp:3.6.0

RUN apt-get update -y && \
    apt-get install -y python-scipy python-numpy python-sklearn python-nltk

WORKDIR /opt
RUN git clone https://github.com/jiyfeng/DPLP

ADD dplp.sh /opt/DPLP/
ADD input_long.txt /opt/DPLP/data/

WORKDIR /opt/DPLP
ENTRYPOINT ["./dplp.sh"]
CMD ["/opt/DPLP/data/input_long.txt"]

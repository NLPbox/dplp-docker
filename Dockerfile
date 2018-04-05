FROM nlpbox/corenlp:3.6.0

# We can't use nltk from the repos, as it has a nltk tree drawing bug
RUN apt-get update -y && \
    apt-get install -y python-scipy python-numpy python-sklearn python-pip && \
    pip install nltk==3.2.5

WORKDIR /opt
# We'll install my fork to produce RST trees as PNG images
RUN git clone https://github.com/arne-cl/DPLP.git


RUN pip install pytest sh pudb # FIXME: remove after testing


ADD dplp.sh test_dplp.py /opt/DPLP/
ADD input_long.txt input_short.txt output_break.txt /opt/DPLP/



WORKDIR /opt/DPLP
ENTRYPOINT ["./dplp.sh"]
CMD ["/opt/DPLP/input_long.txt"]

#!/usr/bin/env python3
# coding: utf-8

import argparse
import os
import codecs
import sys

import requests



CORENLP_PROPERTIES = {
    "annotators": "tokenize,ssplit,pos,lemma,ner,parse",
    "ssplit.eolonly": "false",
    "tokenize.whitespace": "true",
    "outputFormat": "xml"
}


def call_parser(input_file, corenlp_endpoint, corenlp_properties=CORENLP_PROPERTIES):
    """Calls the CoreNLP server, let's it parse the input file and returns a requests.Result object."""
    url = os.path.join(corenlp_endpoint, "?properties={}".format(corenlp_properties))
    with codecs.open(input_file, 'r', 'utf-8') as infile:
        text = infile.read()
        return requests.post(url=url, data=text)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument(
        '-e', '--corenlp-endpoint', default='http://localhost:9000',
        help='URL:Port of the CoreNLP server that should parse the input text.')
    parser.add_argument(
        'input_file', help="File containing text to be parsed.")
    parser.add_argument(
        'output_file', nargs='?', default=sys.stdout,
        help=("File that will contain the parser result in XML format."
              "Prints to stdout if no file is given."))

    args = parser.parse_args(sys.argv[1:])

    try:
        server_result = call_parser(args.input_file, args.corenlp_endpoint)
    except Exception as e:
        sys.exit("Calling CoreNLP resulted in this error: {}".format(e))

    if not server_result.ok:
        err_msg = (u"The CoreNLP server at '{0}' responded with error code"
                   "'{1}' and this message: '{2}'")
        sys.exit(err_msg.format(args.corenlp_endpoint,
                                server_result.status,
                                server_result.content))

    #~ import pudb; pudb.set_trace()
    if isinstance(args.output_file, str):  # if we're not piping to stdout ...
        with open(args.output_file, 'wb') as outfile:
            outfile.write(server_result.content)
    else:
        args.output_file.write(server_result.content.decode(args.output_file.encoding))


# dplp-docker

[![Travis Build Status](https://travis-ci.org/NLPbox/dplp-docker.svg?branch=master)](https://travis-ci.org/NLPbox/dplp-docker.svg?branch=master)
[![Docker Build Status](https://img.shields.io/docker/build/nlpbox/dplp.svg)](https://img.shields.io/docker/build/nlpbox/dplp.svg)

This docker container allows you to build, install and run the
[DPLP RST discourse parser](https://github.com/jiyfeng/DPLP)
(Ji and Eisenstein 2014) in a docker container.


## Building / Installing DPLP

DPLP uses CoreNLP to generate parse trees from the input. We will run
it as a server, so that the language models only have to be loaded once:

```
docker run -p 9000:9000 nlpbox/corenlp:3.9.1
```

You can check that it runs correctly by visiting [http://localhost:9000]
in your browser. Now you can install dplp-docker:

```
git clone https://github.com/NLPbox/dplp-docker
cd dplp-docker
docker build -t dplp .
```

## Running DPLP

To test if parser works, just run ``docker run --net host dplp``.
To run the parser on the file ``/tmp/input.txt`` on your
local machine, run:

```
docker run --net host -v /tmp:/tmp -ti dplp /tmp/input.txt
```

If you run CoreNLP on a different host, then you'll need to set the
`CORENLP_ENDPOINT` variable, e.g.

```
docker run -e CORENLP_ENDPOINT=http://example.com:9000 --net host -v /tmp:/tmp -ti dplp /tmp/input.txt
```

## Example Input

```
Although they didn't like it, they accepted the offer.
```

## Example Output

```
0       1       Although        although        IN      mark    3       O        (ROOT (SBAR (IN Although)      1
0       2       they    they    PRP     nsubj   3       O        (S (NP (PRP they))     1
0       3       didn't  didn't  VBP     root    0       O        (VP (VBP didn't)       1
0       4       like    like    IN      case    5       O        (PP (IN like)  1
0       5       it,     it,     NN      nmod    3       O        (NP (NP (NN it,))      1
0       6       they    they    PRP     nsubj   7       O        (SBAR (S (NP (PRP they))       2
0       7       accepted        accept  VBD     acl:relcl       5       O        (VP (VBD accepted)     2
0       8       the     the     DT      det     9       O        (NP (DT the)   2
0       9       offer.  offer.  NN      dobj    7       O        (NN offer.)))))))))))  2

ParentedTree('NS-elaboration', [ParentedTree('EDU', ['1']), ParentedTree('EDU', ['2'])])
```

# Citation

Yangfeng Ji, Jacob Eisenstein (2014).
[Representation Learning for Text-level Discourse Parsing](http://www.anthology.aclweb.org/P/P14/P14-1002.pdf).
Proceedings of the 52nd Annual Meeting of the Association for Computational Linguistics, pages 13-24.

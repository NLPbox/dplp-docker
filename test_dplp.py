#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author: Arne Neumann <nlpbox.programming@arne.cl>

import pytest
import sh


EXPECTED_OUTPUT = """0	1	Although	although	IN	mark	3	O	 (ROOT (SBAR (IN Although)	1
0	2	they	they	PRP	nsubj	3	O	 (S (NP (PRP they))	1
0	3	didn't	didn't	VBP	root	0	O	 (VP (VBP didn't)	1
0	4	like	like	IN	case	5	O	 (SBAR (S (PP (IN like)	1
0	5	it,	it,	NN	nmod	7	O	 (NP (NN it,)))	1
0	6	they	they	PRP	nsubj	7	O	 (NP (PRP they))	2
0	7	accepted	accept	VBD	ccomp	3	O	 (VP (VBD accepted)	2
0	8	the	the	DT	det	9	O	 (NP (DT the)	2
0	9	offer.	offer.	NN	dobj	7	O	 (NN offer.)))))))))	2

RELATIONS:

((1, 1), 'Nucleus', 'span')
((2, 2), 'Satellite', 'elaboration')
"""

EXPECTED_PARSETREE = """ParentedTree('NS-elaboration', [ParentedTree('EDU', ['1']), ParentedTree('EDU', ['2'])])"""

EXPECTED_RS3 = """<?xml version='1.0' encoding='UTF-8'?>
<rst>
  <header>
    <relations>
      <rel name="elaboration" type="rst"/>
    </relations>
  </header>
  <body>
    <segment id="3" parent="1" relname="span">Although they didn't like it,</segment>
    <segment id="5" parent="3" relname="elaboration">they accepted the offer.</segment>
    <group id="1" type="span"/>
  </body>
</rst>
"""


def test_dplp():
    """The DPLP parser produces the expected output."""
    parser = sh.Command('./dplp.sh')
    result = parser('input_short.txt')
    assert result.stdout == EXPECTED_OUTPUT, result.stderr.encode('utf-8')

    with open('input_short.txt.parsetree', 'r') as parse_file:
        assert parse_file.read() == EXPECTED_PARSETREE

    converter = sh.Command('./dplp2rs3.sh')
    result = converter('input_short.txt.parsetree', 'input_short.txt.merge')

    with open('input_short.txt.rs3', 'r') as rs3_file:
        assert rs3_file.read() == EXPECTED_RS3

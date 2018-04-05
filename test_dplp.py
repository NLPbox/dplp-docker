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


def test_dplp():
    """The DPLP parser produces the expected output."""
    parser = sh.Command('./dplp.sh')
    result = parser('input_short.txt')

    #~ import pudb; pudb.set_trace()
    import os
    print("pwd: ", os.getcwd())
    print("ls: ", os.listdir('.'))
    print("result.stdout: ", result.stdout)
    print("EXPECTED_OUTPUT: ", EXPECTED_OUTPUT)
    print("result.stderr: ", result.stderr)
    assert result.stdout == EXPECTED_OUTPUT, result.stderr.encode('utf-8')


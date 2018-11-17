#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author: Arne Neumann <nlpbox.programming@arne.cl>

import pytest
import sh


EXPECTED_OUTPUT = """0\t1\tAlthough\talthough\tIN\tmark\t3\tO\t (ROOT (SBAR (IN Although)\t1\n0\t2\tthey\tthey\tPRP\tnsubj\t3\tO\t (S (NP (PRP they))\t1\n0\t3\tdidn't\tdidn't\tVBP\troot\t0\tO\t (VP (VBP didn't)\t1\n0\t4\tlike\tlike\tIN\tcase\t5\tO\t (PP (IN like)\t1\n0\t5\tit,\tit,\tNN\tnmod\t3\tO\t (NP (NP (NN it,))\t1\n0\t6\tthey\tthey\tPRP\tnsubj\t7\tO\t (SBAR (S (NP (PRP they))\t2\n0\t7\taccepted\taccept\tVBD\tacl:relcl\t5\tO\t (VP (VBD accepted)\t2\n0\t8\tthe\tthe\tDT\tdet\t9\tO\t (NP (DT the)\t2\n0\t9\toffer.\toffer.\tNN\tdobj\t7\tO\t (NN offer.)))))))))))\t2\n\nParentedTree('NS-elaboration', [ParentedTree('EDU', ['1']), ParentedTree('EDU', ['2'])])"""


def test_dplp():
    """The DPLP parser produces the expected output."""
    parser = sh.Command('./dplp.sh')
    result = parser('input_short.txt')
    assert result.stdout == EXPECTED_OUTPUT, result.stderr.encode('utf-8')

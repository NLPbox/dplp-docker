#!/usr/bin/env python2

import argparse
import sys
import discoursegraphs as dg


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('parsetree_file', help="DPLP .parsetree file to be converted")
    parser.add_argument('merge_file', help="DPLP .merge file to be converted")
    parser.add_argument('output_file', help="path to .rs3 output file.")
    args = parser.parse_args(sys.argv[1:])
    
    dplp_tree = dg.read_dplp(args.parsetree_file, args.merge_file)
    dg.write_rs3(dplp_tree, args.output_file)

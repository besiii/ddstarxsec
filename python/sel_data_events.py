#!/usr/bin/env python
"""
Event Selection 
"""

__author__ = "SHI Xin <shixin@ihep.ac.cn>"
__copyright__ = "Copyright (c) SHI Xin"
__created__ = "[2016-06-28 Tue 09:09]" 

import sys
import os
import math 
import ROOT 
from progressbar import Bar, Percentage, ProgressBar
from time import time 
from tools import duration, check_outfile_path

#TEST=True 
TEST=False

# Global constants 
D0_MASS = 1.86484; 

# Global histograms

h_evtflw = ROOT.TH1F('hevtflw', 'eventflow', 10, 0, 10) 
h_evtflw.GetXaxis().SetBinLabel(1, 'raw')
h_evtflw.GetXaxis().SetBinLabel(2, 'N_{#gamma}<20')
h_evtflw.GetXaxis().SetBinLabel(3, '|cos#theta|<0.8')
h_evtflw.GetXaxis().SetBinLabel(4, '|p|<0.45') 
h_evtflw.GetXaxis().SetBinLabel(5, 'PID') 
h_evtflw.GetXaxis().SetBinLabel(6, 'cos#theta_{#k^{+}#pi^{-}}<0.95') 
h_evtflw.GetXaxis().SetBinLabel(7, 'cos#theta_{#k#pi sys}<0.9') 
h_evtflw.GetXaxis().SetBinLabel(8, '1.7<M_{#k#pi}<2.0') 


def usage():
    sys.stdout.write('''
NAME
    sel_events.py 

SYNOPSIS

    ./sel_events.py infile outfile 

AUTHOR 
    SHI Xin <shixin@ihep.ac.cn> 

DATE
    July 2016 
\n''')

    
def main():

    if TEST:
        sys.stdout.write('Run in TEST mode! \n')
    
    args = sys.argv[1:]
    if len(args) < 2:
        return usage()
    
    infile = args[0]
    outfile = args[1]
    check_outfile_path(outfile)

    fin = ROOT.TFile(infile)
    #t = fin.Get('mc')
    #t = fin.Get('D0bar_kpi')
    t = fin.Get('D0_kpi')
    entries = t.GetEntries()

    fout = ROOT.TFile(outfile, "RECREATE")
    t_4 = t.CloneTree(0)

    pbar = ProgressBar(widgets=[Percentage(), Bar()], maxval=entries).start()
    time_start = time()

    for jentry in xrange(entries):
        pbar.update(jentry+1)
        
        nb = t.GetEntry(jentry)
        if nb<=0:
            continue
        if abs(t.vtx_mkpi-D0_MASS)<0.2:
        #if abs(t.vtx_mkpi-D0_MASS)<0.4:
            t_4.Fill()
 
    t_4.Write()
    fout.Close()
    pbar.finish()
    print entries
    
    dur = duration(time()-time_start)
    sys.stdout.write(' \nDone in %s. \n' % dur) 


    
    
if __name__ == '__main__':
    main()

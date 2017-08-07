#!/usr/bin/env python
"""
Check PBS jobs 
"""

__author__ = "SHI Xin <shixin@ihep.ac.cn>"
__copyright__ = "Copyright (c) SHI Xin"
__created__ = "[2016-06-02 Thu 09:42]" 

import sys
import os
from hurry.filesize import size 
from tools import BossLogFile, EventsLogFile 


def usage():
    sys.stdout.write('''
NAME
    chk_pbsjobs.py 

SYNOPSIS

    ./chk_pbsjobs.py  input_dir num_of_files

AUTHOR 
    SHI Xin <shixin@ihep.ac.cn> 

DATE
    July 2016 
\n''')

    
def main():
    args = sys.argv[1:]
    if len(args) < 2:
        return usage()
    
    src = args[0]
    num = int(args[1])
    jobs_created = set(range(1, num+1))

    log = src 
    logdir = src.split('/')[-1]
    data_num = ['data_3810','data_3890','data_3900','data_3950','data_3980','data_4010','data_4030','data_4040','data_4055','data_4070','data_4090','data_4120','data_4140','data_4150','data_4170','data_4190','data_4210','data_4220','data_4230','data_4245','data_4260','data_4310','data_4360','data_4390']
    if logdir in data_num:
        logfiletype = 'BossLogFile'
    elif logdir == 'events':
        logfiletype = 'EventsLogFile'
    else:
        raise NameError(logdir)
    
    log = log.replace(logdir, 'log/%s' %logdir) 
    
    sys.stdout.write('Scanning %s...\n' %src)

    file_list = []
    total_size = 0 
    for root, dirs, files in os.walk(src):
        for f in files:
            file_list.append(int(f.split('-')[-1].split('.')[0]))
            total_size = total_size + os.path.getsize(os.path.join(root,f))

    sys.stdout.write('Found %s files, with total size %s.\n' %(
        len(file_list), size(total_size)))
    
    sys.stdout.write('Checking log files...\n')
    jobs_not_terminated = []
    for root, dirs, files in os.walk(log):
        for f in files:
            if logfiletype == 'BossLogFile': 
                l = BossLogFile( os.path.join(root, f) )
            elif logfiletype == 'EventsLogFile':
                l = EventsLogFile( os.path.join(root, f) )
            else:
                raise NameError(logfiletype) 

            if not l.terminated:
                sys.stdout.write('%s ... Not OK.\n' %f)
                job = f.split('-')[-1]
                jobs_not_terminated.append(job)
            else:
                sys.stdout.write('%s ... OK.\n' %f)

    if len(jobs_not_terminated) > 0: 
        sys.stdout.write('Non-terminated jobs are (%s): %s\n' % (
            len(jobs_not_terminated), ','.join(jobs_not_terminated)))
    else:
        sys.stdout.write('All finished jobs are terminated correctly. \n')

    if len(file_list) < num:
        jobs_missing = jobs_created.difference(file_list)
        jobs_missing = [str(li) for li in jobs_missing]
        sys.stdout.write('Missing jobs are: %s\n' % ','.join(jobs_missing))
    else:
        sys.stdout.write('No missing jobs.\n')
        
                
if __name__ == '__main__':
    main()

#!/usr/bin/env python
'''
Script for managing dotfiles that follow this convention:
    - Symbolic links (files and directories) have to be called
        <filename>.symlink
      And will be linked to:
        ~/.<filename>
    - Every file called
        `uname -o`.sh
        `uname -o`-update.sh
      on subdirectories will be executed
'''


import argparse
import os


def link_files(dotdir, homedir):
    '''
    Links all files or directories with sufix: *.symlink
    '''
    for file in os.scandir(dotdir):
        if file.name.endswith('.symlink'):
            link_file(file.path, homedir + '/.' + file.name.replace('.symlink', ''))
        elif file.is_dir():
            link_files(file.path, homedir)


def link_file(src, dst):
    '''
    Link one file from the dotdir to the home dir.
    Checks if files are actually different, removes dst if necessary.
    '''
    srcinfo = os.stat(path=src)
    if os.path.exists(dst):
        dstinfo = os.stat(path=dst)
        if srcinfo.st_ino == dstinfo.st_ino:
            return
        else:
            os.unlink(dst)

    print("linking %s to %s" % (src, dst))
    os.symlink(src, dst)


def run_scripts(dotdir, sname):
    '''
    Runs all '<sname>' files it finds in subdirectories
    '''
    for file in os.scandir(dotdir):
        if file.name == sname:
            run_script(file.path.replace(file.name, ''), file.name)
        elif file.is_dir():
            run_scripts(file.path, sname)


def run_script(path, script):
    '''
    Runs this script in its subdirectory
    '''
    print("Running %s in %s" % (script, path))
    os.system("cd %s; bash %s; cd - >/dev/null" % (path, script))


def parse_args():
    '''
    Main func, parse args and run whats needed
    '''

    # default dotfiles dir is the same where this script sits
    dotdir = os.path.dirname(os.path.abspath(__file__))
    homedir = os.environ['HOME']
    osname = os.uname().sysname + '.sh'
    osname_update = os.uname().sysname + '-update.sh'

    parser = argparse.ArgumentParser(description='Manage your dotfiles')
    parser.add_argument('-l', '--link', action='store_true',
                        help='link the files in your dotdir to your home dir')
    parser.add_argument('-r', '--run', action='store_true',
                        help='run the scripts in the dotdir subdirectories')
    parser.add_argument('-u', '--update', action='store_true',
                        help='run the update scripts in the dotdir subdirectories')
    parser.add_argument('-a', '--all', action='store_true',
                        help='link files, run scripts')
    parser.add_argument('-d', '--dotdir',
                        help='directory for dotfiles, defaults to ' +
                        'directory of this script')
    parser.add_argument('-p', '--homedir', help='user home directory')
    args = parser.parse_args()

    if not (args.all or args.run or args.link):
        parser.print_usage()
        return

    if args.dotdir:
        dotdir = args.dotdir

    if args.homedir:
        homedir = args.homedir

    if args.all:
        link_files(dotdir, homedir)
        run_scripts(dotdir, osname)
        run_scripts(dotdir, osname_update)
    else:
        if args.link:
            link_files(dotdir, homedir)
        if args.run:
            run_scripts(dotdir, osname)
        if args.update:
            run_scripts(dotdir, osname_update)


if __name__ == "__main__":
    parse_args()

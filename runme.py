#!/usr/bin/env python


import argparse
import os


def link_files():
    '''
    Links all files or directories with sufix: *.symlink
    '''
    print('link files')
    pass


def link_file(src, dst=''):
    '''
    Link one file from the dotdir to the home dir.

    Checks if files are actually different, removes dst if necessary.
    '''
    pass


def run_scripts():
    '''
    Runs all 'configure.sh' files it finds in subdirectories
    '''
    print('run scripts')
    pass


def run_script(script):
    '''
    Runs this script in its subdirectory
    '''
    pass


def validate_dotdir(dir):
    '''
    Make sure the dir exists and we can read it all
    '''
    print('validating dir: %s' % dir)
    pass


def parse_args():
    '''
    Main func, parse args and run whats needed
    '''

    # default dotfiles dir is the same where this script sits
    dotdir = os.path.dirname(os.path.abspath(__file__))

    parser = argparse.ArgumentParser(description='Manage your dotfiles')
    parser.add_argument('-l', '--link', action='store_true',
                        help='link the files in your dotdir to your home dir')
    parser.add_argument('-r', '--run', action='store_true',
                        help='run the scripts in the dotdir subdirectories')
    parser.add_argument('-a', '--all', action='store_true',
                        help='link files, run scripts')
    parser.add_argument('-d', '--dotdir',
                        help='directory for dotfiles, defaults to ' +
                        'directory of this script')
    args = parser.parse_args()

    if not (args.all or args.run or args.link):
        parser.print_usage()
        return

    if args.dotdir:
        dotdir = args.dotdir

    validate_dotdir(dotdir)

    if args.all:
        link_files()
        run_scripts()
    else:
        if args.link:
            link_files()
        if args.run:
            run_scripts()


if __name__ == "__main__":
    parse_args()

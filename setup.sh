#!/bin/bash

ABOUT=<<-EOF
  This script 'installs' dotfiles by creating symbolic links in ~/ to each of setup.sh's 
  sibling files that ends with a '.symlink' extension.

  Usage:
    
    $ ./setup.sh

  Tested on Linux and Mac OS X.
EOF



LINK_DIR=`cd $(dirname "$0"); pwd`
echo "Setting up dotfiles (linking from $LINK_DIR to $HOME) ..."

OS=`uname -s`

if [ $OS == "Darwin" ]; then
    LN="ln -ins"
else
    LN="ln --backup=numbered -ns"
fi

# let's get down to business set options
# so we fail on errors / undefined values
set -e -u

found=0
for file in $LINK_DIR/*
do
    case $file in
        *.symlink)
	    found=1
            fname=`echo $file | sed -e 's/^.*\///' -e 's/.symlink$//'`
            echo "linking $file to ~/.$fname"
            $LN $file ~/.$fname
            ;;
        *)
            ;;
    esac
done
if [ $found -eq 0 ]
then
    echo "You don't have any *.symlink files. :-("
else
    echo "You should be setup! :-)"
fi


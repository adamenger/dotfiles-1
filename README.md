# Steder's Dotfiles

My dotfiles containing configuration for:

 * bash
 * emacs (and aquamacs)
 * git
 * ipython
 * mercurial
 * pdb
 * screen
 * ssh 
 * vimrc 

# Installation

To install these dotfiles all you should have to do is:

    $ git clone git@github.com:steder/dotfiles.git 
    $ ./etc/setup.sh

Then start a new shell and you should be ready to go.

# About

## Bash configuration

### Files Used By Bash

Just a quick note on the files used by bash to remind me what I should be including in each.

 * `.bash_profile`: read and the commands in it executed by Bash every time you log in to the system
 *  `.bashrc`: read and executed by Bash every time you start a subshell
 * `.bash_logout`: read and executed by Bash every time a login shell exits

`.bash_profile` is read and executed only when you start a login shell (that is, when you log in to the system). If you start a subshell (a new shell) by typing bash at the command prompt, it will read commands from .bashrc. This allows you to separate commands needed at login from those needed when invoking a subshell. 
 
### What about .profile or .bash_login?

Bash allows 2 synonyms for `.bash_profile`: `.bash_login` and `.profile.`
Only one of these files is read when you log in.  If `.bash_profile` isn't there, Bash will look for `.bash_login`. If that is missing too, it will look for `.profile`.

### Okay what goes where?

System wide aliases and functions should go in `/etc/bashrc`.

Personal environment variables and startup programs should go into `~/.bash_profile`.

Personal aliases and functions should go into `~/.bashrc`.

## Emacs (And Aquamacs)

I've gone to some trouble to have my Emacs configuration work smoothly in both commandline emacs on Linux, Mac OS X, and Windows.  
My configuration should also run cleanly in Aquamacs.

### Keybindings

I usually try to stay close to the Emacs default keybindings but where I've customized things can be easily found in

emacs.d/keybindings.el


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

## bash configuration

### Files Used By Bash

   .bash_profile : read and the commands in it executed by Bash every time you log in to the system
   .bashrc : read and executed by Bash every time you start a subshell
   .bash_logout : read and executed by Bash every time a login shell exits

Bash allows 2 synonyms for `.bash_profile`: `.bash_login` and `.profile.`
These are derived from the C shell's file named `.login` and from the Bourne shell and Korn shell files named `.profile`.
Only one of these files is read when you log in.  If `.bash_profile` isn't there, Bash will look for `.bash_login`. If that is missing too, it will look for `.profile`.

`.bash_profile` is read and executed only when you start a login shell (that is, when you log in to the system). If you start a subshell (a new shell) by typing bash at the command prompt, it will read commands from .bashrc. This allows you to separate commands needed at login from those needed when invoking a subshell. 
 
System wide aliases and functions should go in /etc/bashrc.  Personal environment variables and startup programs should go into
`~/.bash_profile`.

Personal aliases and functions should go into
`~/.bashrc`.


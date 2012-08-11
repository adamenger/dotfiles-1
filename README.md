# Steder's Dotfiles

My dotfiles containing configuration for:

 * bash
 * emacs (and aquamacs)
 * git
 * ipython
 * irb
 * mercurial
 * screen
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

After 10 years of nearly daily use I've really come to love Emacs and with this latest refactoring I'm 
really happy with how my configuration works.

I've gone to some trouble to have my Emacs configuration work smoothly in both commandline emacs on Linux, Mac OS X, and Windows.  
My configuration should also run cleanly in Aquamacs.

I've also recently updated to Emacs 24.1 (and Aquamacs 3.x).

I also used to ship tons of 3rd party packages with my emacs configuration by simply checking them into VC along with the rest
of my configuration files.  With the inclusion of a real package manager in Emacs 24 I'm going through and cleaning house
to rely on the package manager where I can to install dependencies and keep them up to date.

### Layout

I've laid my v3 emacs configuration out with significantly more structure and hope this will make
it easier to understand and maintain going forward.  It's one of the things that's really powerful and
fun about Emacs that simply configuring it is a an opportunity to hack on some code.

The layout is:

    emacs.symlink # our .emacs file
    emacs.d/
    |- auto-save-list # 
    |- backups # ~ files
    |- elpa # stores all packages downloaded by elpa
    |- personal # our personal emacs files
    |- snippets # yasnippets directory
    |- thirdparty # any third party packages / git submodules we cant install with elpa
    |- init.el # loaded by .emacs, our real configuration file
    `- packages.el # defines list of packages to install with elpa

### Keybindings

I usually try to stay close to the Emacs default keybindings but where I've customized things can be easily found in:

    emacs.d/personal/ms-bindings.el

### Appearance

I disable a ton of gui shortcuts to because I tend to favor commandline emacs and keyboard shortcuts (or M-x commands)
over using the mouse.

Details can be found in:

    emacs.d/personal/ms-*.el

### Python

I have a crapload of Python customizations.

### Starcraft Actions Per Minute

I recently decided I wanted to write an emacs minor mode to see what was involved.  I ended up with a mode
that keeps track of every key press and calculates actions per minute like they do for professional starcraft 
matches.

I had vague ideas when I wrote this about extending it to track other metrics.  For example:
 * it would be possible to generate a heatmap of most used keys.
 * You could identify the top 10 keyboard shortcuts used so you can remap them
   to make them require fewer keystrokes or to require less reach.
 

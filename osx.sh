#!/usr/bin/env bash
# Here's a bunch of optional configuration tweaks for OS X that you might want to
# do like switching to a 2D dock, disabling menu bar transparency, etc...

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
#defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Enable the 2D Dock
#defaults write com.apple.dock no-glass -bool true
# Disable menu bar transparency
#defaults write -g AppleEnableMenuBarTransparency -bool false
# Expand save panel by default
#defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
# Expand print panel by default
#defaults write -g PMPrintingExpandedStateForPrint -bool true
# Disable shadow in screenshots
#defaults write com.apple.screencapture disable-shadow -bool true
# Enable highlight hover effect for the grid view of a stack (Dock)
#defaults write com.apple.dock mouse-over-hilte-stack -bool true
# Enable spring loading for all Dock items
#defaults write enable-spring-load-actions-on-all-items -bool true
# Disable press-and-hold for keys in favor of key repeat
#defaults write -g ApplePressAndHoldEnabled -bool false
# Disable auto-correct
#defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable window animations
#defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# Disable disk image verification
#defaults write com.apple.frameworks.diskimages skip-verify -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
# Automatically open a new Finder window when a volume is mounted
#defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
#defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# Avoid creating .DS_Store files on network volumes
#defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Disable Safari’s thumbnail cache for History and Top Sites
#defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
# Enable Safari’s debug menu
#defaults write com.apple.Safari IncludeDebugMenu -bool true
# Remove useless icons from Safari’s bookmarks bar
#defaults write com.apple.Safari ProxiesInBookmarksBar “()”
# Disable send and reply animations in Mail.app
#defaults write com.apple.Mail DisableReplyAnimations -bool true
#defaults write com.apple.Mail DisableSendAnimations -bool true
# Disable Resume system-wide
#defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
# Enable Dashboard dev mode (allows keeping widgets on the desktop)
#defaults write com.apple.dashboard devmode -bool true
# Reset Launchpad
#rm ~/Library/Application\ Support/Dock/*.db

# Show the ~/Library folder
#chflags nohidden ~/Library

# Disable local Time Machine backups
#sudo tmutil disablelocal

# I'm really interested in customizing how the terminal.app behaves so that it
# works properly with powerline:
# From https://github.com/mathiasbynens/dotfiles/blob/master/.osx
###############################################################################
# Terminal                                                                    #
###############################################################################
echo "Customizing Terminal.app..."

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Install the font used by my custom theme:
open "$HOME/etc/powerline-bash/fonts/Inconsolata-dz-Powerline.otf"

# Use my theme by default in Terminal.app
echo "Installing default terminal setup..."
open "$HOME/etc/Steder.terminal"

sleep 1 # Wait a bit to make sure the theme is loaded
defaults write com.apple.terminal "Default Window Settings" -string "Steder"
defaults write com.apple.terminal "Startup Window Settings" -string "Steder"

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true

# Kill affected applications
for app in "Terminal" "Terminal"; do
    killall $app;
done

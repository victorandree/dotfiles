#!/usr/bin/env zsh

# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Use F1, F2 etc. keys as standard function keys
defaults write -g com.apple.keyboard.fnState -bool true

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# Show remaining battery time
# defaults write com.apple.menuextra.battery ShowTime -string "YES"

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Use current directory as default search scope in Finder
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Enable tap to click (Trackpad)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Require password immediately after sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show Library folder
chflags nohidden ~/Library

# Use . as decimal separators for both numbers and currency
defaults write "Apple Global Domain" AppleICUNumberSymbols -dict 0 "." 10 "."

# Fast tracking on trackpad
defaults write "Apple Global Domain" com.apple.trackpad.scaling -int 1.5

# defaults write "Apple Global Domain" AppleInterfaceStyle "Dark"
# defaults write "Apple Global Domain" AppleAquaColorVariant -int 6
# defaults write "Apple Global Domain" AppleHighlightColor "0.847059 0.847059 0.862745"

#
# Screenshots
#

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Don't show recent apps in Dock.app
defaults write com.apple.Dock "show-recents" 0

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

#
# Mail.app
#

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Faster animations
# https://apple.stackexchange.com/questions/253756/speed-up-mission-control-animations-in-macos-sierra
defaults write -g NSWindowResizeTime -float 0.003
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Opera" \
	"Photos" \
	"Safari" \
	"SizeUp" \
	"Spectacle" \
	"SystemUIServer" \
	"Terminal" \
	"Transmission" \
	"Tweetbot" \
	"Twitter" \
	"iCal"; do
	killall "${app}" &> /dev/null
done

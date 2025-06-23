#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Dev Day
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 💻
# @raycast.packageName Developer Tools

# Documentation:
# @raycast.description Opens dev tools and sets the vibe

# Open Slack
open -a "Slack"

# Play Spotify playlist (you’ll need to allow AppleScript control)
osascript -e 'tell application "Spotify"
	set shuffling to true
	play track "spotify:playlist:37i9dQZF1FbFUwtj55HVYp"
end tell'

# Open main web pages for the day
open "https://mail.google.com/mail/u/0/#inbox"
open "https://calendar.google.com/calendar/u/0/r/customday?pli=1"
open "https://github.com/pulls/review-requested"
open "https://ifitdev.atlassian.net/jira/software/c/projects/AIC/boards/1117"
open "https://github.com/ifit/ai-coach"

# Open Bear
open "bear://x-callback-url/open-tag?name=*current-notes"

# Open VS Code to your main project
open -a "Visual Studio Code" ~/Projects/ifit/ai-coach

# Open iTerm
open -a iTerm

open "hammerspoon://snapLayout"
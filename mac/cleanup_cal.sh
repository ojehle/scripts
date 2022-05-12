#csrutil disable
#csrutil enable
#
#recovery mode apple-r
#
launchctl unload -w /System/Library/LaunchAgents/com.apple.CalendarAgent.plist

rm -rf ~/Library/Calendars/*
rm ~/Library/Preferences/com.apple.iCal.plist

#launchctl load -w /System/Library/LaunchAgents/com.apple.CalendarAgent.plist

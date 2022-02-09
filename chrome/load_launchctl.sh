chmod +x /Users/oj/scripts/chrome/*.sh
chmod 750 /Users/oj/scripts/chrome/*.sh
cp com.google.softwareupdatecheck.plist  ~/Library/LaunchAgents/com.google.softwareupdatecheck.plist
chmod 750       ~/Library/LaunchAgents/com.google.softwareupdatecheck.plist
launchctl unload  ~/Library/LaunchAgents/com.google.softwareupdatecheck.plist
launchctl load  ~/Library/LaunchAgents/com.google.softwareupdatecheck.plist

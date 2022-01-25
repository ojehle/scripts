#!/bin/bash


cp com.google.Chrome.plist.bck com.google.Chrome.plist 

plutil -insert RelaunchNotification -integer 2 com.google.Chrome.plist
plutil -insert RelaunchNotificationPeriod -integer 7200000 com.google.Chrome.plist

cp com.google.Chrome.plist $HOME/Library/Preferences/
exit

plutil -insert RelaunchWindow  -xml "<dict/>" com.google.Chrome.plist
plutil -insert RelaunchWindow.entries  -xml "<array/>" com.google.Chrome.plist
plutil -insert RelaunchWindow.entries.0  -xml "<dict/>" com.google.Chrome.plist
plutil -insert RelaunchWindow.entries.0.start  -xml "<dict/>" com.google.Chrome.plist
plutil -insert RelaunchWindow.entries.0.start.hour  -integer 0  com.google.Chrome.plist
plutil -insert RelaunchWindow.entries.0.start.minute  -integer 0  com.google.Chrome.plist
plutil -insert RelaunchWindow.duration_mins -integer 270  com.google.Chrome.plist

exit 

/usr/libexec/PlistBuddy com.google.chrome.plist <<_EOF

add RelaunchNotification integer
add RelaunchNotificationPeriod integer
add RelaunchWindow:entires array
add RelaunchWindow:entires:0:start:hour integer
add RelaunchWindow:entires:0:start:minute integer
add RelaunchWindow:entires:0:start:duration_mins integer

set RelaunchWindow:entires:start:hour 2
set RelaunchWindow:entires:start:minute 0
set RelaunchWindow:entires:start:duration_mins 180
set RelaunchNotification 1
set RelaunchNotificationPeriod 7200000
Save
_EOF

exit


<array>
<dict>
<key>start</key>
<dict>
<key>hour</key>
    <integer>23</integer>
<key>minute</key>
    <integer>30</integer>
</dict>
<key>duration_mins</key>
    <integer>240</integer></dict>
</array>

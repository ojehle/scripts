#!/bin/bash
date >/tmp/google_softwareupdate.log
rm -f /Users/oj/Library/Google/GoogleSoftwareUpdate/Stats/Keystone.stats 2>/dev/null
/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/GoogleSoftwareUpdateAgent.app/Contents/MacOS/GoogleSoftwareUpdateAgent -runMode oneshot -userInitiated YES ”$@” 2>&1 >>/tmp/google_softwareupdate.log

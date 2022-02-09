#!/bin/bash
rm -f /Users/oj/Library/Google/GoogleSoftwareUpdate/Stats/Keystone.stats 2>/dev/null
/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/GoogleSoftwareUpdateAgent.app/Contents/MacOS/GoogleSoftwareUpdateAgent -runMode oneshot -userInitiated YES ”$@”

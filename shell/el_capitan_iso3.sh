hdiutil attach "/Applications/Install OS X El Capitan.app/Contents/SharedSupport/InstallESD.dmg" -noverify -nobrowse -mountpoint /Volumes/esd
hdiutil create -o ElCapitan3.cdr -size 7316m -layout SPUD -fs HFS+J
hdiutil attach ElCapitan3.cdr.dmg -noverify -nobrowse -mountpoint /Volumes/iso
asr restore -source /Volumes/esd/BaseSystem.dmg -target /Volumes/iso -noprompt -noverify -erase
rm /Volumes/OS\ X\ Base\ System/System/Installation/Packages
cp -rp /Volumes/esd/Packages /Volumes/OS\ X\ Base\ System/System/Installation
cp -rp /Volumes/esd/BaseSystem.chunklist /Volumes/OS\ X\ Base\ System/
cp -rp /Volumes/esd/BaseSystem.dmg /Volumes/OS\ X\ Base\ System/
hdiutil detach /Volumes/esd
hdiutil detach /Volumes/OS\ X\ Base\ System
hdiutil convert ElCapitan3.cdr.dmg -format UDTO -o ElCapitan3.iso
mv ElCapitan3.iso.cdr ElCapitan3.iso

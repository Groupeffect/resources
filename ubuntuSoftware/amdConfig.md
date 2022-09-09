# Amd Graphic
https://wiki.ubuntuusers.de/Grafikkarten/AMD/radeon/

add

`
Section "Device"
	Identifier	"Configured Video Device"
	Driver		"radeon"
EndSection
`
to `/etc/X11/xorg.conf.d/20-radeon.conf`
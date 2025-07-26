/// @description activate warp stuff
if (screenTriggered)
	exit

alarm[2] = 15
bitsound(sndMenuSelect)
image_xscale *= -1
screenTriggered = true
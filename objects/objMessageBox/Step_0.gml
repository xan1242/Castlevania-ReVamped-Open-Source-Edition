/// @description deactivate + expand dong + de-expand
var expand_rate = 0.1

if box_xscale < 1.0 && !shrink
{
	box_xscale += expand_rate
	if (box_xscale > 1.0)
		box_xscale = 1.0
}
scrControls()
waiting -= 1

if (kAccept|kCancel|kPause|kMap) && waiting <=0 && !shrink && box_xscale >= 1.0
{
	bitsound(sndMenuSelect)
	shrink = true
}

deactivate()
	
if shrink
{
	if box_xscale > 0
	{
		box_xscale -= expand_rate
		if (box_xscale < 0.0)
			box_xscale = 0.0
	}
	else
	{
		instance_activate_all()
		instance_destroy()
	}
}
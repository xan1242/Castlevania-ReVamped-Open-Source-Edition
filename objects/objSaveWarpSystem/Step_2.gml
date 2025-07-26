/// @description calculate cost of warping
scrControls()

if kCancel
{
	instance_destroy()
	exit;
}

var selection_changed = 0;
if (kLeftTap)
	selection_changed = -1;
else if (kRightTap)
	selection_changed = 1;

if (selection_changed != 0)
{
	onSelectionChanged(selection_changed);
}

if (kAccept)
{
	if ((warp_costs[selection] < 0) || !unlocked_areas[selection] || (warp_costs[selection] > global.gold) || (selected_area == global.area))
	{
		bitsound(sndMenuReject)
		exit
	}
	
	engage = true;
	instance_destroy();
}
